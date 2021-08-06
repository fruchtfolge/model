*
*  --- attributes for the operations
*
*
table op_attr(operation,machVar,plotSize,opAttr)

                                                labTime         diesel      fixCost      varCost   nPers  amount
    soilSample                .67kw.2ha         0.2              0.5          1.05         0.30
    manDist                   .67kw.2ha         1.7              6.7         20.20        24.65
    basFert                   .67kw.2ha         0.25             0.9          2.04         2.11
*
*   --- page 153, KTBL 2010/2011
*
    plow                      .67kw.2ha         1.89            23.0         20.39        40.76
    chiselPlow                .67kw.2ha         1.09            15.1          9.02        22.92
    SeedBedCombi              .67kw.2ha         0.58             6.0          7.98        12.05
    sowMachine                .67kw.2ha         0.84             4.9          9.44        10.62
    directSowMachine          .67kw.2ha         0.71             6.5         23.01        22.59
    circHarrowSow             .67kw.2ha         1.29            12.9         16.96        27.16
    springTineHarrow          .67kw.2ha         0.75             7.3          6.56        13.60
    weedValuation             .67kw.2ha         0.16             0.3          1.59         0.35
    herb                      .67kw.2ha         0.28             1.0          4.37         3.25
    weederLight               .67kw.2ha         0.42             2.6          3.93         6.22
    weederIntens              .67kw.2ha         0.73             3.8         13.10         9.70
    plantValuation            .67kw.2ha         0.13             0.1          0.91         0.18
    NFert320                  .67kw.2ha         0.23             0.9          1.75         1.95
    NFert160                  .67kw.2ha         0.19             0.8          1.16         1.58
    lime_fert                 .67kw.2ha         0.48             3.6         12.54         6.51
    combineCere               .67kw.2ha         1.20            20.8         66.43        31.94
    combineRape               .67kw.2ha         1.25            22.83        86.11        40.73
    combineMaiz               .67kw.2ha         1.32            23.99       115.57        54.54
    cornTransport             .67kw.2ha         0.23             0.8          5.28         3.41
    store_n_dry_8             .67kw.2ha         1.29                        100.81        29.28
    store_n_dry_4             .67kw.2ha         0.64                         50.41        14.64
    store_n_dry_beans         .67kw.2ha         0.47                         33.42        11.56
    store_n_dry_rape          .67kw.2ha         0.64                         49.38        40.52
    store_n_dry_corn          .67kw.2ha         1.50                        107.36       255.20
*
*   --- page 152 KBL 2010/2011
*
    stubble_shallow           .67kw.2ha         0.85             8.4          7.54        16.59
    stubble_deep              .67kw.2ha         0.92             9.8          7.99        18.04
*
*--- KTBL 12/13 S. 420 [TK,24.07.13]
*
    rotaryHarrow              .67kw.2ha         1.17            9.40           8.27       22.06
    NminTesting               .67kw.2ha         0.51            0.18           1.32        0.34
    mulcher                   .67kw.2ha         1.40            8.39          14.51       20.59
    chitting                  .67kw.2ha         2.36                         481.82       97.80
    solidManDist              .67kw.2ha         1.61           10.88          32.73       30.99
    seedPotatoTransp          .67kw.2ha         0.26            0.94           2.77        2.72
    potatoLaying              .67kw.2ha         1.19           11.84          23.94       31.60
    rakingHoeing              .67kw.2ha         0.73            4.12          11.65       10.80
    earthingUp                .67kw.2ha         0.70            3.49           7.67       10.03
    knockOffHaulm             .67kw.2ha         1.92            8.41          22.24       23.46
    killingHaulm              .67kw.2ha         0.23            1.15           5.48        3.09
    potatoHarvest             .67kw.2ha        19.94           55.23         189.53      133.98      3
    potatoTransport           .67kw.2ha         1.61            5.37          31.63       22.82
*
*   --- fix costs covered by potaStore type buildings
*
    potatoStoring             .67kw.2ha        10.00                                     148.50


*
*---  KTBL 12/13 S.437 und 445  (BL 10.02.2014)
*
   singleSeeder               .67kw.2ha         1.0            4.26           28.3        18.39
   weederHand                 .67kw.2ha        71.52           0.35           1.26         1.09
   uprootBeets                .67kw.2ha         4.41          49.73         149.98       134.33

