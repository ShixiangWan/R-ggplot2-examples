library(ggplot2) # 引入ggplot2包

Data <- read.delim("E:/R/searchBestDimension.txt") # 读入数据，列与列之间用制表符，空格符分割都可以

# 图层叠加，第一层ggplot函数是载入数据Data，aes是指定横轴是dimension列数据，纵轴是rate列数据
# 第二层是散点图层，指定了散点的颜色，透明度；aes(size = rate))是按照rate值绘制大小，动态滴
# 第三层指定x轴和y轴坐标
# 第四层指定x轴最小值，最大值，间隔
# 第五层指定y轴小数以百分比形式显示，还有最小值，最大值，间隔
# 第六层指定坐标轴文字大小和坐标轴标题文字大小
ggplot(Data, aes(dimension,rate)) +
  geom_point(color="#D86A6C", alpha=1, aes(size = rate)) +
  labs(x="Dimension", y="AP value") +
  scale_x_continuous(breaks=seq(10, 350, 30)) +
  scale_y_continuous(labels = scales::percent, breaks=seq(0.60, 0.76, 0.01)) +
  theme_bw() +
  theme(axis.text=element_text(size=15), axis.title=element_text(size=15))
