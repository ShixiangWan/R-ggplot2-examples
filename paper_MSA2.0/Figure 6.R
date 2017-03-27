library(ggplot2) # 引入ggplot2包

datasets = c('Φ_DNA (100×)', 'Φ_DNA (100×)', 'Φ_DNA (100×)', 'Φ_DNA (100×)', 'Φ_DNA (100×)',
          'Φ_DNA (1000×)','Φ_DNA (1000×)','Φ_DNA (1000×)','Φ_DNA (1000×)','Φ_DNA (1000×)',
          'Φ_Protein (100×)', 'Φ_Protein (100×)', 'Φ_Protein (100×)', 'Φ_Protein (100×)', 'Φ_Protein (100×)',
          'Φ_Protein (1000×)','Φ_Protein (1000×)','Φ_Protein (1000×)','Φ_Protein (1000×)','Φ_Protein (1000×)')
x = c(1, 2, 4, 8, 12,
      1, 2, 4, 8, 12,
      1, 2, 4, 8, 12,
      1, 2, 4, 8, 12)
# y = c(120, 60, 30, 15, 10, 
#       1020, 510, 255, 127.5, 85, 
#       120, 60, 30, 15, 10, 
#       780, 390, 195, 97.5, 65)
y = c(98, 49, 22, 13, 10, 
      911, 426, 203, 107.5, 85, 
      109, 51, 27.5, 14, 10, 
      653, 352, 139, 78.5, 65)
tgg=data.frame(datasets, x, y)
ggplot(tgg, aes(x = factor(x), y = y, colour = datasets, group = datasets, shape = datasets)) + 
  geom_line(size=1.2) +
  geom_point(size=5) +
  scale_y_continuous(breaks=seq(0, 1000, 100)) +
  labs(x="The number of data nodes", y="Running time (min)") +
  theme_bw() +
  theme(axis.text=element_text(size=12), axis.title=element_text(size=15))
