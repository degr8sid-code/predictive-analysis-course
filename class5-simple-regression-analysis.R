# load the required libraries
library(tidyverse)
# load/view the dataset
view(cars)
# data wrangling process

# visualize the feature and target variable
cars %>% 
  ggplot(aes(speed,dist)) +
  geom_point() +
  geom_smooth()

# train the model
# split dataset into 2 parts: training, testing
# 80% training data, 20% testing data

#make this example reproducible
set.seed(1)
#create ID column
cars$id <- 1:nrow(cars)
#use 70% of dataset as training set and 30% as test set
# dataframe_new <- 
#              actual_dataframe %>% sample_frac(value)
train <- cars %>% sample_frac(0.80)
# dataframe_new <- anti_join(actual_dataframe, 
#                     training_dataframe, by = 'column')
test_2  <- anti_join(cars, train, by = 'id')

# syntax: 
# name <- lm(target ~ feature, data=dataframe)
model <- lm(dist ~ speed, data=train)
summary(model)
# y = mx + b
# target = weight*feature
# target = weight1*feature1 + weight2*feature2 + weight3*feature3 + ..
# house_price = weigh1*number_of_rooms + weight2*community + weight3*age_of_house
# test the mode
# predict(modelname, dataframe)
# predict(model, data.frame(speed=c(12.5, 15.5, 17)))
predict(model, test_2)
view(test_2)


View(model)
model$residuals <- model$residual
cars$predicted <- model$fitted.values


