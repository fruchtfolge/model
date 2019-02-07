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
  sum(curPlots, 
    v_binCropPlot(curCrops,curPlots)
    * p_plotData(curPlots,"size")
  )
  =L= p_totArabLand * p_cropData(curCrops,"maxShare") / 100
;

*
*  --- ensure that only one crop is grown on a plot
*
e_oneCropPlot(curPlots)..
  sum(curCrops, v_binCropPlot(curCrops,curPlots))
  =E= 1
;

*
*  --- prohibit growing a crop on a plot when there is no gross margin present
*
v_binCropPlot.up(curCrops,curPlots) $ (not p_grossMarginData(curPlots,curCrops)) = 0;
*
*  --- root crops can obly be grown on root crop capable plots
*
v_binCropPlot.up(curCrops,curPlots) 
  $ (crops_rootCrop(curCrops) 
  $ (not plots_rootCropCap(curPlots))) = 0;
  
*
*  --- Enter user specified constraints into the model, 
*
$iftheni.constraints defined constraints
e_minimumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (not (constraints_lt(constraints,'lt'))))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) * p_plotData(curPlots,'size'))
    =G= p_constraint(constraints,curCrops,curCrops1) 
;  

e_maximumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (constraints_lt(constraints,'lt')))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) * p_plotData(curPlots,'size'))
    =L= p_constraint(constraints,curCrops,curCrops1) 
;  
$endif.constraints
