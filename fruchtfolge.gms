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
$include '%WORKDIR%model/crop_rotation.gms'
$include '%WORKDIR%model/fertilizer_ordinance.gms'
$include '%WORKDIR%model/storage.gms'
$include '%WORKDIR%model/greening.gms'
$include '%WORKDIR%model/labour.gms'

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
  $$ifi "%duev2020%"=="true" e_170_plots
  $$ifi "%duev2020%"=="true" e_20_red_plots
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