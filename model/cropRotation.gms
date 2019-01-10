Equations
    e_oneCropPlot(plots)
    e_minimumShares(constraints,curCrops,curCrops1)
    e_maximumShares(constraints,curCrops,curCrops1) 
;

e_oneCropPlot(curPlots)..
  sum(curCrops, v_binCropPlot(curCrops,curPlots))
  =L= 1
;

e_minimumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (not (constraints_lt(constraints,'lt'))))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) + p_plotData(curPlots,'size'))
    =G= p_constraint(constraints,curCrops,curCrops1) 
;  

e_maximumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (constraints_lt(constraints,'lt')))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) + p_plotData(curPlots,'size'))
    =L= p_constraint(constraints,curCrops,curCrops1) 
;  
