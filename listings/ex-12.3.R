install.packages(c("readr", "dplyr", "lattice", "dygraphs", "zoo"))
library(readr)
library(dplyr)
library(lattice)
library(dygraphs)
library(zoo)

data <- na.omit(read.csv("gdp.csv", sep=";"))
dygraph(ats, main = "GDP, bln rub") %>% 
+     dyShading(from = "2000-1-1", to = "2015-12-12")

install.packages("fUnitRoots")
library(fUnitRoots)

adfTest(data$GDP[21:81], lags = 3, type ="ct")
adfTest(data$GDP[21:81], lags = 3, type ="c")

install.packages("tseries")
library(tseries)
kpss.test(data$GDP[21:81], null = "Trend", lshort = FALSE)
kpss.test(data$GDP[21:81], null = "Level", lshort = FALSE)
