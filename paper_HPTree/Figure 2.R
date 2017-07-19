library(ggplot2) # 引入ggplot2包
library(easyGgplot2)

x = rep(c('1x',
          '20x',
          '50x', 
          '100x'), each = 2)
x = factor(x, levels=x)
label = c('aligned','unaligned', 
           'aligned','unaligned', 
           'aligned','unaligned', 
           'aligned','unaligned')
y = c(27, 56, 
      65, 238, 
      423, 846, 
      1095, 1720)
plot1 = ggplot(data = data.frame(x = x, y = y, label = label), 
               mapping = aes(x = x, y = y, fill = label)) + 
  labs(x="", y="Running time (s)", fill='method') +
  geom_bar(stat = 'identity', width = 0.8, position = position_dodge(0.8)) +
  scale_y_continuous(breaks=seq(0, 1800, 200)) +
  theme(axis.text=element_text(size=15, color = 'black'), 
        axis.title=element_text(size=15, color = 'black'),
        legend.position=c(0.2, 0.9),
        legend.text=element_text(size=15),
        legend.title=element_blank())

x2 = rep(c('16s rRNA small',
          '16s rRNA big'), each = 2)
x2 = factor(x2, levels=x2)
label2 = c('aligned','unaligned',
          'aligned','unaligned')
y2 = c(3159, 4739, 
      30012, 35869)
plot2 = ggplot(data = data.frame(x = x2, y = y2, label = label2), 
               mapping = aes(x = x2, y = y2, fill = label2)) + 
  labs(x="", y="Running time (s)", fill='method') +
  geom_bar(stat = 'identity', width = 0.8, position = position_dodge(0.8)) +
  scale_y_continuous(breaks=seq(0, 60000, 5000)) +
  theme(axis.text=element_text(size=15, color = 'black'), 
        axis.title=element_text(size=15, color = 'black'),
        legend.position=c(0.2, 0.9),
        legend.text=element_text(size=15),
        legend.title=element_blank())

ggplot2.multiplot(plot1, plot2, cols=2)


