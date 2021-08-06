$ontext
parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,*) /
'1301705c-c8f9-4788-8ef6-5b642e2b651c'.'62f37b1a-6bf9-486b-9669-5d1f443d62c5'.'0'.'0'.'0'.'false'.'false'.'mrz' 1.82
'1301705c-c8f9-4788-8ef6-5b642e2b651c'.'62f37b1a-6bf9-486b-9669-5d1f443d62c5'.'0'.'0'.'0'.'false'.'false'.'apr' 7.88
'1301705c-c8f9-4788-8ef6-5b642e2b651c'.'62f37b1a-6bf9-486b-9669-5d1f443d62c5'.'0'.'0'.'0'.'false'.'false'.'mai' 3.08
'1301705c-c8f9-4788-8ef6-5b642e2b651c'.'62f37b1a-6bf9-486b-9669-5d1f443d62c5'.'0'.'0'.'0'.'false'.'false'.'sep' 16.62
'1301705c-c8f9-4788-8ef6-5b642e2b651c'.'62f37b1a-6bf9-486b-9669-5d1f443d62c5'.'0'.'0'.'0'.'false'.'false'.'okt' 5.13
'1301705c-c8f9-4788-8ef6-5b642e2b651c'.'62f37b1a-6bf9-486b-9669-5d1f443d62c5'.'0'.'0'.'0'.'false'.'false'.'grossMarginHa' 958
$offtext
$onempty
* sets 
*  crops
*  keys
*  c
* ;

parameter coefficients(*,*,*);
parameter reg(*,*);

$gdxin data/data.gdx
*$load crops=dim1
*$load keys=dim2
*$load c=dim3
$load coefficients
$gdxin 

$gdxin data/sqr.gdx
$load reg
$gdxin 


set plots_permPast(curPlots) / /;
set plots_duevEndangered(curPlots) //;
alias (curCrops,cropGroup)
set crops_cropGroup(curCrops,cropGroup);
crops_cropGroup(curCrops,cropGroup) $sameas(curCrops,cropGroup) = YES;

display crops_cropGroup;
$offempty
parameter p_cropData(curCrops,cropAttr) /
  set.curCrops.'maxShare' 100
/;

parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,*);

p_grossMarginData(curPlots,curCrops,"0","0","0","FALSE","FALSE",months) = 
  coefficients(curCrops,months,'c0')
   + coefficients(curCrops,months,'c1') * p_plotData(curPlots,'size')
   + coefficients(curCrops,months,'c2') * (p_plotData(curPlots,'size')**2)
   + coefficients(curCrops,months,'c3') * p_plotData(curPlots,'distance')
   + coefficients(curCrops,months,'c4') * p_plotData(curPlots,'size') * p_plotData(curPlots,'distance')
   + coefficients(curCrops,months,'c5') * (p_plotData(curPlots,'distance')**2)
  ;
  
  p_grossMarginData(curPlots,curCrops,"0","0","0","FALSE","FALSE","grossMarginHa") = 
    p_cropPrice(curCrops) * (reg(curCrops,'intercept') + reg(curCrops,'slope') * p_plotData(curPlots,'quality'))
    - coefficients(curCrops,"varCosts",'c0')
     + coefficients(curCrops,"varCosts",'c1') * p_plotData(curPlots,'size')
     + coefficients(curCrops,"varCosts",'c2') * (p_plotData(curPlots,'size')**2)
     + coefficients(curCrops,"varCosts",'c3') * p_plotData(curPlots,'distance')
     + coefficients(curCrops,"varCosts",'c4') * p_plotData(curPlots,'size') * p_plotData(curPlots,'distance')
     + coefficients(curCrops,"varCosts",'c5') * (p_plotData(curPlots,'distance')**2)
    ;
  
*display p_grossMarginData;