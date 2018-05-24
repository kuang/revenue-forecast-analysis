# just a test thing for reading the excel sheets

# allows reading of excel sheets
library(readxl)
# allows writing of excel sheets
library(writexl)

excel_sheets('sample.xlsx')

input_sheet_1 read_excel("sample.xlsx", sheet=1, col_names = TRUE)