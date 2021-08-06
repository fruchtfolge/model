*
*  --- Load test include file, set WORKDIR and RANDOM
*      global variables for debugging in Atom
*
*$ontext
$offlisting
$offsymxref offsymlist

option
    limrow = 0,     
    limcol = 0,     
    sysout = off; 
*$offtext

*option limrow = 1000;
* option limcol = 1000;    
$include 'data/sets.gms'
$include 'data/calcGrossMargin.gms'
$SETGLOBAL WORKDIR './'
$SETGLOBAL RANDOM 'debug.json'
$include 'fruchtfolge.gms'

display p_totLand, v_totGM.l;


*v_binCropPlot.lo(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) =
*v_binCropPlot.l(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert);

*solve Fruchtfolge using MIP maximizing v_obje;
*option v_binCropPlot:0:0:1;
*display v_binCropPlot.l;
* Parameter p_testRed(curPlots,nReduction); 
* p_testRed(curPlots,nReduction) $ plots_duevEndangered(curPlots) = 
** $ (v_binCropPlot.l('Winterweizen - Brotweizen',curPlots,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
*p_grossMarginData(curPlots,'Winterweizen - Brotweizen','20','0',nReduction,'false','false',"minNAmount");
*
*display p_testRed;
* execute.async 'redLstSize debug.lst l=true';
