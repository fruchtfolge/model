*
*  --- Storage model
*
Positive Variables 
  v_curStorage(manType,months)
  v_manureSpring(manType,months)
  v_manureAutumn(manType)
  v_manSlack(manType,months)
;

Equations 
  e_storageBal(manType,months)
  e_manureSpring(manType)
  e_manureAutumn
  e_solidAutumn
  e_maxStorageCap(manType,months)
;
Parameter p_monthlyManure(manType);

* We assume a steady flow of manure into the storages
p_monthlyManure("manure") = p_manure("amount") / 12;
p_monthlyManure("solid") = p_solid("amount") / 12;

* We also assume, that the maximum storage capacity is equal to the monthly
* flow multiplied with the 6 month minimum storage capacity requried by the Fert. Ordinance
Parameter p_maxStoreCap(manType);
p_maxStoreCap("manure") =  manStorage;
p_maxStoreCap("solid") =  solidStorage;

Parameter p_springManMonths(manType,months) /
  manure.feb 0.667
  manure.mrz 0.167
  manure.apr 0.167
  solid.feb  0.333
  solid.mrz  0.333
  solid.apr  0.333
/;

Parameter p_priceFertExport(manType,months);
p_priceFertExport("manure",months) $ (ord(months) < 6) = manPriceSpring;
p_priceFertExport("manure",months) $ (ord(months) > 5) = manPriceAutumn;
p_priceFertExport("solid",months) $ (ord(months) < 6) = solidPriceSpring;
p_priceFertExport("solid",months) $ (ord(months) > 5) = solidPriceAutumn;

*
*  --- We model 3 timepoints:
*      1. The amount of manure in storage at 31.01
*      2. The amount of manure in storage after spring
*      3. The amount of manure in storage after 01.10
*     
e_manureSpring(manType)..
  sum(months, v_manureSpring(manType,months)) =E=
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_manValue(manType,manAmounts,solidAmounts)
  )
;

* Manure spreading can only be done in these months
set manMonths / feb, mrz, apr, mai /;
v_manureSpring.up(manType,months) = 0;
v_manureSpring.up(manType,months) 
  $ sum(manMonths $ (sameas(manMonths,months)),1) = +inf;

e_manureAutumn..
  v_manureAutumn("manure") =E=
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ (ord(manAmounts) > 1),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'autumnFertm3')
  )
;

e_solidAutumn..
  v_manureAutumn("solid") =E=
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ (ord(manAmounts) eq 1),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'autumnFertm3')
  )
;

e_storageBal(manType,months)..
  v_curStorage(manType,months) =E=
* The storage level of the previous month  
    v_curStorage(manType,months - 1)
* The monthly in-flow  
    + p_monthlyManure(manType) $ (not sameas(months,"jan"))
* We assume that the storage is at capacity at the 31.01
    + p_maxStoreCap(manType)   $ sameas(months,"jan") 
* In these months manure is assumed to be spreaded
    - v_manureSpring(manType,months)
* Exports can be done in April (cheaper) or September
    - v_manExports(manType,months) $ (sameas(months,"apr") or sameas(months,"sep"))
* Autumn manure spreading is only assumed to be done in September
    - v_manureAutumn(manType) $ sameas(months,"sep")
* Manure slack for infes treatment
    + v_manSlack(manType,months) 
;

e_maxStorageCap(manType,months)..
  v_curStorage(manType,months) =L=
* at the 01.10, the storage needs to have at least a capacity of 4 months left  
  p_maxStoreCap(manType) 
  - (3 * p_monthlyManure(manType)) $ sameas(months,"okt")
;
