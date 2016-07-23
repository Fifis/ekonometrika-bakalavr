setwd("C:/Users/admin/Desktop/data")
u <- read.csv("unem.csv", sep=";")
makets <- function(x) ts(x, start=c(2000, 1), freq=4)

unem <- ts(u$Unem, start=c(2000, 1), freq=4)
acf(unem)
pacf(unem)
unem_sa <- c(rep(NA, 4), diff(unem, lag=4))
unem_sa <- makets(unem_sa)
d_unem_sa <- c(NA, diff(unem_sa))
d_unem_sa <- makets(d_unem_sa)
plot(d_unem_sa)


mod1 <- arima(d_unem_sa, order=c(1,0,4), fixed=c(NA, 0,0,0,NA, 0))
mod2 <- arima(d_unem_sa, order=c(0,0,4), fixed=c(0,0,0,NA, 0))
mod1
mod2

