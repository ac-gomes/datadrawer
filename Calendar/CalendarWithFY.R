
#Script to generate calendar table with fiscal year periods 
setwd("C:/Users/Antonio/OneDrive/R/datadrawer/Calendar")

#install or load packges
packages <- c("tibble", "dplyr", "lubridate", "stringr")
install.packages(setdiff(packages, rownames(installed.packages())))

library(tibble)
library(dplyr)
library(lubridate)
library(stringr)

#set range
startDate <- "2018-10-01"
endDate   <- "2023-09-30"
fiscalStart <- 10

#initialize date range
dateInterval <- as_tibble(seq(from = as.Date(startDate), to=as.Date(endDate), by="day"))

#create calendar
dCalendar <- dateInterval %>% 
              mutate(
                    WeekDays = weekdays(value, abbreviate = TRUE),
                    Month = month(value),
                    MonthShort = month(value, label = TRUE),
                    WeekOfYear =  week(value),
                    CalendarQuarter = paste0("Q", quarter(value)),
                    FiscalQuarter = paste0("Q", quarter(value, fiscal_start = fiscalStart)),
                    CalendarYear = year(value),
                    FiscalYear =  str_sub(quarter(value, with_year = TRUE, fiscal_start = fiscalStart),1,4),
                    
                    FiscalPeriod = case_when(
                          Month == 1  ~ "P04",
                          Month == 2  ~ "P05",
                          Month == 3  ~ "P06",
                          Month == 4  ~ "P07",
                          Month == 5  ~ "P08",
                          Month == 6  ~ "P09",
                          Month == 7  ~ "P10",
                          Month == 8  ~ "P11",
                          Month == 9  ~ "P12",
                          Month == 10 ~ "P01",
                          Month == 11 ~ "P02",
                          Month == 12 ~ "P03"
                        )
                )