setwd('D:/collective_feeding_data/')
library(plotly)
library(ggplot2)
data <- read.csv("centerfood_64x_annot.csv", header=F, stringsAsFactors = F)
nfly <- ncol(data) / 6

xcor <- data[, seq(2, ncol(data), 6)]
ycor <- data[, seq(3, ncol(data), 6)]

xcor[xcor == -1] <- NA
ycor[ycor == -1] <- NA

xcor.vector <- c()
ycor.vector <- c()

for (i in (1: ncol(xcor))){
  for (j in (1: nrow(xcor))){
    if (!is.na(xcor[j, i])){
      xcor.vector <- c(xcor.vector, xcor[j, i])
    }
    if (!is.na(ycor[j, i])){
      ycor.vector <- c(ycor.vector, ycor[j, i])
    }
  }
}

xycor <- data.frame(xcor.vector, ycor.vector)

p <- ggplot(xycor, aes(xcor.vector, ycor.vector)) +
     stat_bin2d(geom = "tile", bins = 20) + 
     theme_minimal() + 
     theme(panel.border = element_blank(),
           panel.grid.major = element_blank(),
           panel.grid.minor = element_blank(),
           axis.line = element_blank(),
           axis.text.x = element_text(angle = 0),
           axis.text.y = element_text(angle = 0),
           legend.position="top"
      ) 

ggsave(plot=p,height=6,width=6,dpi=200, filename="heatmap_bin20.pdf", useDingbats=FALSE)
