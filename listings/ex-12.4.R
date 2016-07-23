adfTest(data$CAC40, lags = 5, type ="c")
adfTest(data$DAX, lags = 5, type ="c")

install.packages("egcm")
library(egcm)
egcm(data$CAC40,data$DAX)
