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
  sum((curPlots,manAmounts,solidAmounts), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
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
  sum((curCrops,manAmounts,solidAmounts), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts))
  + v_devOneCrop(curPlots)
  =E= 1
;

*
*  --- prohibit growing a crop on a plot when there is no gross margin present
*
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts) $ (not
  p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,"grossMarginHa")) = 0;


*
*  --- root crops can obly be grown on root crop capable plots
*
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts) 
  $ (crops_rootCrop(curCrops) 
  $ (not plots_rootCropCap(curPlots))) = 0;

*
*  --- when a cropping factor of 0 is given for a previous
*      crop - crop  combination,
*      the crop can't be grown
*  
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts)
  $ sum((years,curYear,curCrops1) 
*  $ ((not sameas(curCrops1,'')) 
  $ (sameas(years,curYear)
  $ sum((cropGroup) $ (crops_cropGroup(curCrops,cropGroup) 
    $ plots_years_cropGroup(curPlots,years - 1,cropGroup)), 1)
  $ (not p_croppingFactor(curCrops1,curCrops))),1) = 0;

*
*  --- when a plot is permanent pasture, it has to be used in the same 
*      way as in the previous year
*
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts)
  $ (plots_permPast(curPlots)
  $ (not sum((years,curYear) 
     $ (sameas(years,curYear) 
     $ plots_years_crops(curPlots,years - 1,curCrops)),
    1))) 
  = 0;

*
*  --- allow permanent pasture crops only on permanent pastures
*  
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts)
  $ ((not plots_permPast(curPlots))
  $ (sum(permPastCrops $ sameas(curCrops,permPastCrops),1)))
  = 0;

*
*  --- prohibit a crop - manure combination if it exceeds n and p from DBE calculation
*
set actManAmounts(manAmounts);
actManAmounts(manAmounts) $ (manAmounts.pos gt 1) = YES;
set actSolidAmounts(solidAmounts);
actSolidAmounts(solidAmounts) $ (solidAmounts.pos gt 1) = YES;

v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts) 
  $ ((p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,"minNAmount") eq 0)
  $ ((manAmounts.pos > 1)
  or (solidAmounts.pos > 1)))
  = 0;

v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts) 
  $ ((p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,"minPAmount") eq 0)
  $ ((manAmounts.pos > 1)
  or (solidAmounts.pos > 1)))
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
