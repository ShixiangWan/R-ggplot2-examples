library(ggplot2) # 引入ggplot2包

############ 内存占用率图 ############
x <- rep(c('Φ_DNA (100×)','Φ_DNA (1000×)','Φ_Protein (100×)', 'Φ_Protein (1000×)'), each = 2)
method <- c('HAlign','HAlign-II', 'HAlign','HAlign-II', 'SparkSW','HAlign-II', 'SparkSW','HAlign-II')
z <- c(10.1, 2.3, 
       36, 10.9, 
       3.7, 1.2, 
       18, 9.5)
df <- data.frame(x = x, y = method, z = z)
df$method <- factor(df$y, levels=df$y)
ggplot(data = df, mapping = aes(x = x, y = z, fill = df$method)) + 
  labs(x="Datasets", y="Average maximum memory usage (GB)", fill='method') +
  geom_bar(stat = 'identity', width = 0.6, position = position_dodge(0.7)) +
  scale_y_continuous(breaks=seq(0, 100, 5)) +
  theme_bw() +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=15))