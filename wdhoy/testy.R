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
testset = as.vector(t(total_unit_sales_used_cars))
colnames(testset) = c("num_cars")


NROW(testset)

for (row in 1:NROW(testset)) {
  price <- testset[row, "apple"]
  #date  <- stock[row, "date"]
  
  #if(price > 117) {
   # print(paste("On", date, 
  #              "the stock price was", price))
  #}
  
}
#avg_price_used_cars = input_sheet_1[c(71:78),c(4:6)]
#avg_price_used_cars
