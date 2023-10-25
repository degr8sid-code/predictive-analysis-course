# MASS also contains datasets
install.packages('MASS')
# Caret makes it easy to do ML tasks
install.packages('caret')

# load the required packages
library(tidyverse)
library(MASS)
library(caret)

# Step 1: Load the data
data("Boston", package = "MASS")
view(Boston)
?Boston

# Step 2: Data Wrangling

# Step 3: Visualize correlation between target
# and feature variable
ggplot(Boston, aes(lstat, medv) ) +
  geom_point() +
  geom_smooth()

# Step 4: Machine Learning
## Step 4.1: Split the dataset into training
## and testing parts
## We are discussing another method to partition
## data which is using caret library

# generate a random number
set.seed(1)

# create data partition by splitting 
# syntax: df_name <- df$targetVariable %>% 
# createDataParition(p = split %, list = FALSE)
training.samples <- Boston$medv %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- Boston[training.samples, ]
test.data <- Boston[-training.samples, ]

## Step 4.2: Decide which model you want to use
## We are testing data first using Linear Regression
## then using Polynomial Regression
# Build the model
model <- lm(medv ~ lstat, data = train.data)
# Make predictions
predictions <- model %>% predict(test.data)

# Step 4.3: Check Model performance
# model1_error <- data.frame(
#   RMSE = RMSE(predictions, test.data$medv),
#   R2 = R2(predictions, test.data$medv)
# )

RMSE = RMSE(predictions, test.data$medv)
R2 = R2(predictions, test.data$medv)

# polynomial regression
# medv=b0+b1∗lstat+b2∗lstat2
# Build the model
model2 <- lm(medv ~ poly(lstat, 5, raw = TRUE), data = train.data)
# Make predictions
predictions2 <- model2 %>% predict(test.data)
# Model performance
# model2_error <- data.frame(
#   RMSE2 = RMSE(predictions2, test.data$medv),
#   R22 = R2(predictions2, test.data$medv)
# )

RMSE2 = RMSE(predictions2, test.data$medv)
R22 = R2(predictions2, test.data$medv)

# In case, you don't get good results in Linear
# regression, you can use log() to transform your data
# and make it linear
# model <- lm(medv ~ log(lstat), data = train.data)

# in case your errors were stored in variables and not in df
# you can use this code to combine both and create a df
error_df <- data.frame(Model = c("Linear Regression",
                                 "Polynomial Regression"),
                       RMSE = c(RMSE, RMSE2),
                       R2 = c(R2, R22))
view(error_df)
