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

*
*  --- declare objective variable and equation
*
Variable v_obje;
Binary Variable v_binCropPlot(crops,plots);

Equations
  e_obje
;

*
*  --- include model
*
$include '%WORKDIR%model/cropRotation.gms'
$include '%WORKDIR%model/greening.gms'
$include '%WORKDIR%model/labour.gms'

*
*  --- calculate overall gross margin for the planning year
*
e_obje..
  v_obje =E=
    sum((curPlots,curCrops),
    v_binCropPlot(curCrops,curPlots)
    * p_grossMarginData(curPlots,curCrops));

option optCR=0;
model Fruchtfolge / all /;
solve Fruchtfolge using MIP maximizing v_obje;

$include '%WORKDIR%exploiter/createJson.gms'
