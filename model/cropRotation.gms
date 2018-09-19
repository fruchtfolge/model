*
*  --- Calculation of contribution margins, direct costs and variable costs
*

e_contributionMarginPlot(crop,type,plot)..
  v_contributionMarginPlot(crop,type,plot)
    =e=
* Revenue
        sum(halfMonth, v_salesQuantTon(crop,type,halfMonth)
          * smax(month $ month_halfMonth(month,halfMonth), p_outputPricesEuroTon(crop,type,month)))
          * (p_plotAttr(plot,"size") / sum(plots, p_plotAttr(plots,"size")))
* Direct costs
          - v_directCosts(crop,type,plot)
* Machine costs
          - v_machineCosts(crop,type,plot)
* Other costs
;

e_directCosts(crop,type,plot)..
  v_directCosts(crop,type,plot)
    =e=
         p_seeds(crop,type)
      +  sum((fertilizer,month), v_synthFertDist(crop,type,plot,fertilizer,month) * p_inputPrice(fertilizer))
;

e_machineCosts(crop,type,plot)..
  v_machineCosts(crop,type,plot)
    =e=
         sum(plotSize $ plot_plotSize(plot,plotSize), p_varCost(crop,type,plotSize))
      +  sum((fertilizer,month), v_synthFertDist(crop,type,plot,fertilizer,month)
      +  v_manureDist(crop,type,plot,month))
;


*
*  --- Storage
*
e_storage(crop,type,halfMonth)..
  v_storage(crop,type,halfMonth)
    =e=
* value of the previous month
        v_storage(crop,type,halfMonth-1)
* initial value after harvest
        + sum(plot, p_yield(crop,type) / harvestPeriods(crop,type) * p_plotAttr(plot,"size") * p_yieldVariation(plot) * v_binCropPlotMonth(crop,type,plot,halfMonth)) $ cropHarvest_halfMonth(crop,type,halfMonth)
* storage losses
*        * (1 - sum(storLength $ crop_storLength_month(crop,storLength,month),
*             p_storageLosses(crop,storLength)))
        - v_salesQuantTon(crop,type,halfMonth)
;
*
*  --- Sales quantity cannot exceed storage
*
e_salesQuantity(crop,type,halfMonth)..
  v_salesQuantTon(crop,type,halfMonth)
    =l= v_storage(crop,type,halfMonth)
;

*
*  --- Constraints
*
* only one crop on a plot in each month
e_oneCropPlotMonth(plot,halfMonth)..
  sum((crop,type), v_binCropPlotMonth(crop,type,plot,halfMonth))
    =l= 1;
;

* ensure that binary variable has the same value through its growth period
e_oneCropGrowthPeriod(crop,type,plot,halfMonth) $ crop_type_halfMonth(crop,type,halfMonth)..
  v_binCropPlotMonth(crop,type,plot,halfMonth) * (- M)
    =l=
        sum(halfMonth1, v_binCropPlotMonth(crop,type,plot,halfMonth1))
;

e_oneCropPlot(crop,type,plot)..
  v_binCropPlot(crop,type,plot) * (- M)
    =l= sum(halfMonth $ crop_type_halfMonth(crop,type,halfMonth), v_binCropPlotMonth(crop,type,plot,halfMonth))
;
*
*  --- Objective function
*
e_obje..
  v_obje =e= sum((crop,type,plot), v_contributionMarginPlot(crop,type,plot));
