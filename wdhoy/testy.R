# just a test thing for reading the excel sheets

# allows reading of excel sheets
library(readxl)
# allows writing of excel sheets
library(writexl)

excel_sheets('yoy.xlsx')

input_sheet_1 = read_excel("yoy.xlsx", sheet=1, col_names = TRUE)
input_sheet_1
input_sheet_1[21,6]  # read row1 col1?
input_sheet_1[1,1]  # read  row1 col1?


# the revenue data


# template

# what is row,col for upper left corner of rev
#[14, 4]
# what lowe right
#[21, 6]

# col1 quarter 1, year 2011
# col2 quarter 2, year 2011
total_unit_sales_used_cars = input_sheet_1[c(14:21),c(4:6)]
total_unit_sales_used_cars


# zoo sequence to name year/quarter
x <- as.yearqtr(2011 + seq(0, 23)/3)
format(x, "%Y Quarter %q")


# makes a dataframe of 1 col with time
reduced_used_cars = as.vector(t(total_unit_sales_used_cars))
used_cars = as.data.frame(reduced_used_cars)
rownames(used_cars) <- x


avg_price_used_cars = input_sheet_1[c(71:78),c(4:6)]
reduced_avg_price_used_cars = as.vector(t(avg_price_used_cars))
prices = as.data.frame(reduced_avg_price_used_cars)
rownames(prices) <- x

#puts used cars and used cars price together
used_cars$size <- prices



