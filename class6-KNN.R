?iris
library(tidyverse)
# For train test split
library(caret)
# For KNN model
# install.packages('class')
library(class)
# to create chart in grid
# install.packages('gridExtra')
library(gridExtra)

# load the dataset
data <- iris
view(data)
# we'll separate the row labels as these labels are target
# variables, and we want to convert the actual labels
# to numerical labels
# assigning row labels
row_labels <- data[, 5]


# encode target as numeric
data$Species <- as.numeric(data$Species)
view(data)
# since we work with distance, we want to ensure that the 
# distances between data points is as small as possible
data[,1:4] <- scale(data[,1:4])
view(data)

# # set seed
# set.seed(1)
# # pick 80% of the rows
# size <- floor(0.8 *  nrow(data))
# # assign it to train_ind as a sample
# train_ind <- sample(seq_len(nrow(data)), size = size)
# # pick labels of the particular training data rows
# train_labels <- data[train_ind, 5]
# # assign actual training data
# data_train <- data[train_ind,1:4]
# # assign testing data
# data_test <- data[-train_ind,1:4]
# data_test_labels <- row_labels[-train_ind]

# train/test split
# this time, in KNN, we split the numeric labels separately
# Set the seed for reproducibility
set.seed(1)

# Create a list of indices for the training set
train_index <- createDataPartition(data$Species, p = 0.8, 
                                   list = FALSE)
# Split the data into training and testing sets
data_train <- data[train_index, 1:4]
train_labels <- data[train_index, 5]
data_test <- data[-train_index, 1:4]
data_test_labels <- data[-train_index, 5]
# view(data_test_labels)
# Fit KNN Model
classifications <- knn(train = data_train,
                   test = data_test,
                   cl = train_labels,
                   k= 11)
view(classifications)
typeof(classifications)
# we're creating a separate df that we'll put on the chart
# the df consists of results from actual values
# and predicted values
plot_classifications <- data.frame(
  data_test$Sepal.Length,
  data_test$Sepal.Width,
  data_test$Petal.Length,
  data_test$Petal.Width,
  classified = classifications,
  actual = as.factor(data_test_labels))

typeof(plot_classifications$actual)
# we also create a vector for to store column names of 
# that df
colnames(plot_classifications) <- c("Sepal.Length",
                                "Sepal.Width",
                                "Petal.Length",
                                "Petal.Width",
                                "classified",
                                "Actual.Values")
# Visualize the KNN algorithm results.
p1 <- ggplot(plot_classifications, 
             aes(Petal.Length, Petal.Width, 
                 color = classified, fill = classified)) + 
  geom_point(alpha= 0.5, size = 5) + 
  ggtitle("Classification Result Between Petal Length 
          and Width") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "none")


p2 <- ggplot(plot_classifications, 
             aes(Sepal.Length, Sepal.Width, 
                 color = classified, fill = classified)) + 
  geom_point(alpha=0.5, size = 5) + 
  ggtitle("Classification Result between 
          Sepal Length and Sepal") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position = "none")

p3 <- ggplot(plot_classifications, 
             aes(Petal.Length, Petal.Width, 
                 color = Actual.Values)) + 
  geom_point(alpha= 0.5, size = 5) + 
  ggtitle("Actual Value Between Petal Length 
          and Width") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "none")

grid.arrange(p1, p2, ncol=2)
