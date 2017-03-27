library(ggplot2) # 引入ggplot2包
library(grid)

Data <- read.delim("E:\\myProgram\\R\\paper_HPSLPred\\searchBestDimension.txt") # 读入数据，列与列之间用制表符，空格符分割都可以
p1 <- ggplot(Data, aes(dimension, rate)) +
  geom_point(color="#D86A6C", alpha=1, size = 6) +
  geom_line(size=1.2) +
  labs(x="First Round", y="AP") +
  scale_x_continuous(breaks=seq(10, 350, 30)) +
  scale_y_continuous(labels = scales::percent, breaks=seq(0.60, 0.76, 0.005)) +
  theme_bw() +
  theme(axis.text=element_text(size=12, color = 'black'), 
        axis.title=element_text(size=15, color = 'black'))

Data2 <- read.delim("E:\\myProgram\\R\\paper_HPSLPred\\searchBestDimension2.txt")
p2 <- ggplot(Data2, aes(dimension2, rate2)) +
  geom_point(color="#D86A6C", alpha=1, size = 10) +
  geom_line(size=1.2) +
  labs(x="Second Round", y="AP") +
  scale_x_continuous(breaks=seq(20, 30, 1)) +
  scale_y_continuous(labels = scales::percent, breaks=seq(0.755, 0.762, 0.0005)) +
  coord_cartesian(ylim=c(0.755, 0.760)) +
  theme_bw() +
  theme(axis.text=element_text(size=12, color = 'black'), 
        axis.title=element_text(size=15, color = 'black'))

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

multiplot(p1, p2, cols=1)
