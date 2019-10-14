Equations
  e_maxShares(curCrops)
  e_oneCropPlot(curPlots)
  e_permPast(curCrops,curPlots)
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
  sum((curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa') , 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
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
  sum((curCrops,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert))
  + v_devOneCrop(curPlots)
  =E= 1
;

*
*  --- prohibit growing a crop on a plot when there is no gross margin present
*
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert) $ ((not
  p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,"grossMarginHa"))
  $ (not plots_permPast(curPlots))) = 0;


*
*  --- root crops can obly be grown on root crop capable plots
*
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert) 
  $ (crops_rootCrop(curCrops) 
  $ (not plots_rootCropCap(curPlots))) = 0;

*
*  --- when a cropping factor of 0 is given for a previous
*      crop - crop  combination,
*      the crop can't be grown
*  
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
  $ sum((years,curYear,curCrops1) 
  $ ((not sameas(curCrops1,'')) 
  $ sameas(years,curYear)
  $ sum((cropGroup) $ (crops_cropGroup(curCrops,cropGroup) 
    $ plots_years_cropGroup(curPlots,years - 1,cropGroup)), 1)
  $ (not p_croppingFactor(curCrops1,curCrops))),1) = 0;

*
*  --- when a plot is permanent pasture, it has to be used in the same 
*      way as in the previous year
*
e_permPast(curCrops,curPlots)
  $ (plots_permPast(curPlots)
  $ (sum((years,curYear) 
     $ (sameas(years,curYear) 
     $ plots_years_crops(curPlots,years - 1,curCrops)),
    1))) ..
  sum((manAmounts,solidAmounts,catchCrop,autumnFert),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert))
  =G= 1
;

*
*  --- allow permanent pasture crops only on permanent pastures
*  
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
  $ ((not plots_permPast(curPlots))
  $ (sum(permPastCrops $ sameas(curCrops,permPastCrops),1)))
  = 0;
  
*
*  --- Enter user specified constraints into the model, 
*
$iftheni.constraints defined constraints
e_minimumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (not (constraints_lt(constraints,'lt'))))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) * p_plotData(curPlots,'size'))
    + v_devUserShares(constraints,curCrops,curCrops1)
    =G= p_constraint(constraints,curCrops,curCrops1) 
;  

e_maximumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (constraints_lt(constraints,'lt')))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) * p_plotData(curPlots,'size'))
    =L= 
    p_constraint(constraints,curCrops,curCrops1)
    + v_devUserShares(constraints,curCrops,curCrops1)
;  
$endif.constraints
