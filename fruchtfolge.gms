*-------------------------------
* Fruchtfolge
*
* A spatial crop rotation model
* serving as a base for the
* Fruchtfolge web application
* (c) Christoph Pahmeyer, 2019
*-------------------------------
*$include 'test/include/farm1.gms'
*$setglobal WORKDIR '/Users/toffi1/UniCloud/Programmieren/Fruchtfolge_Modell/'
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

Binary Variables
  v_binCropPlot(curCrops,curPlots)
  v_binCatchCrop(curCrops,curPlots)
;

Equations
  e_obje
;

*
*  --- include model
*
$include '%WORKDIR%model/catchCrop.gms'
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
    * p_grossMarginData(curPlots,curCrops)
    - v_binCatchCrop(curCrops,curPlots)
    * p_plotData(curPlots,'size')
    * p_costCatchCrop(curPlots));

option optCR=0;
model Fruchtfolge / all /;
Fruchtfolge.limrow = 10000;
Fruchtfolge.limcol = 10000;
solve Fruchtfolge using MIP maximizing v_obje;

$include '%WORKDIR%exploiter/createJson.gms'