*
*---  KTBL 12/13 S.348  (BL 10.02.2014)
*
   DiAmmonium                 .67kw.2ha        0.16            0.65           0.86        1.48
   grinding                   .67kw.2ha                                                     84
   disposal                   .67kw.2ha         0.7            3.57           4.19        7.55
*---  KTBL 14/15 S.331  (WB 27.07.2016)
*  coveringSilo               .67kw.2ha         4.2                         265.15       60.61
   coveringSilo               .67kw.2ha         4.2                         000.00       60.61

*     H?cksler wird bei KTBL nur als Dienstleistung gef?hrt, nicht zur Eigenanschaffung
*
   chopper                    .67kw.2ha                                                    410
*
*---  KTBL 14/15 S.453 (CP 28.02.2018)
*
*                                               labTime         diesel      fixCost      varCost   nPers  amount
   mowing                     .67Kw.2ha         0.64            5.47          8.48         11.39
   tedding                    .67kw.2ha         0.43            2.78          3.56          6.88
   raking                     .67kw.2ha         0.51            3.12          4.45          8.02
   silageTrailer              .67kw.2ha                                                    98.00           11.9
   closeSilo                  .67kw.2ha         1.09                         69.42         15.87
   grasReSeeding              .67kw.2ha         0.27            2.07          3.63          4.44
   roller                     .67kw.2ha         0.34            1.72          3.91          4.36
*---  KTBL 14/15 S.458 (Silage)/S.515 (Hay) (CP 27.02.2018)
*---  Ballenpressen mit Wickeln wird bei KTBL als Dienstleistung aufgeführt
   balePressWrap              .67kw.2ha                                                   240.00           11.9
   balePressHay               .67kw.2ha          0.5            3.02         15.45         14.19            4.8
   baleTransportSil           .67kw.2ha         1.65            3.29         21.66         16.27           11.9
   baleTransportHay           .67kw.2ha         1.62            3.02         15.45         14.19            4.8
;


*
*--- taken from KTBL, "Verfahrens�bersicht", e.g. Kartoffeln KTBL 2012/13, p. 418-419
*--- Herbizid, fungizid, insecticide summed up as herb [TK]
*--- not yet in FARMDYN included: hoe, mulcher and cropSprayer;  Kartoffeln need storage and boxes, front bucket for fork lift not included [TK, 24.07.13]
*--- Catch crops are taken from KTBL Homepage, "Kurzscheibenegge" replace bei springTimeHarrow; seeding is moved from JUL1 to AUG2 to prevent overlapping with other crops
*

