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
