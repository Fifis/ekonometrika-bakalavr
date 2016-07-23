setwd("C:/Users/admin/Desktop/data")
data <- read.csv("flats.csv", sep=";")
# library(foreign)
# data_flats <- read.dta(file.choose())

data$price_metr <- data$price / data$totsp
data$livesp_walk <- data$walk * data$livesp
data$kitsp_walk <- data$walk * data$kitsp
data$dist_walk <- data$walk * data$dist
data$metrdist_walk <- data$walk * data$metrdist
data$floor_walk <- data$walk * data$floor
data$floors_walk <- data$walk * data$floors
reg <- lm(price_metr ~ 1 + livesp + kitsp + dist + metrdist + floors + walk + livesp_walk + kitsp_walk + dist_walk + metrdist_walk + floors_walk, data=data)
install.packages("car")
library(car)
r0 = "walk = 0"
r1 = "livesp_walk = 0"
r2 = "kitsp_walk = 0"
r3 = "dist_walk = 0"
r4 = "metrdist_walk = 0"
r5 = "floors_walk = 0"
linearHypothesis(reg, c(r0, r1, r2, r3, r4, r5), verbose=TRUE)

coefs <- names(coef(reg))
walk_coefs <- coefs[grep("walk", coefs)]
linearHypothesis(reg, walk_coefs)

reg0 <- lm(price_metr ~ 1 + livesp + kitsp + dist + metrdist + floors, data=data)
reg1 <- lm(price_metr ~ 1 + livesp + kitsp + dist + metrdist + floors, data=data, subset=(walk==1))
reg2 <- lm(price_metr ~ 1 + livesp + kitsp + dist + metrdist + floors, data=data, subset=(walk==0))
RSS <- NULL
RSS$r <- sum(reg0$residuals^2)
RSS$ur1 <- sum(reg1$residuals^2)
RSS$ur2 <- sum(reg2$residuals^2)
k <- reg0$rank
numerator <- (RSS$r - (RSS$ur1 + RSS$ur2))/k
denominator <- (RSS$ur1 + RSS$ur2) / (length(reg0$residuals) - 2*k)
chow <- numerator / denominator
