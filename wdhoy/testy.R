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