parameter p_crop_op(crop,type,operation,halfMonth) /
 Kartoffeln     .  set.type .    soilSample          .  AUG1                   0.2
 Kartoffeln     .  set.type .    basFert             .  AUG1                   1.0
 Kartoffeln     .  set.type .    chiselPlow          .  AUG2                   1.0
 Kartoffeln     .  set.type .    sowmachine          .  AUG2                   1.0
 Kartoffeln     .  set.type .    NminTesting         .  FEB1                   1.0
 Kartoffeln     .  set.type .    NFert320            .  MAR1                   1.0
 Kartoffeln     .  set.type .    seedBedCombi        .  MAR2                   1.0
 Kartoffeln     .  set.type .    seedPotatoTransp    .  APR1                   1.0
 Kartoffeln     .  set.type .    potatoLaying        .  APR1                   1.0
 Kartoffeln     .  set.type .    earthingUp          .  APR2                   1.0
 Kartoffeln     .  set.type .    weedValuation       .  MAY1                   1.0
 Kartoffeln     .  set.type .    plantvaluation      .  JUN1                   1.0
 Kartoffeln     .  set.type .    plantValuation      .  JUN2                   2.0
 Kartoffeln     .  set.type .    herb                .  JUN2                   2.0
 Kartoffeln     .  set.type .    plantValuation      .  JUL1                   2.0
 Kartoffeln     .  set.type .    herb                .  JUL1                   2.0
 Kartoffeln     .  set.type .    plantValuation      .  JUL2                   1.0
 Kartoffeln     .  set.type .    herb                .  JUL2                   1.0
 Kartoffeln     .  set.type .    plantValuation      .  AUG1                   1.0
 Kartoffeln     .  set.type .    herb                .  AUG1                   1.0
 Kartoffeln     .  set.type .    plantValuation      .  AUG2                   1.0
 Kartoffeln     .  set.type .    herb                .  AUG2                   1.0
 Kartoffeln     .  set.type .    killingHaulm        .  AUG2                   1.0
 Kartoffeln     .  set.type .    potatoHarvest       .  SEP1                   0.5
 Kartoffeln     .  set.type .    potatoTransport     .  SEP1                   0.5
 Kartoffeln     .  set.type .    potatoStoring       .  SEP1                   0.5
 Kartoffeln     .  set.type .    potatoHarvest       .  SEP2                   0.5
 Kartoffeln     .  set.type .    potatoTransport     .  SEP2                   0.5
 Kartoffeln     .  set.type .    potatoStoring       .  SEP2                   0.5
 Kartoffeln     .  set.type .    lime_fert           .  OCT1                 0.333
 Weizen         .  set.type .    soilSample          .  SEP1                   0.2
 Weizen         .  set.type .    basFert             .  SEP1                   1.0
 Weizen         .  set.type .    plow                .  SEP2                   1.0
 Weizen         .  set.type .    SeedBedCombi        .  OCT1                   1.0
 Weizen         .  set.type .    sowMachine          .  OCT2                   1.0
 Weizen         .  set.type .    weedValuation       .  OCT2                   1.0
 Weizen         .  set.type .    herb                .  OCT2                   1.0
 Weizen         .  set.type .    plantValuation      .  FEB2                   1.0
 Weizen         .  set.type .    NFert320            .  MAR1                   1.0
 Weizen         .  set.type .    plantValuation      .  MAR2                   1.0
 Weizen         .  set.type .    NFert160            .  APR1                   1.0
 Weizen         .  set.type .    herb                .  APR2                   1.0
 Weizen         .  set.type .    herb                .  MAY1                   1.0
 Weizen         .  set.type .    plantValuation      .  MAY1                   1.0
 Weizen         .  set.type .    NFert160            .  JUN1                   1.0
 Weizen         .  set.type .    herb                .  JUN1                   1.0
 Weizen         .  set.type .    combineCere         .  AUG1                   1.0
 Weizen         .  set.type .    cornTransport       .  AUG1                   1.0
 Weizen         .  set.type .    store_n_dry_8       .  AUG1                   1.0
 Weizen         .  set.type .    lime_fert           .  AUG2                 0.333
 Weizen         .  set.type .    stubble_shallow     .  AUG2                   1.0
 Weizen         .  set.type .    stubble_deep        .  SEP2                   1.0
 Gerste         .  set.type .    soilSample          .  SEP1                   0.2
 Gerste         .  set.type .    basFert             .  SEP1                   1.0
 Gerste         .  set.type .    plow                .  SEP2                   1.0
 Gerste         .  set.type .    SeedBedCombi        .  OCT1                   1.0
 Gerste         .  set.type .    sowMachine          .  OCT2                   1.0
 Gerste         .  set.type .    weedValuation       .  OCT2                   1.0
 Gerste         .  set.type .    herb                .  OCT2                   1.0
 Gerste         .  set.type .    plantValuation      .  FEB2                   1.0
 Gerste         .  set.type .    NFert320            .  MAR1                   1.0
 Gerste         .  set.type .    plantValuation      .  MAR2                   1.0
 Gerste         .  set.type .    NFert160            .  APR1                   1.0
 Gerste         .  set.type .    herb                .  APR2                   1.0
 Gerste         .  set.type .    herb                .  MAY1                   1.0
 Gerste         .  set.type .    plantValuation      .  MAY1                   1.0
 Gerste         .  set.type .    NFert160            .  JUN1                   1.0
 Gerste         .  set.type .    herb                .  JUN1                   1.0
 Gerste         .  set.type .    combineCere         .  AUG1                   1.0
 Gerste         .  set.type .    cornTransport       .  AUG1                   1.0
 Gerste         .  set.type .    store_n_dry_8       .  AUG1                   1.0
 Gerste         .  set.type .    lime_fert           .  AUG2                 0.333
 Gerste         .  set.type .    stubble_shallow     .  AUG2                   1.0
 Gerste         .  set.type .    stubble_deep        .  SEP2                   1.0
 Ackerbohnen    .  set.type .    soilSample          .  SEP2                   0.2
 Ackerbohnen    .  set.type .    basFert             .  OCT1                   1.0
 Ackerbohnen    .  set.type .    plow                .  OCT2                   1.0
 Ackerbohnen    .  set.type .    SeedBedCombi        .  MAR1                   1.0
 Ackerbohnen    .  set.type .    sowMachine          .  MAR1                   1.0
 Ackerbohnen    .  set.type .    herb                .  MAR1                   1.0
 Ackerbohnen    .  set.type .    plantValuation      .  MAR1                   1.0
 Ackerbohnen    .  set.type .    herb                .  MAY2                   1.0
 Ackerbohnen    .  set.type .    combineCere         .  AUG2                   1.0
 Ackerbohnen    .  set.type .    cornTransport       .  AUG2                   1.0
 Ackerbohnen    .  set.type .    store_n_dry_beans   .  AUG2                   1.0
 Ackerbohnen    .  set.type .    lime_fert           .  SEP1                 0.333
 Ackerbohnen    .  set.type .    stubble_shallow     .  SEP1                   1.0
 Ackerbohnen    .  set.type .    stubble_deep        .  OCT1                   1.0
 Zuckerrueben   .  set.type .    soilSample          .  SEP1                   0.2
 Zuckerrueben   .  set.type .    basFert             .  OCT1                   1.0
 Zuckerrueben   .  set.type .    plow                .  OCT2                   1.0
 Zuckerrueben   .  set.type .    NFert320            .  MAR1                   1.0
 Zuckerrueben   .  set.type .    SeedBedCombi        .  MAR1                   1.0
 Zuckerrueben   .  set.type .    singleSeeder        .  MAR2                   1.0
 Zuckerrueben   .  set.type .    weedValuation       .  MAR2                   1.0
 Zuckerrueben   .  set.type .    herb                .  MAR2                   1.0
 Zuckerrueben   .  set.type .    herb                .  MAY2                   1.0
 Zuckerrueben   .  set.type .    plantValuation      .  JUL2                   1.0
 Zuckerrueben   .  set.type .    herb                .  AUG1                   1.0
 Zuckerrueben   .  set.type .    uprootBeets         .  OCT2                   1.0
 Zuckerrueben   .  set.type .    lime_fert           .  OCT1                 0.333
 Zuckerrueben   .  set.type .    stubble_shallow     .  OCT1                   1.0
