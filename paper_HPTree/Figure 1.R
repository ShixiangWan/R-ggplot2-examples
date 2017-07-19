library(ggplot2) # 引入ggplot2包

# 每一行是一组数据，有几行放几组
datasets = c('2 nodes', '2 nodes', '2 nodes', '2 nodes',
          '3 nodes','3 nodes','3 nodes','3 nodes',
          '4 nodes','4 nodes','4 nodes','4 nodes')
x = c('1x', '20x', '50x', '100x',
      '1x', '20x', '50x', '100x',
      '1x', '20x', '50x', '100x')
x = factor(x, levels=x)
y = c(67, 189, 1232, 2586, 
      35, 96, 765, 1770,
      27, 65, 423, 1095)
tgg=data.frame(datasets, x, y)
ggplot(tgg, aes(x = factor(x), y = y, colour = datasets, group = datasets, shape = datasets)) + 
  geom_line(size=2.0) +
  geom_point(size=6) +
  scale_y_continuous(breaks=seq(0, 2600, 500)) +
  labs(x="The number of cluster nodes", y="Running time (s)") +
  #theme_bw() +
  theme(axis.text=element_text(size=15, color = 'black'), 
        axis.title=element_text(size=15, color = 'black'),
        legend.text=element_text(size=13),
        legend.title=element_blank())
