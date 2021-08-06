
* -------------------------------
* Fruchtfolge Model - Compatible include file
*
* This is the include file for the shares approach -
* the land endowment of the farm is aggregated into a single plot,
* where shares of the plot may be cultivated with different crops
*
* Institute for Food an Resource Economics
* University of Bonn
* (c) Christoph Pahmeyer, 2020
* -------------------------------

* We let the solver know that plots may be split
$setglobal rmip "true"

* Static data
set plotAttr / size /;
set cropAttr / maxShare /;
set symbol / lt,gt /;
set months /jan,feb,mrz,apr,mai,jun,jul,aug,sep,okt,nov,dez/;
set years / 2001*2050 /;
set manAmounts /0,10,15,20,25,30,40,50,60/;
set nReduction /'0','0.1','0.2','0.3','0.4'/;
set solidAmounts /'0','5','10','12','15','20'/;
set catchCrop /true, false/;
set autumnFert /true, false/;
set man_attr / amount, N, P/;
parameter p_manure(man_attr) /
  amount 0
  n 0
  p 0
/;
parameter p_solid(man_attr) /
  amount 0
  n 0
  p 0
/;

$onempty
$offdigit
set curYear(years) / 2019 /;
$setglobal duev2020 "false"
scalar manStorage /1500 /;
scalar manPriceSpring /12 /;
scalar manPriceAutumn /12 /;
scalar solidStorage /0 /;
scalar solidPriceSpring /0 /;
scalar solidPriceAutumn /0 /;

set data_attr /
jan
feb
mrz
apr
mai
jun
jul
aug
sep
okt
nov
dez
grossMarginHa
efaFactor
autumnFertm3

/;

set curPlots /
  plot1
/;

parameter p_plotData(curPlots,plotAttr) /
  plot1.size 58.824
/;

set curCrops /
  FieldBeans
  WinterWheat
  WinterRye
  WinterBarley
  Maize
  WinterRape
  Potatoes
  Sugarbeets
  SilageMaize
  Oats  
/;

set cropGroup /
  Legumes
  Wheat
  Rye
  Barley
  Maize
  Oilseeds
  Potatoes
  Sugarbeets
  Oats  
/;

set crops_cropGroup(curCrops,cropGroup) /
  FieldBeans.Legumes
  WinterWheat.Wheat
  WinterRye.Rye
  WinterBarley.Barley
  Maize.Maize
  WinterRape.Oilseeds
  Potatoes.Potatoes
  Sugarbeets.Sugarbeets
  SilageMaize.Maize
  Oats.Oats
/;

parameter p_cropData(curCrops,cropAttr) /
  FieldBeans.maxShare 11.765
  WinterWheat.maxShare 29.412
  WinterRye.maxShare 29.412
  WinterBarley.maxShare 29.412
  Maize.maxShare 58.824
  WinterRape.maxShare 11.765
  Potatoes.maxShare 11.765
  Sugarbeets.maxShare 11.765
  SilageMaize.maxShare 58.824
  Oats.maxShare 29.412
/;

parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,*) /
plot1.FieldBeans.'0'.'0'.'0'.'false'.'false'.MRZ 2.766
plot1.FieldBeans.'0'.'0'.'0'.'false'.'false'.MAI 0.785
plot1.FieldBeans.'0'.'0'.'0'.'false'.'false'.AUG 1.817
plot1.FieldBeans.'0'.'0'.'0'.'false'.'false'.SEP 0.893
plot1.FieldBeans.'0'.'0'.'0'.'false'.'false'.OKT 2.412
plot1.FieldBeans.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 134.530
plot1.FieldBeans.'0'.'0'.'0'.'false'.'false'.'efaFactor' 1
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.FEB 0.463
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.MRZ 0.148
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.APR 1.691
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.MAI 0.148
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.JUN 0.899
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.AUG 2.932
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.SEP 2.447
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.OKT 2.765
plot1.WinterWheat.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 513.211
plot1.WinterRye.'0'.'0'.'0'.'false'.'false'.FEB 0.463
plot1.WinterRye.'0'.'0'.'0'.'false'.'false'.MRZ 0.148
plot1.WinterRye.'0'.'0'.'0'.'false'.'false'.APR 0.895
plot1.WinterRye.'0'.'0'.'0'.'false'.'false'.AUG 2.791
plot1.WinterRye.'0'.'0'.'0'.'false'.'false'.SEP 4.201
plot1.WinterRye.'0'.'0'.'0'.'false'.'false'.OKT 0.996
plot1.WinterRye.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 174.280
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.FEB 0.463
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.MRZ 0.148
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.APR 1.687
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.JUL 2.822
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.AUG 0.908
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.SEP 3.442
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.OKT 0.996
plot1.WinterBarley.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 453.439
plot1.Maize.'0'.'0'.'0'.'false'.'false'.MRZ 0.207
plot1.Maize.'0'.'0'.'0'.'false'.'false'.APR 3.243
plot1.Maize.'0'.'0'.'0'.'false'.'false'.MAI 1.129
plot1.Maize.'0'.'0'.'0'.'false'.'false'.SEP 0.036
plot1.Maize.'0'.'0'.'0'.'false'.'false'.OKT 5.073
plot1.Maize.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 552.924
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.JAN 0.195
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.FEB 0.268
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.MRZ 0.268
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.APR 0.932
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.JUL 4.338
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.AUG 2.979
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.OKT 0.785
plot1.WinterRape.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 435.577
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.MRZ 1.062
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.APR 2.803
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.MAI 1.047
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.JUN 1.952
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.JUL 2.928
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.AUG 3.430
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.SEP 19.012
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.OKT 0.145
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.NOV 2.515
plot1.Potatoes.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 3811.780
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.FEB 0.207
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.MRZ 2.456
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.MAI 0.847
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.JUL 0.154
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.AUG 0.847
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.SEP 1.581
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.OKT 2.626
plot1.Sugarbeets.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 1359.887
plot1.SilageMaize.'0'.'0'.'0'.'false'.'false'.MRZ 0.573
plot1.SilageMaize.'0'.'0'.'0'.'false'.'false'.APR 2.595
plot1.SilageMaize.'0'.'0'.'0'.'false'.'false'.MAI 0.955
plot1.SilageMaize.'0'.'0'.'0'.'false'.'false'.SEP 6.168
plot1.SilageMaize.'0'.'0'.'0'.'false'.'false'.OKT 2.107
plot1.SilageMaize.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 616.182
plot1.Oats.'0'.'0'.'0'.'false'.'false'.FEB 0.852
plot1.Oats.'0'.'0'.'0'.'false'.'false'.MRZ 2.233
plot1.Oats.'0'.'0'.'0'.'false'.'false'.MAI 0.932
plot1.Oats.'0'.'0'.'0'.'false'.'false'.JUL 1.991
plot1.Oats.'0'.'0'.'0'.'false'.'false'.AUG 0.859
plot1.Oats.'0'.'0'.'0'.'false'.'false'.SEP 0.805
plot1.Oats.'0'.'0'.'0'.'false'.'false'.OKT 1.626
plot1.Oats.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 244.897
  
/;

*-------------------------------
* Fruchtfolge
*
* A spatial crop rotation model
* serving as a base for the
* Fruchtfolge web application
* (c) Christoph Pahmeyer, 2019
*-------------------------------
* for the paper analysis, no permanent pastures and or endangered plots are considered
$onempty
set plots_permPast(curPlots) /
/;
set plots_duevEndangered(curPlots) /
/;
$offempty
*
*  --- initiate global parameters for Greening evaluation
*
scalar  p_totLand;
scalar  p_totArabLand;
scalar  p_totGreenLand;
scalar  p_restLand;
scalar  p_shareGreenLand;
scalar  p_grassLandExempt;
p_totLand = sum(curPlots, p_plotData(curPlots,"size"));
p_totArabLand = sum(curPlots $ (not plots_permPast(curPlots)), p_plotData(curPlots,"size"));
p_totGreenLand = p_totLand - p_totArabLand;
p_restLand = p_totLand - p_totGreenLand;
p_shareGreenLand = p_totGreenLand / p_totLand;
p_grassLandExempt $((p_shareGreenLand > 0.75) $(p_restLand < 30)) = 1;
* 
*  --- initiate a cross set of all allowed combinations, might speed up generation time
*
$offOrder
set p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert);
p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
  $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'grossMarginHa')
  = YES;
alias (cropGroup,cropGroup1);
alias (curCrops,curCrops1);
scalar M / 99999 /;
*
*  --- declare objective variable and equation
*
Variables
  v_obje
  v_totGM
;
Positive Variables
  v_devShares(curCrops)
  v_devEfa5
  v_devEfa75
  v_devEfa95
$iftheni.constraints defined constraints
  v_devUserShares(constraints,curCrops,curCrops)
$endif.constraints
  v_devOneCrop(curPlots)
$iftheni.labour defined p_availLabour
  v_devLabour(months)
$endif.labour
;
Binary Variables
  v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
;
Equations
  e_obje
  e_totGM
;
*
*  --- include model
*
Equations
  e_maxShares(curCrops)
  e_oneCropPlot(curPlots)
$iftheni.constraints defined constraints
  e_minimumShares(constraints,curCrops,curCrops1)
  e_maximumShares(constraints,curCrops,curCrops1) 
$endif.constraints
;

