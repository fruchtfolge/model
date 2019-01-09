Equations
    e_oneCropPlot(plots)
;

e_oneCropPlot(curPlots)..
  sum(curCrops, v_binCropPlot(curCrops,curPlots))
  =L= 1
;
