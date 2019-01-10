*-------------------------------
* Fruchtfolge
*
* A spatial crop rotation model
* serving as a base for the
* Fruchtfolge web application
* (c) Christoph Pahmeyer, 2019
*-------------------------------

* load individual farm settings
$include 'include/include.gms'

* create gross margins per plot
$include 'coefficients/grossMargin.gms'

* define all model variables
variable v_obje;

binary variables
  v_binCropPlot(curCrops,curPlots)
;

Equations
  e_obje
;

* load model equations
$include 'model/cropRotation.gms'

e_obje..
  v_obje =E=
    sum((curPlots,curCrops,curYear),
    v_binCropPlot(curCrops,curPlots)
    * p_grossMarginPlot(curPlots,curYear,curCrops,"grossMargin"))

model Fruchtfolge "Entire Fruchtfolge model" /
  e_obje
  e_oneCropPlot
  e_minimumShares
  e_maximumShares
 /;

solve Fruchtfolge using MIP maximizing v_obje;

$ontext
File results / results.txt /;
results.pc = 5;
put results;
put "model_status",  Fruchtfolge.modelstat /;
put "solver_status", Fruchtfolge.solvestat /;
put "objective", v_obje.l /;
loop((curCrops,curPlots),
  put$(v_binCropPlot.l(curCrops,curPlots) > 0) "recommendations", curPlots.tl, curCrops.tl /
);
loop((curPlots,curCrops,years,grossMarginAttr),
  put "grossMargins", curPlots.tl,curCrops.tl, years.tl, grossMarginAttr.tl, p_grossMarginPlot(curPlots,years,curCrops,grossMarginAttr) /
);
putclose;
$offtext

File results / results.json /;
*results.pc = 5;
results.lw = 40;
put results;
put "{"
put '"model_status":',  Fruchtfolge.modelstat, "," /;
put '"solver_status":', Fruchtfolge.solvestat, "," /;
put '"objective":', v_obje.l, "," /;
put '"recommendation":', "{"/;
loop((curPlots),
  put '"', curPlots.tl, '": {' /
  loop(curCrops,
     put$(ord(curCrops) < card(curCrops)) '"', curCrops.tl, '":' , v_binCropPlot.l(curCrops,curPlots), "," /
     put$(ord(curCrops) = card(curCrops)) '"', curCrops.tl, '":' , v_binCropPlot.l(curCrops,curPlots) /
*    put$(v_binCropPlot.l(curCrops,curPlots) > 0) '"', curPlots.tl, '":', '"', curCrops.tl, '"' /

  )
  put$(ord(curPlots) < card(curPlots)) "}," /
  put$(ord(curPlots) = card(curPlots)) "}" /
);
put "}," /;
put '"grossMargins":', "{"/;
loop(curPlots,
  put '"', curPlots.tl, '": {' /
  loop(years,
    put '"', years.tl, '": {' /
    loop(curCrops,
      put '"', curCrops.tl, '": {' /
      loop(grossMarginAttr,
        put$(ord(grossMarginAttr) < card(grossMarginAttr)) '"', grossMarginAttr.tl, '":', p_grossMarginPlot(curPlots,years,curCrops,grossMarginAttr), ',' /
        put$(ord(grossMarginAttr) = card(grossMarginAttr)) '"', grossMarginAttr.tl, '":', p_grossMarginPlot(curPlots,years,curCrops,grossMarginAttr) /
      )
      put$(ord(curCrops) < card(curCrops)) "}," /
      put$(ord(curCrops) = card(curCrops)) "}" /
    )
    put$(ord(years) < card(years)) "}," /
    put$(ord(years) = card(years)) "}" /
  )
  put$(ord(curPlots) < card(curPlots)) "}," /
  put$(ord(curPlots) = card(curPlots)) "}" /
);
put "}" /;
put "}" /;
putclose;

execute 'node js/script.js'