*
*  --- each crop cannot exceed the maximum allowed share specified by the users
*      crop rotational settings
*
e_maxShares(curCrops) $ p_cropData(curCrops,"maxShare")..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ (not plots_permPast(curPlots)),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
  )
  =L= 
    (p_totArabLand * p_cropData(curCrops,"maxShare") / 100)
    + v_devShares(curCrops)
;

*
*  --- ensure that only one crop is grown on a plot
*
e_oneCropPlot(curPlots)..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert))
  + v_devOneCrop(curPlots)
  =E= 1
;

*
*  --- prohibit growing a crop on a plot when there is no gross margin present
*
 v_binCropPlot.up(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) $ ((not
   p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert))
   $ (not plots_permPast(curPlots))) = 0;
  
*
*  --- Enter user specified constraints into the model, 
*
$iftheni.constraints defined constraints
e_minimumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (not (constraints_lt(constraints,'lt'))))..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert), 
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) 
    * p_plotData(curPlots,'size'))
    + v_devUserShares(constraints,curCrops,curCrops1)
  =G= p_constraint(constraints,curCrops,curCrops1) 
;  

e_maximumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (constraints_lt(constraints,'lt')))..
   sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
     v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) 
     * p_plotData(curPlots,'size'))
    + sum(p_c_m_s_n_z_a(curPlots,curCrops1,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
      v_binCropPlot(curPlots,curCrops1,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) 
      * p_plotData(curPlots,'size'))
    =L= 
    p_constraint(constraints,curCrops,curCrops1)
    + v_devUserShares(constraints,curCrops,curCrops1)
;  
$endif.constraints

set manType / manure,solid /;
parameter p_excr(manType,man_attr);
p_excr("manure",man_attr) = p_manure(man_attr);
p_excr("solid",man_attr) = p_solid(man_attr);

positive variables
  v_manExports(manType,months)
  v_170Slack
  v_170PlotSlack(curPlots)
  v_20RedSlack
;
Equations
  e_man_balance
  e_170_avg
;


Parameter p_manValue(manType,manAmounts,solidAmounts) /
  'manure'.'0'.set.solidAmounts 0
  'manure'.'10'.set.solidAmounts 10
  'manure'.'15'.set.solidAmounts 15
  'manure'.'20'.set.solidAmounts 20
  'manure'.'25'.set.solidAmounts 25
  'manure'.'30'.set.solidAmounts 30
  'manure'.'40'.set.solidAmounts 40
  'manure'.'50'.set.solidAmounts 50
  'manure'.'60'.set.solidAmounts 60
  'solid'.set.manAmounts.'0' 0
  'solid'.set.manAmounts.'5' 5
  'solid'.set.manAmounts.'10' 10
  'solid'.set.manAmounts.'12' 15
  'solid'.set.manAmounts.'15' 20
  'solid'.set.manAmounts.'20' 25
/;


e_man_balance(manType)..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_manValue(manType,manAmounts,solidAmounts))
    + sum(months, v_manExports(manType,months))
    =E= p_excr(manType,"amount")
;

$iftheni.duev2020 "%duev2020%"=="true"
  parameter p_notEndangeredLand;
  p_notEndangeredLand = sum((curPlots) 
    $ (not plots_duevEndangered(curPlots)), p_plotData(curPlots,"size"));
      
  e_170_avg $ p_notEndangeredLand..
    sum((p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),manType)
      $ (not plots_duevEndangered(curPlots)),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     ) /p_notEndangeredLand =L= 170 + v_170Slack
 ;
* In "red areas", the 170kg N maximum rule is active for every single field,
* instead of the average of all fields
  e_170_plots(curPlots) $ (plots_duevEndangered(curPlots) )..
   sum((p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),manType),
   v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_manValue(manType,manAmounts,solidAmounts)
    * p_manure("n")
    * 80 / 100
    )  =L= 170 + v_170PlotSlack(curPlots)
  ;
* In addition to this, nitrogen fertilizer needs to be reduced by a minimum average of 
* 20% on all fields in a "red area "of the farm
  e_20_red_plots $ sum(curPlots $ plots_duevEndangered(curPlots), 1)..
    sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
      $ plots_duevEndangered(curPlots),
     v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
      * (ord(nReduction) - 1) * 10
      * p_plotData(curPlots,"size")
    ) 
    / sum(curPlots $ plots_duevEndangered(curPlots), p_plotData(curPlots,"size")) 
    =G= 20 - v_20RedSlack
  ;
$else.duev2020
  e_170_avg..
    sum((p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),manType), 
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     )/p_totLand =L= 170 + v_170Slack
$endif.duev2020
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

Equations
  e_efa
  e_75diversification(cropGroup)
  e_95diversification(cropGroup,cropGroup1)
;

