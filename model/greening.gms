Equations
  e_efa
  e_75diversification(cropGroup)
  e_95diversification(cropGroup,cropGroup1)
;

* Only activate ecological focus area equation if arable land is greater than 15ha
e_efa $ (p_totArabLand >= 15)..
  sum((curPlots,curCrops,manAmounts,solidAmounts),
      v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
      * p_plotData(curPlots,"size")
      * p_cropData(curCrops,"efaFactor")
      + (v_binCatchCrop(curCrops,curPlots)
      * p_plotData(curPlots,"size"))
  )
  + v_devEfa5
  =G= 
  p_totArabLand * 0.05
;


* Only activate 75% diversifaction rule if arable land is greater than 10ha
e_75diversification(cropGroup) $ (p_totArabLand >= 10)..
  sum((curPlots,curCrops,manAmounts,solidAmounts) $ crops_cropGroup(curCrops,cropGroup),
      v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
      * p_plotData(curPlots,"size")
  )
  =L= 
  p_totArabLand * 0.75
  + v_devEfa75
  
;

* Only activate 95% diversifaction rule if arable land is greater than 30ha
e_95diversification(cropGroup,cropGroup1)
  $ ((p_totArabLand >= 30)
  $ (not sameas(cropGroup,cropGroup1)))..
  sum((curPlots,curCrops,manAmounts,solidAmounts) $ crops_cropGroup(curCrops,cropGroup),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
    * p_plotData(curPlots,"size")
  )
  +
  sum((curPlots,curCrops,manAmounts,solidAmounts) $ crops_cropGroup(curCrops,cropGroup1),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
    * p_plotData(curPlots,"size")
  )
  =L= 
  p_totArabLand * 0.95
  + v_devEfa95
;
