$include 'data/sets.gms'
$include 'data/include_example.gms'
$include 'data/calcGrossMargin.gms'
$SETGLOBAL WORKDIR './'
$SETGLOBAL RANDOM 'debug.json'
$include 'fruchtfolge.gms'

display p_totLand, v_totGM.l;