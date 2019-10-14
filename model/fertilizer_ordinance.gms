set manType / manure,solid /;
parameter p_excr(manType,man_attr);
p_excr("manure",man_attr) = p_manure(man_attr);
p_excr("solid",man_attr) = p_solid(man_attr);

positive variables
  v_manExports(manType,months)
;
Equations
  e_man_balance
  e_170_avg(manType)
  $$ifi "%duev2020%"=="true" e_170_plots(manType,curPlots)
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
  sum((curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_manValue(manType,manAmounts,solidAmounts))
    + sum(months, v_manExports(manType,months))
    =E= p_excr(manType,"amount")
;

$iftheni.duev2020 "%duev2020%"=="true"
  parameter p_notEndangeredLand;
  p_notEndangeredLand = sum((curPlots) 
    $ (not plots_duevEndangered(curPlots)), p_plotData(curPlots,"size"));
    
  e_170_avg(manType)..
    sum((curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert) 
      $ ((not plots_duevEndangered(curPlots))
      $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa')), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     ) /p_notEndangeredLand =L= 170
 ;
 e_170_plots(manType,curPlots) $ (plots_duevEndangered(curPlots) )..
  sum((curCrops,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'),
   v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_manValue(manType,manAmounts,solidAmounts)
    * p_manure("n")
    * 80 / 100
    )  =L= 170
  ;
$else.duev2020
  e_170_avg(manType)..
    sum((curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     )/p_totLand =L= 170
$endif.duev2020