*
*  --- TODO: 
*
set manType / manure,solid /;
parameter p_excr(manType,man_attr);
p_excr("manure",man_attr) = p_manure(man_attr);
p_excr("solid",man_attr) = p_solid(man_attr);

positive variables
  v_manExports(manType)
;
Equations
  e_man_balance
  e_170_avg(manType)
  e_170_plots(manType,curPlots)
;


Parameter p_manValue(manType,manAmounts,solidAmounts) /
  'manure'.'0'.set.solidAmounts 0
  'manure'.'5'.set.solidAmounts 5
  'manure'.'7'.set.solidAmounts 7
  'manure'.'10'.set.solidAmounts 10
  'manure'.'12'.set.solidAmounts 12
  'manure'.'15'.set.solidAmounts 15
  'manure'.'20'.set.solidAmounts 20
  'manure'.'25'.set.solidAmounts 25
  'manure'.'30'.set.solidAmounts 30
  'solid'.set.manAmounts.'0' 0
  'solid'.set.manAmounts.'6.5' 6.5
  'solid'.set.manAmounts.'10' 10
  'solid'.set.manAmounts.'15' 15
  'solid'.set.manAmounts.'17' 17
  'solid'.set.manAmounts.'20' 20
  'solid'.set.manAmounts.'25' 25
  'solid'.set.manAmounts.'30' 30
/;


e_man_balance(manType)..
  sum((curCrops,curPlots,manAmounts,solidAmounts),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
    * p_plotData(curPlots,"size")
    * p_manValue(manType,manAmounts,solidAmounts))
    + v_manExports(manType)
    =E= p_excr(manType,"amount")
;

e_170_avg(manType)..
  sum((curCrops,curPlots,manAmounts,solidAmounts) $ (not plots_duevEndangered(curPlots)), 
  v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
   * p_plotData(curPlots,"size")
   * p_manValue(manType,manAmounts,solidAmounts)
   * p_manure("n")
   * 80 / 100
   )/ p_totLand =L= 170
 ;


 e_170_plots(manType,curPlots) $ (plots_duevEndangered(curPlots))..
  sum((curCrops,manAmounts,solidAmounts),
   v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts)
    * p_manValue(manType,manAmounts,solidAmounts)
    * p_manure("n")
    * 80 / 100
    )  =L= 170
  ;