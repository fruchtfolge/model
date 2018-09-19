set crop /
  Zwiebeln
  Kartoffeln
  Weizen
  Gerste
  Ackerbohnen
  Zwischenfrucht
  Zuckerrueben
  MaisSilage
/;

alias (crop,crop1)

set type /
  ""
  Belana
  Agria
/;

set crop_type(crop,type) /
  Kartoffeln.('Belana','Agria')
/;

crop_type(crop,'') $ (not sum(type, crop_type(crop,type))) = YES;

set plot /
  plot1*plot2
/;

alias(plot,plots)

set plotAttr /size,soilQuality,soilType,distance/;
set plotSize / 1ha,2ha,5ha,20ha  /;
set plot_plotSize(plot,plotSize);

set month / Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec/;
set halfMonth/ Jan1, Jan2, Feb1, Feb2, Mar1, Mar2, Apr1, Apr2, May1, May2, Jun1, Jun2, Jul1, Jul2, Aug1, Aug2, Sep1, Sep2, Oct1, Oct2, Nov1, Nov2, Dec1, Dec2 /;
alias(halfMonth,halfMonth1)
set month_halfMonth(month,halfMonth) /
  "Jan".("Jan1","Jan2")
  "Feb".("Feb1","Feb2")
  "Mar".("Mar1","Mar2")
  "Apr".("Apr1","Apr2")
  "May".("May1","May2")
  "Jun".("Jun1","Jun2")
  "Jul".("Jul1","Jul2")
  "Aug".("Aug1","Aug2")
  "Sep".("Sep1","Sep2")
  "Oct".("Oct1","Oct2")
  "Nov".("Nov1","Nov2")
  "Dec".("Dec1","Dec2")
/;

set cropHarvest_halfMonth(crop,type,halfMonth) /
  Zwiebeln.set.type.("SEP1","SEP2")
  Kartoffeln.set.type.("SEP1","SEP2","OCT1")
  Weizen.set.type."AUG1"
  Gerste.set.type."JUL2"
  Ackerbohnen.set.type."AUG2"
  Zuckerrueben.set.type."DEC1"
  MaisSilage.set.type."SEP2"
/;

cropHarvest_halfMonth(crop,type,halfMonth) $ (not crop_type(crop,type)) = NO;

set crop_type_halfMonth(crop,type,halfMonth);

set nutrient / N,P,K,S /;

set fertilizer /
  Guelle
  ASS
  KAS
/;

set operation "Field operators as defined by KTBL" /
  soilSample              "Bodenprobe"
  manDist                 "G�lleausbringung"
  basFert                 "P und K Duengung, typischerweise Herbst"
  plow                    "Pfl�gen"
  chiselPlow              "Tiefengrubber"
  seedBedCombi            "Saatbettkombination"
  herb                    "Herbizidma�nahme"
  sowMachine              "Saemaschine"
  directSowMachine        "Direktsaatmaschine"
  circHarrowSow           "Kreiselegge u. Drillmaschine Kombination"
  springTineHarrow        "Federzinkenegge"
  weedValuation           "Unkrautbonitur"
  weederLight             "Striegeln"
  weederIntens            "Hacken"
  plantvaluation          "Bestandsbonitur"
  NFert320
  NFert160
  combineCere             "M�hdrusch, Getreide"
  combineRape             "M�hdrusch, Raps"
  combineMaiz             "M�hdrusch, Mais"
  cornTransport           "Getreidetransport"
  store_n_dry_8
  store_n_dry_4
  store_n_dry_beans
  store_n_dry_rape
  store_n_dry_corn
  lime_fert               "Kalkung"
  stubble_shallow         "Stoppelbearbeitung flach"
  stubble_deep            "Stoppelbearbeitung tief"
  rotaryHarrow            "Kreiselegge"
  NminTesting             "Nmin Probenahme"
  mulcher                 "Mulcher"
  chitting                "Vorkeimen"
  solidManDist            "Miststreuer"
  seedPotatoTransp        "Pflanzkartoffeltransport"
  potatoLaying            "Legen von Kartoffeln"
  rakingHoeing            "Hacken, striegeln"
  earthingUp              "h�ufeln"
  knockOffHaulm           "Kartoffelkraut schlagen"
  killingHaulm            "Krautabt�ten"
  potatoHarvest           "Kartoffeln roden"
  potatoTransport         "Kartoffeln zum Lager transportieren"
  potatoStoring           "Kartoffeln lagern"
  singleSeeder            "Einzelkornlegeger�t f�r Zuckerr�ben/Mais"
  weederHand              "von Hand hacken"
  uprootBeets             "Zuckerr�ben roden"
  DiAmmonium              "Diammonphosphat streuen"
  grinding                "KornMahlen"
  disposal                "Erntegut festfahren"
  coveringSilo            "Silo reinigen und mit Folie verschliessen, Maiz"
  chopper                 "H�ckseln"
  grasReSeeding           "Grasnachs�en"
  roller                  "Walzen"
  mowing                  "M�hen mit M�haufbereiter"
  raking                  "Schwaden"
  tedding                 "Wenden mit Kreiselzettwender"
  silageTrailer           "Anwelkgut bergen mit Ladewagen"
  closeSilo               "Silo reinigen und mit Folie verschliessen"
  balePressWrap           "Ballen pressen und wickeln, Silage (Anwelkgut)"
  baleTransportSil        "Ballentransport Silageballen"
  baleTransportHay        "Ballentransport Heuballen"
  balePressHay            "Bodenheu pressen"