* Only activate ecological focus area equation if arable land is greater than 15ha
e_efa $ ((p_totArabLand >= 15) $(not p_grassLandExempt))..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
      v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
      * p_plotData(curPlots,"size")
      * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'efaFactor')
  )
  + v_devEfa5
  =G= 
  p_totArabLand * 0.05
;


* Only activate 75% diversifaction rule if arable land is greater than 10ha
e_75diversification(cropGroup) $ ((p_totArabLand >= 10) $(not p_grassLandExempt))..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ ((not plots_permPast(curPlots))
    $ crops_cropGroup(curCrops,cropGroup)),
      v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
      * p_plotData(curPlots,"size")
  )
  =L= 
  p_totArabLand * 0.75
  + v_devEfa75
  
;

* Only activate 95% diversifaction rule if arable land is greater than 30ha
e_95diversification(cropGroup,cropGroup1)
  $ ((p_totArabLand >= 30)
  $ (not p_grassLandExempt)
  $ (not sameas(cropGroup,cropGroup1)))..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ crops_cropGroup(curCrops,cropGroup),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
  )
  +
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ crops_cropGroup(curCrops,cropGroup1),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
  )
  =L= 
  p_totArabLand * 0.95
  + v_devEfa95
;

*
*  --- Only account for labour constraints when parameter is defined
*
$iftheni.labour defined p_availLabour
Equations
  e_maxLabour(months)
*  e_maxFieldWorkDays(months)
;

e_maxLabour(months)..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
  v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
  * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,months)
  )
  =L= 
  p_availLabour(months)
  + v_devLabour(months)
;

*
*  --- we assume a maximum of 14h of work per day
*
$ontext
e_maxFieldWorkDays(months)..
  sum((curPlots,curCrops,halfMonths) $ months_halfMonths(months,halfMonths),
  v_binCropPlot(curCrops,curPlots)
  * p_tractorReq(crops,halfMonths)
  =L= p_availFieldWorkDays(months) * p_availTractHours(month)
;
$offtext

$endif.labour

*
*  --- calculate overall gross margin for the planning year
*
e_totGM..
  v_totGM =E=
    sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert), 
      v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
      * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'grossMarginHa')
      * p_plotData(curPlots,'size')
    )
    - sum((manType,months), v_manExports(manType,months) * p_priceFertExport(manType,months));
e_obje..
  v_obje =E=
    v_totGM
    - sum(curCrops, v_devShares(curCrops) * M)
    - (v_devEfa5 * M)
    - (v_devEfa75 * M)
    - (v_devEfa95 * M)
    - sum(curPlots, v_devOneCrop(curPlots) * M * 10)
    - (sum((manType,months), v_manSlack(manType,months) * M))
    - (v_170Slack * M)
    - ((sum((manType,curPlots), v_170PlotSlack(curPlots))) * M)
    - (v_20RedSlack * M)
$iftheni.constraints defined constraints
    - sum((constraints,curCrops,curCrops1),
      v_devUserShares(constraints,curCrops,curCrops1) * M)
$endif.constraints
$iftheni.labour defined p_availLabour
    - sum(months, v_devLabour(months) * 1000)
$endif.labour
;
*
*  --- define upper bounds for slack variables
*
v_devShares.up(curCrops) = p_totArabLand;
v_devEfa5.up = p_totArabLand * 0.05;
v_devEfa75.up = p_totArabLand * 0.25;
v_devEfa95.up = p_totArabLand;
v_devOneCrop.up(curPlots) = 1;
$iftheni.constraints defined constraints
  v_devUserShares.up(constraints,curCrops,curCrops1) = p_totArabLand;
$endif.constraints
$iftheni.labour defined p_availLabour
  v_devLabour.up(months) = 15000;
$endif.labour
if (card(curPlots)<30,
    option optCR=0.0;
  elseif card(curPlots)<50, 
    option optCR=0.02;
  else 
    option optCR=0.04;
);
model Fruchtfolge /
  e_obje
  e_totGM
  e_maxShares
  e_oneCropPlot
  e_170_avg
  e_storageBal
  e_manureSpring
  e_manureAutumn
  e_solidAutumn
  e_maxStorageCap
$iftheni.constraints defined constraints
  e_minimumShares
  e_maximumShares
$endif.constraints
  e_efa
  e_75diversification
  e_95diversification
$iftheni.labour defined p_availLabour
  e_maxLabour
$endif.labour
/;
$iftheni.rmip "%rmip%"=="true"
  solve Fruchtfolge using RMIP maximizing v_obje;
$else.rmip
 solve Fruchtfolge using MIP maximizing v_obje;
$endif.rmip

*v_binCropPlot.lo(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) =
parameter p_cropShares(curCrops,*);
parameter p_check;
p_cropShares(curCrops,'aggregate') = sum((curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert), v_binCropPlot.l(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
 * p_plotData(curPlots,'size'));
display p_cropShares;