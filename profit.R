# allows reading of excel sheets
library(readxl)
# allows writing of excel sheets
library(writexl)
library(zoo)
library(forecast)

excel_sheets('financial_recleaned.xlsx')
excel_sheets('new_stores.xlsx')

input_sheet = read_excel("financial_recleaned.xlsx", sheet=1, col_names = TRUE)
new_stores = read_excel("new_stores.xlsx", sheet=1, col_names = TRUE)

#new dataframe

# zoo sequence to name year/quarter
quarters <- as.yearqtr(2011 + seq(0, 30)/4)
format(quarters, "%Y Quarter %q")
quarters <-  as.numeric(quarters)


quarterly_indexes = c()
for (i in 0:90) {
  if (i%%3==0) {
    quarterly_indexes <- c(quarterly_indexes, 5+i)
  }
}

profit_total = as.numeric(t(input_sheet[24,quarterly_indexes]))

profit_total <- as.data.frame((profit_total))
data <- data.frame(quarters, rev_used, rev_wholesale, rev_other, new_stores["nstores"], rev_total)
sample <- sample.int(n = nrow(data), size = floor(1*nrow(data)), replace = F)

training <- profit_total[sample,]
testing <- data[-sample,]

tsData = ts(profit_total, start = c(2011,1), frequency = 4)

fit <- auto.arima(tsData, approximation=FALSE, trace=FALSE)
arima_forecast = forecast(fit, h = 10)
accuracy(fit)
plot(arima_forecast, main="Profit Forecasting", xlab="Quarter", ylab="Gross Profit, in Thousands of Dollars")

summary(fit)
coef(fit)
x<-fitted(fit)







