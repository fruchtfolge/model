Parameters
  p_fieldWorkHourNeed(crop,type,halfMonth,labReqLevl)
  p_machNeed(crop,type,machType,halfMonth,machLifeUnit)
  p_varCost(crop,type,plotSize)
  p_yieldVariation(plot)
  p_varCostDetail(crop,type,halfMonth,operation,plotSize)
  harvestPeriods(crop,type)
  start_crop_halfMonth(crop,type)
  end_crop_halfMonth(crop,type)
;

harvestPeriods(crop,type) = sum(halfMonth $ cropHarvest_halfMonth(crop,type,halfMonth), 1);
scalar M /100000/;
