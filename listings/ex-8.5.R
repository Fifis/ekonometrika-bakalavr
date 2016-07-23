setwd("C:/Users/admin/Desktop/data")
data_flats <- read.csv("flats.csv", sep=";")

install.packages("MASS")
library(MASS)

# pdf(width=6, height=4, "boxcox.pdf")
boxcox(lm(price ~ 1+totsp+dist+metrdist, data = data_flats), lambda = seq(-5, 5, 1/100), plotit = TRUE)
# dev.off()