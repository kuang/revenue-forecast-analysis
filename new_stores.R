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
rev_total = as.numeric(t(input_sheet[15,quarterly_indexes]))

#training
new_stores <- new_stores["nstores"]
data <- data.frame(quarters, new_stores, rev_total)

fit <- lm(rev_total ~ as.matrix(new_stores), data=data)
summary(fit)

plot(data$nstores, data$rev_total, main="New Stores vs Revenue", xlab="Number of New Stores opened in a Quarter", ylab="Revenue")
eq = function(x){2450069+296353*x}
lines(eq(1:6), type='l')



