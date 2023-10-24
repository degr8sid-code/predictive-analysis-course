library(tidyverse)
# read csv
df_toys <- read.csv("ToySalesComplete.csv")
# data wrangling

# scatter plot to check relation between features
# and target variables

# Price and UnitSales
df_toys %>%
  ggplot(aes(Price, UnitSales)) +
  geom_point() +
  geom_smooth(method="lm")

# Adexp and UnitSales
df_toys %>% 
  ggplot(aes(Adexp, UnitSales)) +
  geom_point() +
  geom_smooth(method="lm")

# Promexp and UnitSales
df_toys %>% 
  ggplot(aes(Promexp, UnitSales)) +
  geom_point() +
  geom_smooth(method="lm")

# split the dataset
set.seed(1)
df_toys$id <- 1:nrow(df_toys)
train <- df_toys %>% sample_frac(0.80)
test <- anti_join(df_toys, train_toys,
                       by="id")

# train the model
model <- lm (UnitSales ~ Price +
               Adexp +
               Promexp,
             data = train)

summary(model)

# test the model
test$predicted_values <- predict(model, test)
view(test)

# calculate the error
error <- sqrt(mean(((test$UnitSales) - 
                     (test$predicted_values))^2))
print(error)

# Class Activity
view(mtcars)
?mtcars
