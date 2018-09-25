*
*  --- Constraints
*

* only one crop on a plot in each month
e_oneCropPlotMonth(plot,halfMonth)..
  sum((crop,type) $ sum(halfMonth1,crop_type_halfMonth(crop,type,halfMonth1)), v_binCropPlotMonth(crop,type,plot,halfMonth))
    =l= 1;
;

* ensure that binary variable has the same value through its growth period
e_oneCropGrowthPeriod(crop,type,plot) $ (crop_type(crop,type) $ sum(halfMonth $ crop_type_halfMonth(crop,type,halfMonth),1))..
  v_binCropPlot(crop,type,plot) * sum((halfMonth) $ crop_type_halfMonth(crop,type,halfMonth),1)
    =e=
        sum(halfMonth1 $ crop_type_halfMonth(crop,type,halfMonth1), v_binCropPlotMonth(crop,type,plot,halfMonth1))
;

* ensure that crop can only be grown if a growing period is specified
v_binCropPlot.up(crop,type,plot) $ (not sum(halfMonth, crop_type_halfMonth(crop,type,halfMonth))) = 0;


*
*  --- Objective function
*
e_obje..
  v_obje =e= sum((crop,type,plot), v_contributionMarginPlot(crop,type,plot));
