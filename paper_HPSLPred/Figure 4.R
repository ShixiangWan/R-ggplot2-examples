library(ggplot2)
library(ggthemes)

dt = data.frame(obj = c('IBk','RandomForest', 'J48', 'BRkNN', 'HOMER', 'MLkNN', 'IBLR_ML', 'DMLkNN', 'HPSLPred'), 
                val = c(0.6393, 0.6668, 0.6403, 0.6609, 0.5161, 0.6750, 0.6827, 0.6765, 0.7421),
                group = c('methods of WEKA', 'methods of WEKA', 'methods of WEKA', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'our method'))
dt$obj = factor(dt$obj, levels=c('IBk','RandomForest', 'J48', 'BRkNN', 'HOMER', 'MLkNN', 'IBLR_ML', 'DMLkNN', 'HPSLPred'))
dt$group = factor(dt$group, levels=c('methods of WEKA', 'methods of WEKA', 'methods of WEKA', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'methods of Mulan', 'our method'))
f <- ggplot(dt, aes(x = obj, y = val, fill = group)) + 
  geom_bar(stat = "identity") +
  geom_text(aes(label=val), vjust=-1.0, size=4.5) +
  labs(x="Methods", y="Average Precision (AP)", fill='method') +
  theme_bw() +
  scale_y_continuous(labels = scales::percent, breaks=seq(0, 0.90, 0.05)) +
  coord_cartesian(ylim=c(0.40, 0.75)) +
  theme(axis.text=element_text(size=12, color = 'black'), 
        axis.title=element_text(size=15, color = 'black')) 


ggsave(f, file="Figure 4.tiff", dpi=300)
