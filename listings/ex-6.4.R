setwd("C:/Users/admin/Desktop/data")
data_flats <- read.csv("flats.csv", header=TRUE, sep=";")

lm1 <- lm(price ~ 1 + totsp + dist + metrdist, data=data_flats)
lm2 <- lm(price ~ 1, data=data_flats)

install.packages("lmtest")
library(lmtest)
lrtest(lm1, lm2)
waldtest(lm1, lm2)