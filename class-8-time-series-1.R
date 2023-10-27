# install and load packages
install.packages("forecast")
library(tidyverse)
library(forecast)

# load the dataset
temperature <- read.csv("temperature.csv")
view(temperature)
# line 10-11 is another method to create a new
# column
#temperature['avg_temp'] <- 
#  rowMeans(temperature[2:13])
temperature$avg_temp <-
  rowMeans(temperature[2:13])

# data_temp contains anual data
data_temp <- data.frame(
  Year = temperature$year, 
  Temperature = temperature$avg_temp)

ggplot(data_temp, aes(Year,Temperature)) +
  geom_line() +
  geom_point() +
  theme(text = element_text(size = 9),
        element_line(linewidth =2)) +
  labs(x = "Year", 
       y = "Temperature", 
       title = "Temprature trend from 2000-2017"
       )

# use pivot_longer to convert the dataframe into a long/tidy
# format
temperature_temp <- temperature[,1:13]
data_temp_long <- temperature_temp %>% 
  pivot_longer(
    col=-year,
    names_to = "month",
    values_to = "temp"
  )

# now pass that long data to ts()
# to convert it into time series
ts_year <- ts(data = data_temp_long$temp,
               start = c(2000,1),
               end = c(2017,12),
               frequency = 12)

# next, pass it to decompose
data_temp_decompose <- decompose(ts_year)
# plot decompose
plot(data_temp_decompose)

# model_name <- auto.arima(
# dataframe$column
#)
# annual forecast
arima_model <- 
  auto.arima(data_temp$Temperature)
# name <- forecast(model_name, h = 
# number of months)
forecast_result <- 
  forecast(arima_model, h = 1)  # Forecasting 1 year ahead
forecast_result


# monthly forecast
arima_model <- 
  auto.arima(data_temp_long$temp)
forecast_result <- 
  forecast(arima_model, h = 1)  # Forecasting 1 year ahead
forecast_result