/;

set machType   /
  tractor
  tractorSmall
  plough                  "Pflug"
  chiselPlough            "Schwergrubber"
  sowMachine              "S�maschine"
  directSowMachine        "DirektS�maschine"
  seedBedCombi            "Saatbeetkombination"
  circHarrow              "Scheibenegge"
  springTineHarrow        "Federzinkenegge"
  fingerHarrow            "Hackstriegel"
  combine                 "Maehdrescher"
  cuttingUnitCere         "Getreideschneidwerk"
  cuttingAddRape          "Zusatzausruestung Rapsernte"
  cuttingUnitMaiz         "Maispflueckeinrichtung f�r M�hdrescher"
  rotaryHarrow            "Kreiselegge"
  mulcher                 "Mulcher"
  potatoPlanter           "Kartoffellegegeraet"
  potatoLifter            "Kartoffelroder"
  hoe                     "Hackmachine, 5-reihig"
  ridger                  "Haeufler"
  haulmCutter             "Krautschlaeger"
  forkLiftTruck           "Gabelstapler"
  threeWayTippingTrailer  "Dreiseitenkippanhaenger"
  Sprayer                 "Feldspritze"
  singleSeeder            "Einzelkornsaehgeraet (Rueben/Mais)"
  beetHarvester           "Ruebenroder"
  fertSpreaderSmall       "Duengerstreuer, 0.8cbm"
  fertSpreaderLarge       "Duengerstreuer, 4.0cbm"
  chopper                 "Feldhaecksler"
  cornHeader              "Maisgebiss fuer Haecksler"
  mowerConditioner        "Maehaufbereiter"
  grasReseedingUnit       "Gasnachsaemaschine"
  rotaryTedder            "Kreiselzettwender"
  rake                    "Schwader"
  roller                  "Walze"
  silageTrailer           "Silage trailer, service"
  balePressWrap           "Baler and bale wrapper, service"
  balePressHay            "Baler"
  closeSilo

  manbarrel,draghose,injector,trailingshoe

  solidManDist      "Miststreuer"
  frontLoader       "Frontlader"
  siloBlockCutter   "Siloblockschneider"
  shearGrab         "Schneidzange"
  dungGrab          "Dungzange"
  fodderMixingVeh8  "Futtermischwagen,  8m3, horizontale Schnecke, mit Befuellschild"
  fodderMixingVeh10 "Futtermischwagen, 10m3, vertikale Schnecke, mit Befuellschild"
  fodderMixingVeh16 "Futtermischwagen, 16m3, 2 vertikale Schnecken, mit Befuellschild"
