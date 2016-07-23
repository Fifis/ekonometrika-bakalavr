setwd("C:/Users/admin/Desktop/data")
data <- read.csv("concrete.csv", header = TRUE, sep=";")
reg <- lm(q~l, data=data)
reg
summary(reg)
