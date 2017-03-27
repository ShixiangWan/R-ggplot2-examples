library(ggplot2)
library(ggthemes)

dt = data.frame(obj = c('IBk','RandomForest', 'J48', 'BRkNN', 'HOMER', 'MLkNN', 'IBLR_ML', 'DMLkNN', 'HPSLPred'), 
                val = c(0.6595, 0.6820, 0.6381, 0.6634, 0.4771, 0.6790, 0.6863, 0.6805, 0.7245),
                group = c('methods of WEKA', 'methods of WEKA', 'methods of WEKA', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'our method'))
dt$obj = factor(dt$obj, levels=c('IBk','RandomForest', 'J48', 'BRkNN', 'HOMER', 'MLkNN', 'IBLR_ML', 'DMLkNN', 'HPSLPred'))
dt$group = factor(dt$group, levels=c('methods of WEKA', 'methods of WEKA', 'methods of WEKA', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'our method'))
ggplot(dt, aes(x = obj, y = val, fill = group)) + 
  geom_bar(stat = "identity") +
  geom_text(aes(label=val), vjust=-1.0, size=4.5) +
  labs(x="Methods", y="Average Precision (AP)", fill='method') +
  theme_bw() +
  scale_y_continuous(labels = scales::percent, breaks=seq(0, 0.90, 0.05)) +
  coord_cartesian(ylim=c(0.40, 0.75)) +
  theme(axis.text=element_text(size=12, color = 'black'), 
        axis.title=element_text(size=15, color = 'black')) 


