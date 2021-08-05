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
set plotAttr /size,distance,quality/;

set curPlots /
  plot0
  plot1
  plot2
  plot3
  plot4
  plot5
  plot6
  plot7
  plot8
  plot9
/;

* Parameter including the plots attributes, currently only size (ha)
parameter p_plotData(curPlots,plotAttr) /
  plot0.size 4.2311
  plot0.distance 0.256785599367059
  plot0.quality 37.5
  plot1.size 0.8616
  plot1.distance 0.693268840257338
  plot1.quality 37.5
  plot2.size 2.1585
  plot2.distance 0.842036958794689
  plot2.quality 37.5
  plot3.size 0.5871
  plot3.distance 2.11958038209189
  plot3.quality 52.0
  plot4.size 2.1763
  plot4.distance 0.375667327147347
  plot4.quality 32.5
  plot5.size 1.4737
  plot5.distance 0.296284776029999
  plot5.quality 37.5
  plot6.size 4.272
  plot6.distance 0.197375708565824
  plot6.quality 32.5
  plot7.size 0.6619
  plot7.distance 0.529262698738047
  plot7.quality 32.5
  plot8.size 0.3874
  plot8.distance 0.160451434583689
  plot8.quality 37.5
  plot9.size 0.1966
  plot9.distance 1.990790522485127
  plot9.quality 37.5
/;

* Set containing the names of the crops that may be cultivated
* - Make sure that the names are GAMS compatible (no umlauts, spaces)
* - A list of all crops can be found here: https://github.com/fruchtfolge/client/blob/master/assets/js/crops.js
set curCrops /
   "115"
   "171"
   "411"
/;

 parameter p_cropPrice /
   "115"  15.9
   "171"  1.9
   "411"  2.9
/;


sets 
 crops
 keys
 c
;

parameter coefficients(*,*,*);
parameter reg(*,*);

$gdxin data.gdx
$load crops=dim1
$load keys=dim2
$load c=dim3
$load coefficients
$gdxin 

$gdxin sqr.gdx
$load reg
$gdxin 

set manAmounts /""/;
set solidAmounts /""/;
set nReduction /""/;

set catchCrop / FALSE /;
set autumnFert / FALSE /;
$offempty

set months /jan,feb,mrz,apr,mai,jun,jul,aug,sep,okt,nov,dez/;

parameter p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,*);

p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,months) = 
  coefficients(curCrops,months,'c0')
   + coefficients(curCrops,months,'c1') * p_plotData(curPlots,'size')
   + coefficients(curCrops,months,'c2') * (p_plotData(curPlots,'size')**2)
   + coefficients(curCrops,months,'c3') * p_plotData(curPlots,'distance')
   + coefficients(curCrops,months,'c4') * p_plotData(curPlots,'size') * p_plotData(curPlots,'distance')
   + coefficients(curCrops,months,'c5') * (p_plotData(curPlots,'distance')**2)
  ;
  
  p_grossMarginData(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert,"grossMarginHa") = 
    p_cropPrice(curCrops) * (reg(curCrops,'intercept') + reg(curCrops,'slope') * p_plotData(curPlots,'quality'))
    - coefficients(curCrops,"varCosts",'c0')
     + coefficients(curCrops,"varCosts",'c1') * p_plotData(curPlots,'size')
     + coefficients(curCrops,"varCosts",'c2') * (p_plotData(curPlots,'size')**2)
     + coefficients(curCrops,"varCosts",'c3') * p_plotData(curPlots,'distance')
     + coefficients(curCrops,"varCosts",'c4') * p_plotData(curPlots,'size') * p_plotData(curPlots,'distance')
     + coefficients(curCrops,"varCosts",'c5') * (p_plotData(curPlots,'distance')**2)
    ;
  
display p_grossMarginData;