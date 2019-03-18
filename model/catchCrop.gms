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
* --- Only allow growing of catch crops if it is possible to grow the catch
*     crop after the previously grown crop (e.g. not after sugar beets or maize)
*     and if the succeeding crop is a summer harvested crop
*     This way, Greening compatible catch crops should be ensured
*
v_binCatchCrop.up(curCrops,curPlots) = 0;
v_binCatchCrop.up(curCrops,curPlots)
  $ sum((years,curYear,curCrops1)
    $ (sameas(years,curYear)
    $ plots_years_crops(curPlots,years - 1,curCrops1)
    $ crops_summer(curCrops)
    $ crops_catchCrop(curCrops1)
    $ (not plots_permPast(curPlots))
    ),1) = 1;


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

display p_costCatchCrop;
*
*  --- Source: Own regression made from KTBL - Verfahrensrechner Pflanze data
*              Based on crop "Zwischenfrucht Senf"
*
set catchCropMonths(halfMonths) /'AUG2','SEP1','SEP2','FEB2'/;
Parameter p_timeReqCatchCrop(curPlots,halfMonths);

p_timeReqCatchCrop(curPlots,halfMonths)
  = (0.04827586207 * p_plotData(curPlots,'distance')
  - 0.1 * p_plotData(curPlots,'size')
  + 4.191724138)
  / card(catchCropMonths)
;