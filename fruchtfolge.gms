*-------------------------------
* Fruchtfolge
*
* A spatial crop rotation model
* serving as a base for the
* Fruchtfolge web application
* (c) Christoph Pahmeyer, 2019
*-------------------------------
*
*  --- initiate global parameters for Greening evaluation
*
scalar  p_totLand;
scalar  p_totArabLand;
scalar  p_totGreenLand;
p_totLand = sum(curPlots, p_plotData(curPlots,"size"));
p_totArabLand = sum(curPlots $ (not plots_permPast(curPlots)), p_plotData(curPlots,"size"));
p_totGreenLand = p_totLand - p_totArabLand;

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
  v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
  v_binCatchCrop(curCrops,curPlots)
;

Equations
  e_obje
  e_totGM
;

*
*  --- include model
*
$include '%WORKDIR%model/catch_crop.gms'
$include '%WORKDIR%model/crop_rotation.gms'
$include '%WORKDIR%model/fertilizer_ordinance.gms'
$include '%WORKDIR%model/greening.gms'
$include '%WORKDIR%model/labour.gms'

*
*  --- calculate overall gross margin for the planning year
*
e_totGM..
  v_totGM =E=
    sum((curPlots,curCrops),
      (sum((manAmounts,solidAmounts), 
        v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
        * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,'grossMarginHa')
       )
       - (v_binCatchCrop(curCrops,curPlots)
       * p_costCatchCrop(curPlots))
      )
      * p_plotData(curPlots,'size')
    )
    - sum(manType, v_manExports(manType) * 15);

e_obje..
  v_obje =E=
    v_totGM
    - sum(curCrops, v_devShares(curCrops) * M)
    - (v_devEfa5 * M)
    - (v_devEfa75 * M)
    - (v_devEfa95 * M)
    - sum(curPlots, v_devOneCrop(curPlots) * M * 10)
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

option optCR=0.02;

model Fruchtfolge /
  e_obje
  e_totGM
  e_oneCatchCropPlot
  e_catchCropEqBinCrop
  e_maxShares
  e_oneCropPlot
  e_man_balance
  e_170_avg
  $$ifi "%duev2020%"=="true" e_170_plots
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

*Fruchtfolge.limrow = 1000;
*Fruchtfolge.limcol = 1000;
solve Fruchtfolge using MIP maximizing v_obje;

$include '%WORKDIR%exploiter/createJson.gms'
