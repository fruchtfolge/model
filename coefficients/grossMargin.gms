alias(curCrops,curCrops1)
Parameter p_grossMarginPlot(curPlots,years,curCrops,grossMarginAttr);

p_grossMarginPlot(curPlots,years,curCrops,"yield")
  = p_grossMarginData(curCrops,years,"yield")
;

p_grossMarginPlot(curPlots,years,curCrops,'yieldCap')
  = 1
;

p_grossMarginPlot(curPlots,years,curCrops,'croppingFactor')
  =
* correct for crop rotational effect, if any
$iftheni.cf defined plots_years_crops
   sum(curCrops1 $ plots_years_crops(plots,years - 1,curCrops1), p_croppingFactor(curCrops1,curCrops)) / 10
$else.cf
   1
$endif.cf
;

p_grossMarginPlot(curPlots,years,curCrops,'variableCosts')
  = p_grossMarginData(curCrops,years,"variableCosts")
  * p_plotData(curPlots,'size')
;

p_grossMarginPlot(curPlots,years,curCrops,'distanceCosts')
  = p_grossMarginPlot(curPlots,years,curCrops,'yield')
* Regression of costs according to LfL 2007
* https://www.lfl.bayern.de/mam/cms07/publikationen/daten/informationen/p_28561.pdf
  * (0.2915 * abs(p_plotData(curPlots,'distance') - 2) + 1.4287)
  * p_plotData(curPlots,'size')
  * (- 1) $ (p_plotData(curPlots,'distance') < 2)
;

p_grossMarginPlot(curPlots,years,curCrops,'directCosts')
  = p_grossMarginData(curCrops,years,"directCosts")
  * p_plotData(curPlots,'size')
;

p_grossMarginPlot(curPlots,years,curCrops,'price')
  = p_grossMarginData(curCrops,years,"price")
;

p_grossMarginPlot(curPlots,years,curCrops,'revenue')
  = p_grossMarginPlot(curPlots,years,curCrops,'price')
  * p_grossMarginPlot(curPlots,years,curCrops,'yield')
  * p_plotData(curPlots,'size')
;

p_grossMarginPlot(curPlots,years,curCrops,'grossMargin')
  = [p_grossMarginData(curCrops,years,"price")
  * (p_grossMarginPlot(curPlots,years,curCrops,'yield')
     * p_grossMarginPlot(curPlots,years,curCrops,'croppingFactor')
     * p_grossMarginPlot(curPlots,years,curCrops,'yieldCap'))
  * p_plotData(curPlots,'size')]
  - p_grossMarginPlot(curPlots,years,curCrops,'directCosts')
  - p_grossMarginPlot(curPlots,years,curCrops,'distanceCosts')
  - p_grossMarginPlot(curPlots,years,curCrops,'variableCosts')
;
