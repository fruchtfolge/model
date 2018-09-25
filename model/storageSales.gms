*
*  --- Storage
*
e_storage(crop,type,halfMonth)..
* $ (crop_type(crop,type) $ sum(halfMonth1, crop_type_halfMonth(crop,type,halfMonth1)))..
  v_storage(crop,type,halfMonth)
    =e=
* value of the previous month
        v_storage(crop,type,halfMonth-1)
* initial value after harvest
        + sum(plot, p_yield(crop,type) / harvestPeriods(crop,type) * p_plotAttr(plot,"size") * p_yieldVariation(plot) * v_binCropPlot(crop,type,plot)) $ cropHarvest_halfMonth(crop,type,halfMonth)
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
