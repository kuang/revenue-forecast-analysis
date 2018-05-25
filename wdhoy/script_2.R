# allows reading of excel sheets
library(readxl)
# allows writing of excel sheets
library(writexl)
library(zoo)

excel_sheets('financial_cleaned.xlsx')

input_sheet = read_excel("financial_cleaned.xlsx", sheet=1, col_names = TRUE)

#new dataframe

# zoo sequence to name year/quarter
quarters <- as.yearqtr(2011 + seq(0, 23)/3)
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



fit <- lm(rev_total ~ rev_used + rev_wholesale, data=data)
#summary(fit)
#x<-fitted(fit)

#new.df <- data.frame(rev_used=c(3429247))
#predict(fit, )
lines(predict(fit))


year<-seq(from=2011,to=2020,by=.33)
cpi<-c(rev_total)
df <- data.frame(year,cpi)
plot(df)+abline(lm(df$cpi~df$year))

