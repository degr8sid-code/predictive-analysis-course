# time series 
library(tidyverse)
AirPassengers
data_AP <- AirPassengers
head(data_AP)
tail(data_AP)
view(data_AP)
# time series function to specify the frequency
# 12 months data
# year starts from 1949
plot(data_AP)

attributes(data_AP)
start(data_AP)
end(data_AP)
# checking missing values
sum(is.na(data_AP))
# viewing statistical summary
summary(data_AP)
# since the data is already in ts, we don't have 
# apply ts() function
#ts(Ap, frequency=12,
#   start=c(1949,1))
# we'll create the decompose chart
plot(data_AP)
decompose_AP <- decompose(data_AP)
plot(decompose_AP)
# log transformation to smooth the data
data_AP_log <- log(data_AP)
plot(data_AP)

# train
model <- auto.arima(data_AP_log)

# forecast
f <- forecast(model, h = 6)
print(f)
accuracy(f)
