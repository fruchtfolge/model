table p_plotAttr(plot,plotAttr)
        size  soilQuality  soilType  distance
plot1    5      60           3         15
plot2   16      50           2         10
;

*set plotSize / 1ha,2ha,5ha,20ha  /;

plot_plotSize(plot,'1ha') $ (p_plotAttr(plot,"size") < 1.5) = YES;
plot_plotSize(plot,'2ha') $ ((p_plotAttr(plot,"size") < 3.5) $ (p_plotAttr(plot,"size") > 1.5)) = YES;
plot_plotSize(plot,'5ha') $ ((p_plotAttr(plot,"size") < 15) $ (p_plotAttr(plot,"size") > 3.5)) = YES;
plot_plotSize(plot,'20ha') $ (p_plotAttr(plot,"size") > 15) = YES;

* use average for now
scalar p_yieldMedian;
p_yieldMedian = sum(plot, p_plotAttr(plot,'soilQuality')) / card(plot);

p_yieldVariation(plot) =
  p_plotAttr(plot,'soilQuality') / p_yieldMedian
;
