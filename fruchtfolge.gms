*-------------------------------
* Fruchtfolge
*
* A spatial crop rotation model
* serving as a base for the
* Fruchtfolge web application
*-------------------------------

* load individual farm settings
$include 'include/include.gms'

alias(curCrops,curCrops1)
Parameter p_grossMarginPlot(curPlots,years,curCrops,grossMarginAttr);

p_grossMarginPlot(curPlots,years,curCrops,"yield")
  = p_grossMarginData(curCrops,years,"yield") 
* correct for yield capacity of plot
  * 1.0
* correct for crop rotational effect, if any
$iftheni.cf defined plots_years_crops  
  * sum(curCrops1 $ plots_years_crops(plots,years - 1,curCrops1), p_croppingFactor(curCrops1,curCrops)) $ sameas(grossMarginAttr,'yield')
$endif.cf
;

p_grossMarginPlot(curPlots,years,curCrops,'variableCosts')
  = [p_grossMarginData(curCrops,years,"variableCosts") 
* add/substract transport costs
  + ((p_plotData(curPlots,'distance') - 2) * p_grossMarginPlot(curPlots,years,curCrops,'yield') * 0.02)]
  * p_plotData(curPlots,'size')
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
  = [(p_grossMarginData(curCrops,years,"price")
  * p_grossMarginPlot(curPlots,years,curCrops,'yield')
  * p_plotData(curPlots,'size'))
  - p_grossMarginPlot(curPlots,years,curCrops,'directCosts')
  - p_grossMarginPlot(curPlots,years,curCrops,'variableCosts')]
* multiply by plot size  
;

display p_grossMarginPlot;
$exit
* define all model variables
variable v_obje;

binary variables
  v_binCropPlot(curCrops,cropGroup,curPlots)
;

Equations
  e_obje
;

* load model equations


model Fruchtfolge "Entire Fruchtfolge model" /
  e_obje
 /;

solve Fruchtfolge using MIP maximizing v_obje;
