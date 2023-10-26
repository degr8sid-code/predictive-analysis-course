# install these packages
install.packages("ggfortify")
install.packages("factoextra")

# load the libraries
library(tidyverse)
library(stats)
library(ggfortify)
library(factoextra)
# dplyr and ggplot2 are part of tidyverse

# remove labels because 
# we want to use it for unsupervised learning

view(iris)
# load the dataset
data <- iris[,1:4]
# scale the dataset
data_scale <- scale(data)
# specify the distance between data points
# data_scale_dist <- dist(data_scale)

# find how many clusters we need
# visualization to view the clusters we may have
# we use wss plot to view clusters
# the elbow is where we divide the clusters
fviz_nbclust(data_scale, kmeans, method="wss") +
  labs(subtitle="Elbow method")

fviz_nbclust(data_scale, kmeans, method="silhouette") +
  labs(subtitle="Silhouette method")

fviz_nbclust(data_scale, kmeans, method="gap_stat") +
  labs(subtitle="Gap Stat method")
# KM = kmeans(data,2)
?kmeans
# syntax: kmeans(dataset, centers=k, nstart=n)
# random start point
model_km <- kmeans(data_scale,centers= 3, nstart=10)

# cluster plot
# boundary around the clusters
autoplot(model_km, data_scale, frame= TRUE)
# no boundary around the clusters
autoplot(model_km, data_scale)

# visualize it in a better way
km.clusters <- model_km$cluster
# Setosa_123
# Setosa_1
# Setosa_2
# rownames(data_scale) <- iris$Species
rownames(data_scale) <- paste(iris$Species, 
                        1:dim(iris)[1], 
                        sep="_")
fviz_cluster(list(data=data_scale, 
                  cluster = km.clusters),  
             show.clust.cent = TRUE)
table(km.clusters, iris$Species)
