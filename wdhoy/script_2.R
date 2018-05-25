# allows reading of excel sheets
library(readxl)
# allows writing of excel sheets
library(writexl)
library(zoo)

excel_sheets('financial_cleaned.xlsx')

input_sheet = read_excel("financial_cleaned.xlsx", sheet=1, col_names = TRUE)

#new dataframe

# zoo sequence to name year/quarter
quarters <- as.yearqtr(2010 + seq(0, 23)/3)
format(quarters, "%Y Quarter %q")



quarterly_indexes = c()
for (i in 0:69) {
  if (i%%3==0) {
    quarterly_indexes <- c(quarterly_indexes, 5+i)
  }
}

rev_used = as.numeric(t(input_sheet[7,quarterly_indexes]))
rev_wholesale = as.numeric(t(input_sheet[8,quarterly_indexes]))
rev_other = as.numeric(t(input_sheet[13,quarterly_indexes]))
rev_total = as.numeric(t(input_sheet[15,quarterly_indexes]))

data <- data.frame(rev_used, rev_wholesale, rev_other, rev_total)
rownames(data) <- quarters



fit <- lm(rev_total ~ as.numeric(quarters), data=data)
summary(fit)
x<-fitted(fit)

#c(data["rev_total"],rep(2011:2018))
#plot(c(data,rep(NA,12)),xaxt="n",ylab="CPI",xlab="",ylim=c(162,190))
#new.df <- data.frame(rev_used=c(3429247))
#predict(fit, )


q <- as.numeric(quarters)
cpi<-c(rev_total)
df <- data.frame(q,cpi)
plot(df)+abline(lm(df$cpi~q))

newQ <- as.data.frame(quarters)
rep(newQ)


plot(c(cpi,rep(NA,24)),xaxt="n",ylab="CPI",xlab="",ylim=c(2000000, 4500000))
#48, until 2025
lines(25:48, predict(
  fit,
  newdata=data.frame(year=rep(c(2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025), each=3), quarter=rep(1:3,1))))