*maizCorn     . .  set.type    soilSample          .  SEP2                   0.2
*maizCorn     . .  set.type    plow                .  OCT2                   1.0
*maizCorn     . .  set.type    chiselPlow          .  OCT2
*maizCorn     . .  set.type    springTineHarrow    .  APR1
*maizCorn     . .  set.type    manDist             .  APR1                   1.0
*maizCorn     . .  set.type    SeedBedCombi        .  APR1                   1.0
*maizCorn     . .  set.type    rotaryHarrow        .  APR1
*maizCorn     . .  set.type    DiAmmonium          .  APR2                   1.0
*maizCorn     . .  set.type    singleSeeder        .  APR2                   1.0
*maizCorn     . .  set.type    herb                .  APR2                   1.0
*maizCorn     . .  set.type    weederLight         .  APR2
*maizCorn     . .  set.type    weedValuation       .  APR2                   1.0
*maizCorn     . .  set.type    manDist             .  MAY1
*maizCorn     . .  set.type    herb                .  MAY1                   1.0
*maizCorn     . .  set.type    weederIntens        .  MAY1
*maizCorn     . .  set.type    plantValuation      .  MAY2                   1.0
*maizCorn     . .  set.type    NFert160            .  MAY2                   1.0
*maizCorn     . .  set.type    weederIntens        .  JUN1
*maizCorn     . .  set.type    combineMaiz         .  OCT2                   1.0
*maizCorn     . .  set.type    cornTransport       .  OCT2                   1.0
*maizCorn     . .  set.type    store_n_dry_corn    .  OCT2                   1.0
*maizCorn     . .  set.type    lime_fert           .  OCT2                 0.333
*maizCorn     . .  set.type    stubble_shallow     .  OCT2                   1.0
*maizCorn     . .  set.type    stubble_deep        .  OCT2
*maizCCM      . .  set.type    soilSample          .  SEP2                   0.2
*maizCCM      . .  set.type    plow                .  OCT2                   1.0
*maizCCM      . .  set.type    chiselPlow          .  OCT2
* maizCCM      ..  set.type     springTineHarrow    .  APR1
*maizCCM      . .  set.type    manDist             .  APR1                   1.0
*maizCCM      . .  set.type    SeedBedCombi        .  APR1                   1.0
*maizCCM      . .  set.type    rotaryHarrow        .  APR1
*maizCCM      . .  set.type    DiAmmonium          .  APR2                   1.0
*maizCCM      . .  set.type    singleSeeder        .  APR2                   1.0
*maizCCM      . .  set.type    herb                .  APR2                   1.0
*maizCCM      . .  set.type    weederLight         .  APR2
*maizCCM      . .  set.type    weedValuation       .  APR2                   1.0
* maizCCM      ..  set.type     manDist             .  MAY1
*maizCCM      . .  set.type    herb                .  MAY1                   1.0
* maizCCM      ..  set.type     weederIntens        .  MAY1
*maizCCM      . .  set.type    plantValuation      .  MAY2                   1.0
*maizCCM      . .  set.type    NFert160            .  MAY2                   1.0
* maizCCM      ..  set.type     weederIntens        .  JUN1
*maizCCM      . .  set.type    combineMaiz         .  OCT1                   1.0
*maizCCM      . .  set.type    cornTransport       .  OCT1                   1.0
*maizCCM      . .  set.type    grinding            .  OCT1                   1.0
*maizCCM      . .  set.type    disposal            .  OCT1                   1.0
*maizCCM      . .  set.type    coveringSilo        .  OCT1                   1.0
*maizCCM      . .  set.type    lime_fert           .  OCT1                   0.333
*maizCCM      . .  set.type    stubble_shallow     .  OCT1                   1.0
 MaisSilage     .  set.type  .    soilSample          .  SEP2                   0.2
 MaisSilage     .  set.type  .    basFert             .  OCT1                   1.0
 MaisSilage     .  set.type  .    plow                .  OCT2                   1.0
 MaisSilage     .  set.type  .    manDist             .  APR1                   1.0
 MaisSilage     .  set.type  .    SeedBedCombi        .  APR1                   1.0
 MaisSilage     .  set.type  .    singleSeeder        .  APR2                   1.0
 MaisSilage     .  set.type  .    herb                .  APR2                   1.0
 MaisSilage     .  set.type  .    weedValuation       .  MAY1                   1.0
 MaisSilage     .  set.type  .    herb                .  MAY1                   1.0
 MaisSilage     .  set.type  .    plantValuation      .  MAY2                   1.0
 MaisSilage     .  set.type  .    NFert160            .  MAY2                   1.0
 MaisSilage     .  set.type  .    chopper             .  SEP2                   1.0
 MaisSilage     .  set.type  .    disposal            .  SEP2                   1.0
 MaisSilage     .  set.type  .    coveringSilo        .  SEP2                   1.0
 MaisSilage     .  set.type  .    lime_fert           .  OCT2                 0.333
 MaisSilage     .  set.type  .    stubble_shallow     .  OCT2                   1.0
 Zwischenfrucht .  set.type .    springTineHarrow    .  AUG2                   1.0
 Zwischenfrucht .  set.type .    roller              .  AUG2                   1.0
 Zwischenfrucht .  set.type .    SeedBedCombi        .  AUG2                   1.0
 Zwischenfrucht .  set.type .    springTineHarrow    .  FEB2                   1.0