/;

set machLifeUnit / hour,ha,m3,t,years /;
set labReqLevl / rf2,rf3 /;

set climateZone "German climate zone as defined by KTBL" / cz1*cz12 /;
set curClimateZone(climateZone);

set soil  /
  l "light",
  m "middle",
  h "heavy"
/;

set opAttr "Attributes for the different appplications" / labTime,Diesel,fixCost,varCost,nPers,Amount /;

set machVar  / 67kw,102Kw,200kW /;


set op_machType(operation,machType) "Links the operations to machinery";
op_machType("plow","plough")                                  = yes;
op_machType("chiselplow","chiselPlough")                      = yes;
op_machType("stubble_shallow","chiselPlough")                 = yes;
op_machType("stubble_deep","chiselPlough")                    = yes;
op_machType("seedBedCombi","seedBedCombi")                    = yes;
op_machType("springTineHarrow","springTineHarrow")            = yes;
op_machType("circHarrowSow","circHarrow")                     = yes;
op_machType("circHarrowSow","sowMachine")                     = yes;
op_machType("sowMachine","sowMachine")                        = yes;
op_machType("directSowMachine","directSowMachine")            = yes;
op_machType("combineCere","combine")                          = yes;
op_machType("combineCere","cuttingUnitCere")                  = yes;
op_machType("combineRape","combine")                          = yes;
op_machType("combineRape","cuttingUnitCere")                  = yes;
op_machType("combineRape","cuttingAddRape")                   = yes;
op_machType("combineMaiz","combine")                          = yes;
op_machType("combineMaiz","cuttingUnitMaiz")                  = yes;
op_machType("rotaryHarrow","rotaryHarrow")                    = yes;
op_machType("seedPotatoTransp","threeWayTippingTrailer")      = yes;
op_machType("seedPotatoTransp","forkLiftTruck")               = yes;
op_machType("potatoLaying","potatoPlanter")                   = yes;
op_machType("earthingUp","ridger")                            = yes;
op_machType("knockOffHaulm","haulmCutter")                    = yes;
op_machType("potatoHarvest","potatoLifter")                   = yes;
op_machType("potatoTransport","threeWayTippingTrailer")       = yes;
op_machType("basFert","fertSpreaderSmall")                    = yes;
op_machType("herb","Sprayer")                                 = yes;
op_machType("Nfert160","fertSpreaderSmall")                   = yes;
op_machType("Nfert320","fertSpreaderSmall")                   = yes;
op_machType("mulcher","mulcher")                              = yes;
op_machType("weederLight","fingerHarrow")                     = yes;
op_machType("weederIntens","hoe")                             = yes;

op_machType("singleSeeder","singleSeeder")                    = yes;
op_machType("uprootBeets","beetHarvester")                    = yes;
op_machType("DiAmmonium","fertSpreaderSmall")                 = yes;
op_machType("lime_fert","fertSpreaderLarge")                  = yes;
op_machType("cornTransport","threeWayTippingTrailer")         = yes;
* H�cksler(Chopper) ist bei KTBL nur Dienstleisung, somit nicht Teil des Maschinenparks
op_machType("chopper","chopper")                              = yes;

op_machType("tedding","rotaryTedder")                         = yes;
op_machType("raking","rake")                                  = yes;
op_machType("mowing","mowerConditioner")                      = yes;
op_machType("closeSilo","closeSilo")                          = yes;
op_machType("silageTrailer","silageTrailer")                  = yes;
op_machType("grasReSeeding","grasReSeedingUnit")              = yes;
op_machType("roller","roller")                                = yes;
op_machType("baleTransportSil","threeWayTippingTrailer")      = yes;
op_machType("baleTransportHay","threeWayTippingTrailer")      = yes;
* Ballenpresse/Wickler (balePressWrap) ist bei KTBL nur Dienstleisung, somit nicht Teil des Maschinenparks
op_machType("balePressWrap","balePressWrap")                  = yes;
op_machType("balePressHay","balePressHay")                    = yes;

