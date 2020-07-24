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
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
    $ (not plots_permPast(curPlots)),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert)
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
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert))
  + v_devOneCrop(curPlots)
  =E= 1
;

*
*  --- prohibit growing a crop on a plot when there is no gross margin present
*
 v_binCropPlot.up(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) $ ((not
   p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert))
   $ (not plots_permPast(curPlots))) = 0;
  
*
*  --- Enter user specified constraints into the model, 
*
$iftheni.constraints defined constraints
e_minimumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (not (constraints_lt(constraints,'lt'))))..
  sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert), 
    v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) 
    * p_plotData(curPlots,'size'))
    + v_devUserShares(constraints,curCrops,curCrops1)
  =G= p_constraint(constraints,curCrops,curCrops1) 
;  

e_maximumShares(constraints,curCrops,curCrops1) 
       $ (p_constraint(constraints,curCrops,curCrops1) 
       $ (constraints_lt(constraints,'lt')))..
   sum(p_c_m_s_n_z_a(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
     v_binCropPlot(curPlots,curCrops,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) 
     * p_plotData(curPlots,'size'))
    + sum(p_c_m_s_n_z_a(curPlots,curCrops1,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert),
      v_binCropPlot(curPlots,curCrops1,manAmounts,solidAmounts,nReduction,catchCrop,autumnFert) 
      * p_plotData(curPlots,'size'))
    =L= 
    p_constraint(constraints,curCrops,curCrops1)
    + v_devUserShares(constraints,curCrops,curCrops1)
;  
$endif.constraints