/;

* remove crop types from parameter that do not belong to crop
p_crop_op(crop,type,operation,halfMonth) $ (not crop_type(crop,type)) = 0;


*   --- see page 250 KTBL 2010/2011 for winter cereals
*
*       Describe effect of plot size and mechanisation (= work width) on time, variable and fix
*       machinery costs and diesel.
*
table p_plotSizeEffect(crop,type,machVar,opAttr,plotSize)

                                          1ha    2ha   5ha  20ha

   Weizen.set.type. 67kw .labTime         12.4   10.5   9.3   8.0
   Weizen.set.type. 67kw .diesel            90     83    78    73
   Weizen.set.type. 67kw .varCost          205    188   176   168
   Weizen.set.type. 67kw .fixCost          282    258   241   231

   Weizen.set.type.102kw .labTime         11.1    9.1   7.6   6.8
   Weizen.set.type.102kw .diesel            95     86    78    74
   Weizen.set.type.102kw .varCost          209    188   172   164
   Weizen.set.type.102kw .fixCost          315    284   262   249

   Weizen.set.type.200kw .labTime         11.9    8.6   6.3   4.9
   Weizen.set.type.200kw .diesel           118     99    84    75
   Weizen.set.type.200kw .varCost          240    201   173   157
   Weizen.set.type.200kw .fixCost          396    334   292   267
;


p_plotSizeEffect("Weizen",type,machVar,"nPers",plotSize) = 1;
p_plotSizeEffect("Weizen",type,machVar,"amount",plotSize) = 1;

