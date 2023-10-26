library(tidyverse)
library(stats)
library(ggfortify)
library(factoextra)
# dplyr and ggplot 2 from tidyverse
# remove labels because we want to 
# use it for unsupervised learning
view(iris)
data_2 <- iris[,1:4]
data_scale_2 <- scale(data_2)

?dist
data_scale_dist_2 <- dist(data_scale_2)
# or
data_scale_dist_2 <- dist(data_scale_2, 
                          method="euclidean")
hc_output <- hclust(
  data_scale_dist_2, method = "complete"
)

hc_output
# dendrogram
plot(hc_output)
?rect
rect.hclust(hc_output, k = 3)