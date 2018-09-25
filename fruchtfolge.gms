*-------------------------------
* Fruchtfolge
*
* A spatial crop rotation model
* serving as a base for the
* Fruchtfolge web application
*-------------------------------

* load all sets into the model
$include 'coefficients/sets.gms'
* declare parameters
$include 'coefficients/parameters.gms'
* define parameters with values
$include 'coefficients/prices.gms'
$include 'coefficients/yields.gms'
$include 'coefficients/inputCosts.gms'
$include 'coefficients/plotAttributes.gms'
$include 'coefficients/fieldWorkingDays.gms'
$include 'coefficients/machines.gms'

* define all model variables
variable v_obje;

positive Variables
  v_contributionMarginPlot(crop,type,plot)
  v_directCosts(crop,type,plot)
  v_directCosts(crop,type,plot)
  v_machineCosts(crop,type,plot)
  v_storage(crop,type,halfMonth)
  v_salesQuantTon(crop,type,halfMonth)
  v_synthFertDist(crop,type,plot,fertilizer,month)
  v_manureDist(crop,type,plot,month)
;

binary variables
  v_binCropPlotMonth(crop,type,plot,halfMonth)
  v_binCropPlot(crop,type,plot)
;

Equations
  e_contributionMarginPlot(crop,type,plot)
  e_directCosts(crop,type,plot)
  e_machineCosts(crop,type,plot)
  e_storage(crop,type,halfMonth)
  e_salesQuantity(crop,type,halfMonth)
  e_oneCropPlotMonth(plot,halfMonth)
  e_oneCropGrowthPeriod(crop,type,plot)
  e_obje
;

* load model equations
$include 'model/contributionMargin.gms'
$include 'model/storageSales.gms'
$include 'model/cropRotation.gms'

model Fruchtfolge "Entire Fruchtfolge model" /
  e_contributionMarginPlot
*  e_directCosts
*  e_machineCosts
  e_storage
  e_salesQuantity
  e_oneCropPlotMonth
  e_oneCropGrowthPeriod
  e_obje
 /;

solve Fruchtfolge using MIP maximizing v_obje;
