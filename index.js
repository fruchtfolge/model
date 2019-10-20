module.exports = (debugBounds) => { return `*-------------------------------
* Fruchtfolge
*
* A spatial crop rotation model
* serving as a base for the
* Fruchtfolge web application
* (c) Christoph Pahmeyer, 2019
*-------------------------------
*
*  --- initiate global parameters for Greening evaluation
*
scalar  p_totLand;
scalar  p_totArabLand;
scalar  p_totGreenLand;
p_totLand = sum(curPlots, p_plotData(curPlots,"size"));
p_totArabLand = sum(curPlots $ (not plots_permPast(curPlots)), p_plotData(curPlots,"size"));
p_totGreenLand = p_totLand - p_totArabLand;
alias (cropGroup,cropGroup1);
alias (curCrops,curCrops1);
scalar M / 99999 /;
*
*  --- declare objective variable and equation
*
Variables
  v_obje
  v_totGM
;
Positive Variables
  v_devShares(curCrops)
  v_devEfa5
  v_devEfa75
  v_devEfa95
$iftheni.constraints defined constraints
  v_devUserShares(constraints,curCrops,curCrops)
$endif.constraints
  v_devOneCrop(curPlots)
$iftheni.labour defined p_availLabour
  v_devLabour(months)
$endif.labour
;
Binary Variables
  v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
;
Equations
  e_obje
  e_totGM
;
*
*  --- include model
*
Equations
  e_maxShares(curCrops)
  e_oneCropPlot(curPlots)
$iftheni.constraints defined constraints
  e_minimumShares(constraints,curCrops,curCrops1)
  e_maximumShares(constraints,curCrops,curCrops1) 
$endif.constraints
;

*
*  --- each crop cannot exceed the maximum allowed share specified by the users
*      crop rotational settings
*
e_maxShares(curCrops) $ p_cropData(curCrops,"maxShare")..
  sum((curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa') , 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
  )
  =L= 
    (p_totArabLand * p_cropData(curCrops,"maxShare") / 100)
    + v_devShares(curCrops)
;

*
*  --- ensure that only one crop is grown on a plot
*
e_oneCropPlot(curPlots)..
  sum((curCrops,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert))
  + v_devOneCrop(curPlots)
  =E= 1
;

*
*  --- prohibit growing a crop on a plot when there is no gross margin present
*
v_binCropPlot.up(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert) $ ((not
  p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,"grossMarginHa"))
  $ (not plots_permPast(curPlots))) = 0;
  
*
*  --- Enter user specified constraints into the model, 
*
$iftheni.constraints defined constraints
e_minimumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (not (constraints_lt(constraints,'lt'))))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) * p_plotData(curPlots,'size'))
    + v_devUserShares(constraints,curCrops,curCrops1)
    =G= p_constraint(constraints,curCrops,curCrops1) 
;  

e_maximumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (constraints_lt(constraints,'lt')))..
  sum(curPlots, v_binCropPlot(curCrops,curPlots) * p_plotData(curPlots,'size') + 
    v_binCropPlot(curCrops1,curPlots) * p_plotData(curPlots,'size'))
    =L= 
    p_constraint(constraints,curCrops,curCrops1)
    + v_devUserShares(constraints,curCrops,curCrops1)
;  
$endif.constraints

set manType / manure,solid /;
parameter p_excr(manType,man_attr);
p_excr("manure",man_attr) = p_manure(man_attr);
p_excr("solid",man_attr) = p_solid(man_attr);

positive variables
  v_manExports(manType,months)
  v_170Slack
  v_170PlotSlack(curPlots)
;
Equations
  e_man_balance
  e_170_avg
  $$ifi "%duev2020%"=="true" e_170_plots(curPlots)
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
    
  e_170_avg..
    sum((manType,curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert) 
      $ ((not plots_duevEndangered(curPlots))
      $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa')), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     ) /p_notEndangeredLand =L= 170 + v_170Slack
 ;
 e_170_plots(curPlots) $ (plots_duevEndangered(curPlots) )..
  sum((curCrops,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'),
   v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_manValue(manType,manAmounts,solidAmounts)
    * p_manure("n")
    * 80 / 100
    )  =L= 170 + v_170PlotSlack(curPlots)
  ;
$else.duev2020
  e_170_avg..
    sum((manType,curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'), 
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
     * p_plotData(curPlots,"size")
     * p_manValue(manType,manAmounts,solidAmounts)
     * p_manure("n")
     * 80 / 100
     )/p_totLand =L= 170 + v_170Slack
$endif.duev2020
*
*  --- Storage model
*
Positive Variables 
  v_curStorage(manType,months)
  v_manureSpring(manType,months)
  v_manureAutumn
  v_manSlack(manType,months)
;

Equations 
  e_storageBal(manType,months)
  e_manureSpring(manType)
  e_manureAutumn
  e_maxStorageCap(manType,months)
;
Parameter p_monthlyManure(manType);

* We assume a steady flow of manure into the storages
p_monthlyManure("manure") = p_manure("amount") / 12;
p_monthlyManure("solid") = p_solid("amount") / 12;

* We also assume, that the maximum storage capacity is equal to the monthly
* flow multiplied with the 6 month minimum storage capacity requried by the Fert. Ordinance
Parameter p_maxStoreCap(manType);
p_maxStoreCap("manure") =  manStorage;
p_maxStoreCap("solid") =  p_solid("amount") / 12 * 2;

Parameter p_springManMonths(manType,months) /
  manure.feb 0.667
  manure.mrz 0.167
  manure.apr 0.167
  solid.feb  0.333
  solid.mrz  0.333
  solid.apr  0.333
/;

Parameter p_priceManExport(months);
p_priceManExport(months) $ (ord(months) < 6) = manPriceSpring;
p_priceManExport(months) $ (ord(months) > 5) = manPriceAutumn;

*
*  --- We model 3 timepoints:
*      1. The amount of manure in storage at 31.01
*      2. The amount of manure in storage after spring
*      3. The amount of manure in storage after 01.10
*     
e_manureSpring(manType)..
  sum(months, v_manureSpring(manType,months)) =E=
  sum((curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_manValue(manType,manAmounts,solidAmounts)
  )
;

* Manure spreading can only be done in these months
set manMonths / feb, mrz, apr, mai /;
v_manureSpring.up(manType,months) = 0;
v_manureSpring.up(manType,months) 
  $ sum(manMonths $ (sameas(manMonths,months)),1) = +inf;

e_manureAutumn..
  v_manureAutumn =E=
  sum((curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'autumnFertm3'),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
    * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'autumnFertm3')
  )
;

e_storageBal(manType,months)..
  v_curStorage(manType,months) =E=
* The storage level of the previous month  
    v_curStorage(manType,months - 1)
* The monthly in-flow  
    + p_monthlyManure(manType) $ (not sameas(months,"jan"))
* We assume that the storage is at capacity at the 31.01
    + p_maxStoreCap(manType)   $ sameas(months,"jan") 
* In these months manure is assumed to be spreaded
    - v_manureSpring(manType,months)
* Exports can be done in April (cheaper) or September
    - v_manExports(manType,months) $ (sameas(months,"apr") or sameas(months,"sep"))
* Autumn manure spreading is only assumed to be done in September
    - v_manureAutumn $ (sameas(months,"sep") $ sameas(manType,"manure"))
* Manure slack for infes treatment
    + v_manSlack(manType,months) 
;

e_maxStorageCap(manType,months)..
  v_curStorage(manType,months) =L=
* at the 01.10, the storage needs to have at least a capacity of 4 months left  
  p_maxStoreCap(manType) 
  - (3 * p_monthlyManure(manType)) $ sameas(months,"okt")
;

Equations
  e_efa
  e_75diversification(cropGroup)
  e_95diversification(cropGroup,cropGroup1)
;

* Only activate ecological focus area equation if arable land is greater than 15ha
e_efa $ (p_totArabLand >= 15)..
  sum((curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert) 
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'efaFactor'),
      v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
      * p_plotData(curPlots,"size")
      * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'efaFactor')
  )
  + v_devEfa5
  =G= 
  p_totArabLand * 0.05
;


* Only activate 75% diversifaction rule if arable land is greater than 10ha
e_75diversification(cropGroup) $ (p_totArabLand >= 10)..
  sum((curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert) 
    $ (crops_cropGroup(curCrops,cropGroup)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa')),
      v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
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
  sum((curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert) 
    $ (crops_cropGroup(curCrops,cropGroup)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa')),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
  )
  +
  sum((curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert) 
    $ (crops_cropGroup(curCrops,cropGroup1)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa')),
    v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
    * p_plotData(curPlots,"size")
  )
  =L= 
  p_totArabLand * 0.95
  + v_devEfa95
;

*
*  --- Only account for labour constraints when parameter is defined
*
$iftheni.labour defined p_availLabour
Equations
  e_maxLabour(months)
*  e_maxFieldWorkDays(months)
;

e_maxLabour(months)..
  sum((curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert)
    $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,months),
  v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
  * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,months)
  )
  =L= 
  p_availLabour(months)
  + v_devLabour(months)
;

*
*  --- we assume a maximum of 14h of work per day
*
$ontext
e_maxFieldWorkDays(months)..
  sum((curPlots,curCrops,halfMonths) $ months_halfMonths(months,halfMonths),
  v_binCropPlot(curCrops,curPlots)
  * p_tractorReq(crops,halfMonths)
  =L= p_availFieldWorkDays(months) * p_availTractHours(month)
;
$offtext

$endif.labour

*
*  --- calculate overall gross margin for the planning year
*
e_totGM..
  v_totGM =E=
    sum((curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
      $ p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa'), 
      v_binCropPlot(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert)
      * p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,catchCrop,autumnFert,'grossMarginHa')
      * p_plotData(curPlots,'size')
    )
    - sum((manType,months), v_manExports(manType,months) * p_priceManExport(months));
e_obje..
  v_obje =E=
    v_totGM
    - sum(curCrops, v_devShares(curCrops) * M)
    - (v_devEfa5 * M)
    - (v_devEfa75 * M)
    - (v_devEfa95 * M)
    - sum(curPlots, v_devOneCrop(curPlots) * M * 10)
    - (sum((manType,months), v_manSlack(manType,months)) * M)
    - (v_170Slack * M)
    - ((sum((manType,curPlots), v_170PlotSlack(curPlots))) * M)
$iftheni.constraints defined constraints
    - sum((constraints,curCrops,curCrops1),
      v_devUserShares(constraints,curCrops,curCrops1) * M)
$endif.constraints
$iftheni.labour defined p_availLabour
    - sum(months, v_devLabour(months) * 1000)
$endif.labour
;
*
*  --- define upper bounds for slack variables
*
v_devShares.up(curCrops) = p_totArabLand;
v_devEfa5.up = p_totArabLand * 0.05;
v_devEfa75.up = p_totArabLand * 0.25;
v_devEfa95.up = p_totArabLand;
v_devOneCrop.up(curPlots) = 1;
$iftheni.constraints defined constraints
  v_devUserShares.up(constraints,curCrops,curCrops1) = p_totArabLand;
$endif.constraints
$iftheni.labour defined p_availLabour
  v_devLabour.up(months) = 15000;
$endif.labour
option optCR=0;
model Fruchtfolge /
  e_obje
  e_totGM
  e_maxShares
  e_oneCropPlot
*  e_man_balance
  e_170_avg
  $$ifi "%duev2020%"=="true" e_170_plots
  e_storageBal
  e_manureSpring
  e_manureAutumn
  e_maxStorageCap
$iftheni.constraints defined constraints
  e_minimumShares
  e_maximumShares
$endif.constraints
  e_efa
  e_75diversification
  e_95diversification
$iftheni.labour defined p_availLabour
  e_maxLabour
$endif.labour
/;
${debugBounds}
solve Fruchtfolge using MIP maximizing v_obje;
set fullMonths /
  'Januar'
  'Februar'
  'März'
  'April'
  'Mai'
  'Juni'
  'Juli'
  'August'
  'September'
  'Oktober'
  'November'
  'Dezember'
/;
set bool / true, false /;
set toBool(*,bool) /
  catchCrop.true  YES
  noCatchCrop.false YES
  autumnFert.true YES
  noAutumnFert.false YES
/;

scalar 
  warningsCount
  curWarning
;
warningsCount = sum(curCrops $ v_devShares.l(curCrops), 1)
                 + 1 $ v_devEfa5.l 
                 + 1 $ v_devEfa75.l 
                 + 1 $ v_devEfa95.l
                 + sum(curPlots $ v_devOneCrop.l(curPlots), 1)
                 + sum((manType,months) $ v_manSlack.l(manType,months), 1)
                 + 1 $ v_170Slack.l
                 + sum((curPlots) $ v_170PlotSlack.l(curPlots), 1)
                 $$iftheni.constraints defined constraints
                   + sum((constraints,curCrops,curCrops1) $ v_devUserShares.l(constraints,curCrops,curCrops1), 1)
                 $$endif.constraints
                 $$iftheni.labour defined p_availLabour
                   + sum(months $ v_devLabour.l(months), 1)
                 $$endif.labour
;
curWarning = 0;

display warningsCount,curWarning;
File results / "%random%" /;
results.lw = 0;
put results;
put "{"
put '"model_status":',  Fruchtfolge.modelstat, "," /;
put '"solver_status":', Fruchtfolge.solvestat, "," /;

if ( ((Fruchtfolge.modelstat ne 1) and (Fruchtfolge.modelstat ne 8)),
    put '"error_message": "Infeasible model."' /;
  ELSE
    put '"objective":', v_totGM.l, "," /;
* add warnings if slack variables have non 0 levels
    put '"warnings": [' /;

    if ((sum(curCrops, v_devShares.l(curCrops)) > 0),
      loop(curCrops $ v_devShares.l(curCrops),
        put$(v_devShares.l(curCrops) > 0) '"Maximaler Fruchtfolgeanteil von ', curCrops.tl, ' konnte nicht eingehalten werden."'/;
        curWarning = curWarning + 1;
        put$(curWarning < warningsCount) "," /;
      )
    );
    if ((v_devEfa5.l > 0),
      put '"Konnte 5% ÖVF nicht einhalten. Prüfen, ob Sommerungen vorhanden sind, bzw. ob ZF Anbau erlaubt wurde."' /;
      curWarning = curWarning + 1;
      put$(curWarning < warningsCount) "," /;
    );
    if ((v_devEfa75.l > 0),
      put '"Konnte 75% Greening-Regel nicht einhalten"' /;
      curWarning = curWarning + 1;
      put$(curWarning < warningsCount) "," /;
    );
    if ((v_devEfa95.l > 0),
      put '"Konnte 95% Greening-Regel nicht einhalten"' /;
      curWarning = curWarning + 1;
      put$(curWarning < warningsCount) "," /;
    );
    if ((sum(curPlots, v_devOneCrop.l(curPlots)) > 0),
      loop(curPlots $ v_devOneCrop.l(curPlots),
        put$(v_devOneCrop.l(curPlots) > 0) '"Keine mögliche Nachfrucht für ', curPlots.tl, ' mit den aktuellen Anbaupause/Nachfruchtwirkungen."'/;
        curWarning = curWarning + 1;
        put$(curWarning < warningsCount) "," /;
      )
    );
    if ((sum((manType,months), v_manSlack.l(manType,months)) > 0),
      loop(manType,
        loop (months $ v_manSlack.l(manType,months),
         put$(v_manSlack.l(manType,months) > 0) '"Nicht ausreichend org. Dünger (', v_manSlack.l(manType,months), 'm3) im Monat ', months.tl, '"' /;
         curWarning $ (v_manSlack.l(manType,months) > 0) = curWarning + 1;
         put$(curWarning < warningsCount) "," /;
        );
      )
    );
    if ((v_170Slack.l > 0),
      put '"Konnte 170kg org. N-Dünger-Regel nicht einhalten"' /;
      curWarning = curWarning + 1;
      put$(curWarning < warningsCount) "," /;
    );
    if ((sum(curPlots, v_170PlotSlack.l(curPlots)) > 0),
      loop(curPlots $ v_170PlotSlack.l(curPlots),
        put$(v_170PlotSlack.l(curPlots) > 0) '"Konnte 170kg org. N-Dünger-Regel für ', curPlots.tl, ' nicht einhalten (',  v_170PlotSlack.l(curPlots) ,')."'/;
        curWarning = curWarning + 1;
        put$(curWarning < warningsCount) "," /;
      )
    );
    $$iftheni.constraints defined constraints
      if ((sum((constraints,curCrops,curCrops1), v_devUserShares.l(constraints,curCrops,curCrops1)) > 0),
        loop((constraints,curCrops,curCrops1) $ v_devUserShares.l(constraints,curCrops,curCrops1),
          put$(v_devUserShares.l(constraints,curCrops,curCrops1) > 0) '"Konnte Restriktion für ', constraints.tl, ' nicht einhalten."'/;
          curWarning = curWarning + 1;
          put$(curWarning < warningsCount) "," /;
        ) 
      ); 
    $$endif.constraints
    $$iftheni.labour defined p_availLabour
      if ((sum(months, v_devLabour.l(months)) > 0),
        loop((months,fullMonths) $ ( v_devLabour.l(months) $ (months.pos eq fullMonths.pos)),
          put$(v_devLabour.l(months) > 0) '"Konnte maximale Arbeitszeit für ', fullMonths.tl, ' nicht einhalten."'/;
          curWarning = curWarning + 1;
          put$(curWarning < warningsCount) "," /;
        )
      );
    $$endif.labour

    put '],' /; 
* write recommendations from optimisation to JSON file
    put '"recommendation":', "{"/;
    loop((curPlots),
      loop(curCrops,
        loop (manAmounts,
         loop (solidAmounts,
           loop (catchCrop,
            loop (autumnFert,
              put$(v_binCropPlot.l(curCrops,curPlots,manAmounts,solidAmounts,catchCrop,autumnFert) > 0) 
                '"', curPlots.tl, '": {', 
                '"crop": "', curCrops.tl, '",', 
                '"manAmount": ', manAmounts.tl, ',',
                '"solidAmount": ', solidAmounts.tl, ',',
                '"catchCrop":', catchCrop.tl, ',',
                '"autumnFert":', autumnFert.tl, 
                '}' /
            );
           );
         );
        );
      );
      put$(curPlots.pos < card(curPlots)) "," /
    );
    put "}," /;
    put '"storage": {' /;
      put '"manure": [' /;
        loop (months,
         put v_curStorage.l("manure",months) /; 
         put$(months.pos < card(months)) "," /;
        );
      put '],' /;
      put '"solid": [' /;
        loop (months,
         put v_curStorage.l("solid",months) /; 
         put$(months.pos < card(months)) "," /;
        );
      put ']' /;
    put "}," /;
    put '"exports": {' /;
    put '"manure": [' /;
      loop (months,
       put v_manExports.l("manure",months) /; 
       put$(months.pos < card(months)) "," /;
      );
    put '],' /;
    put '"solid": [' /;
      loop (months,
       put v_manExports.l("solid",months) /; 
       put$(months.pos < card(months)) "," /;
      );
    put ']' /;
    put "}" /;
);
put "}" /;
putclose;

`}