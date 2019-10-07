Equations
    e_oneCatchCropPlot(curPlots)
    e_catchCropEqBinCrop(curCrops,curPlots)
;

*
*  --- ensure that only one catch crop is grown on a plot
*
e_oneCatchCropPlot(curPlots)..
  sum(curCrops, v_binCatchCrop(curCrops,curPlots))
  =L= 1
;

*
*  --- ensure that catch crop option matches actually grown crop
*
e_catchCropEqBinCrop(curCrops,curPlots)..
  v_binCatchCrop(curCrops,curPlots) =L= v_binCropPlot(curCrops,curPlots)
;
*
* --- Only allow growing of catch crops if the succeeding crop is a summer
*     sown crop. This way, Greening compatible catch crops should
*     be ensured
*
v_binCatchCrop.up(curCrops,curPlots) = 0;

v_binCatchCrop.up(curCrops,curPlots)
  $ crops_summer(curCrops) = 1;

* Also, forbid growing of catch crops if the previously grown crop
* is harvested too late (e.g. not after sugar beets or maize)
v_binCatchCrop.up(curCrops,curPlots)
  $ sum((curCrops1,years,curYear)
    $ (sameas(years,curYear)
    $ sum(cropGroup
      $ (crops_cropGroup(curCrops1,cropGroup)
      $ plots_years_cropGroup(curPlots,years - 1,cropGroup)),1)
    $ (not crops_catchCrop(curCrops1))
    ),1) = 0;

*
* --- Disallow catch crops to be grown on permanent pastures
*
v_binCatchCrop.up(curCrops,curPlots) $ plots_permPast(curPlots) = 0;

*
* --- Calculate costs of growing a catch crop on a plot
*     Source: Own regression made from KTBL - Leistungs- Kostenrechner data
*             Based on crop "Zwischenfrucht Senf"
*
Parameter p_costCatchCrop(curPlots);
p_costCatchCrop(curPlots) =
    0.2850553506 * p_plotData(curPlots,'distance')
  - 0.6666666667 * p_plotData(curPlots,'size')
  + 113
;

*
*  --- Source: Own regression made from KTBL - Verfahrensrechner Pflanze data
*              Based on crop "Zwischenfrucht Senf"
*
set catchCropMonths(months) /'AUG','SEP','FEB'/;
Parameter p_timeReqCatchCrop(curPlots,months);

p_timeReqCatchCrop(curPlots,catchCropMonths)
  = (0.04827586207 * p_plotData(curPlots,'distance')
  - 0.1 * p_plotData(curPlots,'size')
  + 4.191724138)
  / card(catchCropMonths)
;
