*
*  --- Load test include file, set WORKDIR and RANDOM
*      global variables for debugging in Atom
*
$offlisting
$offsymxref offsymlist

option
    limrow = 0,     
    limcol = 0,     
    sysout = off; 
    
$include 'test/include/farm5.gms'
$SETGLOBAL WORKDIR './'
$SETGLOBAL RANDOM 'debug.json'
$include 'fruchtfolge.gms'

display p_totLand, v_totGM.l;


execute.async 'redLstSize debug.lst l=true';
