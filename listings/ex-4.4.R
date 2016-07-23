setwd("C:/Users/admin/Desktop/data")
data <- read.csv("concrete.csv", header = TRUE, sep=";")
reg <- lm(q~k, data=data)
summary(reg)
