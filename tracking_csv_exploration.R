setwd('D:/collective_feeding/')
library(plotly)
data <- read.csv("centerfood_64x_annot.csv", header=F, stringsAsFactors = F)
nfly <- ncol(data) / 6
for (i in 1:)