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
colnames(total_unit_sales_used_cars) = c("2011Q1", "2011Q2", "2011Q2")
total_unit_sales_used_cars


avg_price_used_cars = input_sheet_1[c(71:78),c(4:6)]
avg_price_used_cars
