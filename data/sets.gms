set cropAttr / maxShare /;
set plotAttr /size,distance,quality/;
set symbol / lt,gt /;
set months /jan,feb,mrz,apr,mai,jun,jul,aug,sep,okt,nov,dez/;
set years / 2001*2050 /;
set catchCrop / false/;
set autumnFert / false/;
set manAmounts /0,10,15,20,25,30,40,50,60/;
set nReduction /'0','0.1','0.2','0.3','0.4'/;
set solidAmounts /'0','5','10','12','15','20'/;
set curYear(years) / 2020 /;
$setglobal duev2020 "true"
scalar manStorage /1200 /;
scalar manPriceSpring /15 /;
scalar manPriceAutumn /30 /;
scalar solidStorage /0 /;
scalar solidPriceSpring /0 /;
scalar solidPriceAutumn /0 /;

set man_attr /
amount
n
p
k
minUsagePercent

/;

parameter p_manure(man_attr) /
"amount" 0
"n" 6.5
"p" 2.2
"k" 7.1
"minUsagePercent" 50

/;
$onempty
parameter p_solid(man_attr) /

/;
$offempty