*
* -- use mean of given crops if missing for one of the crops
*
p_plotSizeEffect(crop,type,machVar,opAttr,plotSize) $ (not p_plotSizeEffect(crop,type,machVar,opAttr,plotSize))
= sum( crop1,  p_plotSizeEffect(crop1,type,machVar,opAttr,plotSize))
 /sum( crop1 $ p_plotSizeEffect(crop1,type,machVar,opAttr,plotSize),1);

* remove unwanted types from p_plotSizeEffect
p_plotSizeEffect(crop,type,machVar,opAttr,plotSize) $ (not crop_type(crop,type)) = 0;

p_machNeed(crop,type,machType,halfMonth,"hour") $ crop_type(crop,type)
 = sum( (operation,machVar,plotSize) $ (op_machType(operation,machType) $ p_crop_op(crop,type,operation,halfMonth) $ op_attr(operation,"67kW","2ha","labTime") ),
             p_crop_op(crop,type,operation,halfMonth)
                   * op_attr(operation,"67kW","2ha","labTime")
*
*                    -- effect of plot size and mechanisation on labour time
*
                   * p_plotSizeEffect(crop,type,machVar,"labTime",plotSize)
                    /p_plotSizeEffect(crop,type,"67kW","labTime","2ha")) $ p_plotSizeEffect(crop,type,"67kW","labTime","2ha")
;


p_fieldWorkHourNeed(crop,type,halfMonth,labReqLevl) $ crop_type(crop,type)
  = sum( (operation,machVar,plotSize) $ ( op_machType(operation,"tractor") $ op_attr(operation,"67kW","2ha","labTime")),
                p_crop_op(crop,type,operation,halfMonth)
                  * op_rf(operation,labReqLevl)
                    * op_attr(operation,"67kW","2ha","labTime")
*
*                    -- effect of plot size and mechanisation on labour time
*
                        * p_plotSizeEffect(crop,type,machVar,"labTime",plotSize)
                         /p_plotSizeEffect(crop,type,"67kW","labTime","2ha"));


p_varCost(crop,type,plotSize) $ crop_type(crop,type)
  = (sum((operation,halfMonth),
    p_crop_op(crop,type,operation,halfMonth)
    * op_attr(operation,"67kW","2ha","varCost")
    + p_crop_op(crop,type,operation,halfMonth)
    * op_attr(operation,"67kW","2ha","diesel")
    * 1.0)
    * p_plotSizeEffect(crop,type,"67kW","labTime",plotSize)
     /p_plotSizeEffect(crop,type,"67kW","labTime","2ha")
    )
;

p_varCostDetail(crop,type,halfMonth,operation,plotSize) $ crop_type(crop,type)
  = (
    p_crop_op(crop,type,operation,halfMonth)
    * op_attr(operation,"67kW","2ha","varCost")
    + p_crop_op(crop,type,operation,halfMonth)
    * op_attr(operation,"67kW","2ha","diesel")
    * 1.0)
    * p_plotSizeEffect(crop,type,"67kW","labTime",plotSize)
     /p_plotSizeEffect(crop,type,"67kW","labTime","2ha")
;


*
*  --- Define start and end half month when crop is sown or harvested
*
start_crop_halfMonth(crop,type) $ crop_type(crop,type) = smin(halfMonth $ (p_crop_op(crop,type,'seedBedCombi',halfMonth)), halfMonth.pos);
end_crop_halfMonth(crop,type) $ crop_type(crop,type) = smax(halfMonth $ (p_crop_op(crop,type,'combineCere',halfMonth)
                                   or (p_crop_op(crop,type,'potatoHarvest',halfMonth))
                                   or (p_crop_op(crop,type,'uprootBeets',halfMonth))
                                   or (p_crop_op(crop,type,'chopper',halfMonth))
                                   ), halfMonth.pos);

*
*  --- Define period where a crop is standing on a field (thus occupies the plot)
*
crop_type_halfMonth(crop,type,halfMonth) $ ((halfMonth.pos >= start_crop_halfMonth(crop,type))
                               $  (halfMonth.pos <= end_crop_halfMonth(crop,type))
                                ) = YES;

crop_type_halfMonth(crop,type,halfMonth) $ ((start_crop_halfMonth(crop,type) > end_crop_halfMonth(crop,type))
                               $  ((halfMonth.pos >= start_crop_halfMonth(crop,type))
                               or  (halfMonth.pos <= end_crop_halfMonth(crop,type)))
                                ) = YES;
