set manType / manure,solid /;
parameter p_excr(manType,man_attr);
p_excr("manure",man_attr) = p_manure(man_attr);
p_excr("solid",man_attr) = p_solid(man_attr);

positive variables
  v_manExports(manType,months)
  v_170Slack
  v_170PlotSlack(curPlots)
  v_20RedSlack
;
Equations
  e_man_balance
  e_170_avg
  $$ifi "%duev2020%"=="true" e_170_plots(curPlots)
  $$ifi "%duev2020%"=="true" e_20_red_plots
;


Parameter p_manValue(manType,manAmounts,solidAmounts) /
  'manure'.'0'.set.solidAmounts 0
  'manure'.'10'.set.solidAmounts 10
  'manure'.'15'.set.solidAmounts 15
  'manure'.'20'.set.solidAmounts 20
  'manure'.'25'.set.solidAmounts 25
  'manure'.'30'.set.solidAmounts 30
  'manure'.'40'.set.solidAmounts 40
  'manure'.'50'.set.solidAmounts 50
  'manure'.'60'.set.solidAmounts 60
  'solid'.set.manAmounts.'0' 0
  'solid'.set.manAmounts.'10' 10
  'solid'.set.manAmounts.'15' 15
  'solid'.set.manAmounts.'20' 20
  'solid'.set.manAmounts.'25' 25
  'solid'.set.manAmounts.'30' 30
/;


e_man_balance(manType)..
  sum((curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'grossMarginHa'),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_manValue(manType,manAmounts,solidAmounts))
    + sum(months, v_manExports(manType,months))
    =E= p_excr(manType,"amount")
;

$iftheni.duev2020 "%duev2020%"=="true"
  parameter p_notEndangeredLand;
  p_notEndangeredLand = sum((curPlots) 
    $ (not plots_duevEndangered(curPlots)), p_plotData(curPlots,"size"));
      
  e_170_avg $ p_notEndangeredLand..
    sum((manType,curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) 
      $ ((not plots_duevEndangered(curPlots))
      $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'grossMarginHa')), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     ) /p_notEndangeredLand =L= 170 + v_170Slack
 ;
* In "red areas", the 170kg N maximum rule is active for every single field,
* instead of the average of all fields
  e_170_plots(curPlots) $ (plots_duevEndangered(curPlots) )..
   sum((manType,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'grossMarginHa'),
   v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    * p_manValue(manType,manAmounts,solidAmounts)
    * p_manure("n")
    * 80 / 100
    )  =L= 170 + v_170PlotSlack(curPlots)
  ;
* In addition to this, nitrogen fertilizer needs to be reduced by a minimum average of 
* 20% on all fields in a "red area "of the farm
  e_20_red_plots $ sum(curPlots $ plots_duevEndangered(curPlots), 1)..
    sum((curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
      $ (p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'grossMarginHa')
      $ plots_duevEndangered(curPlots)),
     v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
      * (ord(nReduction) - 1) * 10
      * p_plotData(curPlots,"size")
    ) 
    / sum(curPlots $ plots_duevEndangered(curPlots), p_plotData(curPlots,"size")) 
    =G= 20 - v_20RedSlack
  ;
$else.duev2020
  e_170_avg..
    sum((manType,curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,'grossMarginHa'), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     )/p_totLand =L= 170 + v_170Slack
$endif.duev2020