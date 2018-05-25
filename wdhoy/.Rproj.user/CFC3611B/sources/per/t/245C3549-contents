# allows reading/writing of excel sheets, functions
library(readxl)
library(writexl)
library(zoo)
library(forecast)

excel_sheets('financial_recleaned.xlsx')
excel_sheets('new_stores.xlsx')

#read excel sheets
input_sheet = read_excel("financial_recleaned.xlsx", sheet=1, col_names = TRUE)
new_stores = read_excel("new_stores.xlsx", sheet=1, col_names = TRUE)

#get data
quarterly_indexes = c()
for (i in 0:90) {
  if (i%%3==0) {
    quarterly_indexes <- c(quarterly_indexes, 5+i)
  }
}

#zoo sequence to create name as year/quarter
quarters <- as.yearqtr(2011 + seq(0, 30)/4)
format(quarters, "%Y Quarter %q")
quarters <-  as.numeric(quarters)


#REVENUE FORECAST

#organize data for arima model
rev_used = as.numeric(t(input_sheet[7,quarterly_indexes]))
rev_wholesale = as.numeric(t(input_sheet[8,quarterly_indexes]))
rev_other = as.numeric(t(input_sheet[13,quarterly_indexes]))
rev_total = as.numeric(t(input_sheet[15,quarterly_indexes]))
rev_total <- as.data.frame((rev_total))

#training
data <- data.frame(quarters, rev_used, rev_wholesale, rev_other, new_stores["nstores"], rev_total)
sample <- sample.int(n = nrow(data), size = floor(1*nrow(data)), replace = T)

training <- rev_total[sample,]
testing <- data[-sample,]

#change to time series for arima
tsData = ts(rev_total, start = c(2011,1), frequency = 4)

#model and graph
fit <- auto.arima(tsData, approximation=FALSE, trace=FALSE)
arima_forecast = forecast(fit, h = 1)
accuracy(fit)
plot(arima_forecast)

#forecast
arima_forecast

#accuracy
summary(fit)



