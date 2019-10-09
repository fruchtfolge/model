*
*  --- Load test include file, set WORKDIR and RANDOM
*      global variables for debugging in Atom
*
$include 'test/include/farm5.gms'
$SETGLOBAL WORKDIR './'
$SETGLOBAL RANDOM 'debug.json'
$include 'fruchtfolge.gms'
display p_totLand;

parameter p_cropCheckGM(curPlots,curCrops);
parameter p_profit;
parameter p_manPlot(curPlots,curCrops,manAmounts); 
parameter p_manPlotEnd(curPlots,curCrops,manAmounts);

p_manPlot(curPlots,curCrops,manAmounts) $ (not plots_duevEndangered(curPlots))
  = sum((solidAmounts), 
  v_binCropPlot.l(curCrops,curPlots,manAmounts,solidAmounts)
  * p_manValue("manure",manAmounts,solidAmounts)
);

p_manPlotEnd(curPlots,curCrops,manAmounts) $ plots_duevEndangered(curPlots)
   = sum((solidAmounts), 
  v_binCropPlot.l(curCrops,curPlots,manAmounts,solidAmounts)
  * p_manValue("manure",manAmounts,solidAmounts)
);

p_cropCheckGM(curPlots,curCrops) = sum((manAmounts,solidAmounts), 
  v_binCropPlot.l(curCrops,curPlots,manAmounts,solidAmounts)
  * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,'grossMarginHa')
);

p_profit = v_totGM.l - sum((curPlots,curCrops,manAmounts,solidAmounts), 
  v_binCropPlot.l(curCrops,curPlots,manAmounts,solidAmounts)
  * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,'fixcosts')
  * p_plotData(curPlots,"size")
)

abort p_cropCheckGM,p_profit,p_manPlot,p_manPlotEnd;