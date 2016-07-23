setwd("C:/Users/admin/Desktop/data")
data_flats <- read.csv("flats.csv", sep=";")
lm_lin     <- lm(price~1+totsp+dist+metrdist, data = data_flats)
lm_log_lin <- lm(log(price)~1+totsp+dist+metrdist, data = data_flats)
lm_log_lin_fitted.values <- lm_log_lin$fitted.values
lm_lin_fitted.values     <- lm_lin$fitted.values
lm_lin1  <- lm(exp(lm_log_lin_fitted.values) ~ 1+totsp+dist+metrdist, data = data_flats)
lm_lin2 <- lm(log(lm_lin_fitted.values) ~ 1+totsp+dist+metrdist, data = data_flats)
lm_lin1_res <- lm_lin1$res
lm_lin2_res <- lm_lin2$res

summary(lm(price~1+totsp+dist+metrdist+lm_lin2$res, data = data_flats))
summary(lm(log(price)~1+totsp+dist+metrdist+lm_lin1$res, data=data_flats))