op_machType(operation,"tractor") $ (not ( sameas(operation,"combineCere")
                                       or sameas(operation,"CombineRape")
                                       or sameas(operation,"CombineMaiz")
                                       or sameas(operation,"forkLiftTruck")
                                       or sameas(operation,"chopper")
                                       or sameas(operation,"potatoStoring")
                                       or sameas(operation,"silageTrailer")
                                                                                                                                                               or sameas(operation,"balePressWrap")
                                       or sameas(operation,"grinding")))       = Yes;

*
* ---- operations where light tractor is neeeded
*
op_machType(operation,"tractorSmall") $ op_machType(operation,"fertSpreaderSmall")       = YES;
op_machType(operation,"tractorSmall") $ op_machType(operation,"threeWayTippingTrailer")  = YES;
op_machType(operation,"tractorSmall") $ op_machType(operation,"sprayer")                 = YES;

op_machType("rotaryHarrow","tractorSmall")         = YES;
op_machType("roller","tractorSmall")               = YES;
op_machType("sowMachine","tractorSmall")           = YES;
op_machType("singleSeeder","tractorSmall")         = YES;
op_machType("weederLight","tractorSmall")          = YES;
op_machType("mulcher","tractorSmall")              = YES;
op_machType("knockOffHaulm","tractorSmall")        = YES;
op_machType("tedding","tractorSmall")              = YES;
op_machType("mowing","tractorSmall")               = YES;
op_machType("raking","tractorSmall")               = YES;
op_machType("earthingUp","tractorSmall")           = YES;
op_machType("manDist","tractorSmall")              = YES;

op_machType(operation,"tractor") $ op_machType(operation,"tractorSmall") = No;


*
* ---- operations where no tractor is needed
*
op_machType("soilSample",   "tractor")      = NO;
op_machType("weedValuation","tractor")      = NO;
op_machType("coveringSilo","tractor")       = NO;
op_machType("closeSilo","tractor")          = NO;
op_machType("plantValuation","tractor")     = NO;
op_machType("weedValuation","tractor")      = NO;
op_machType("store_n_dry_4","tractor")      = NO;
op_machType("store_n_dry_beans","tractor")  = NO;
op_machType("store_n_dry_8","tractor")      = NO;
op_machType("store_n_dry_rape","tractor")   = NO;

set op_rf(operation,labReqLevl) "Link between operation and available field working days requirement level"/
*
*    --- see page 245ff in KTBL 2012/13
*
* soilSample
  manDist                   .rf3
  basFert                   .(rf2,rf3)
  plow                      .rf3
  chiselPlow                .rf3
  seedBedCombi              .(rf2,rf3)
  herb                      .(rf2,rf3)
  sowMachine                .(rf2,rf3)
  directSowMachine          .(rf2,rf3)
  circHarrowSow             .(rf2,rf3)
  springTineHarrow          .(rf2,rf3)
* weedValuation
  weederLight               .(rf2,rf3)
  weederIntens              .(rf2,rf3)
* plantvaluation
  NFert320                  .(rf2,rf3)
  NFert160                  .(rf2,rf3)
* combine
* cornTransport
* store_n_dry_8
* store_n_dry_4
* store_n_dry_rape
  lime_fert                 .(rf2,rf3)
  stubble_shallow           .rf3
  stubble_deep              .rf3
  rotaryHarrow              .(rf2,rf3)
* NminTesting
  mulcher                   .(rf2,rf3)
  chitting                  .(rf2,rf3)
  solidManDist              .rf3
* seedPotatoTransp
  potatoLaying              .(rf2,rf3)
  rakingHoeing              .(rf2,rf3)
  earthingUp                .(rf2,rf3)
  knockOffHaulm             .(rf2,rf3)
  killingHaulm              .(rf2,rf3)
  potatoHarvest             .(rf2,rf3)
* potatoTransport
* potatoStoring
/;
