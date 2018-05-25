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

rev_used = as.numeric(t(input_sheet[7,quarterly_indexes]))
rev_wholesale = as.numeric(t(input_sheet[8,quarterly_indexes]))
rev_other = as.numeric(t(input_sheet[13,quarterly_indexes]))
rev_total = as.numeric(t(input_sheet[15,quarterly_indexes]))

rev_total <- as.data.frame((rev_total))
data <- data.frame(quarters, rev_used, rev_wholesale, rev_other, new_stores["nstores"], rev_total)
sample <- sample.int(n = nrow(data), size = floor(1*nrow(data)), replace = F)

training <- rev_total[sample,]
testing <- data[-sample,]
#rownames(data) <- quarters


tsData = ts(rev_total, start = c(2011,1), frequency = 4)
#tsData = ts(new_stores["nstores"], start = c(2011,1), frequency = 4)



fit <- auto.arima(tsData, approximation=FALSE, trace=FALSE)
arima_forecast = forecast(fit, h = 1)
accuracy(fit)
plot(arima_forecast)
#fit <- lm(rev_total ~ as.numeric(quarters), data=data)

summary(fit)
coef(fit)
x<-fitted(fit)

#c(data["rev_total"],rep(2011:2018))
#plot(c(data,rep(NA,12)),xaxt="n",ylab="CPI",xlab="",ylim=c(162,190))
#new.df <- data.frame(rev_used=c(3429247))
#predict(fit, )


#q <- as.numeric(quarters)
cpi<-c(rev_total)
#df <- data.frame(q,cpi)
#plot(df)+abline(lm(df$cpi~q))

#newQ <- as.data.frame(quarters)
#rep(newQ)

quarter<-rep(1:4,4)

plot(c(cpi,rep(NA,32)), xaxt="n", ylab="CPI",xlab="",ylim=c(2000000, 9000000))
#48, until 2025


#new_quarters <- as.yearqtr(2010 + seq(24, 47)/3)
#format(new_quarters, "%Y Quarter %q")
##new_quarters <-  as.numeric(new_quarters)
#newdata = data.frame(new_quarters)
#olddata = data.frame(quarters)

#old_data=data.frame(year=rep(c(2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025), each=3), quarter=rep(1:3,1))
testing=data.frame((year=new_quarters), quarter=rep(1:4,1))

year<-rep(2010:2025,each=4)
#newdata=data.frame(year=rep(c(2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025), each=3), quarter=rep(1:3,1))
#newdata=data.frame(year=rep(c(2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033), each=3), quarter=rep(1:3,1))


#predict(fit, newdata)
#newdata=data.frame(year=rep(c(2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025), each=4), quarter=rep(1:4,1))
#newdata <- newdata[1:31,]
  



lines(1:31, predict(
  fit,
  testing))
year<-rep(2010:2025,each=4)

axis(1,labels=paste(year,quarter,sep=" Q"),at=1:64,las=3)
#curve(fit, from=2010, to=2025, xlab="x", ylab="y")
#abline(coef(fit)[2010:2025])




