

gdp <- data$GDP[21:81]
acf(gdp)
arima(gdp, seasonal = list(order = c(1L, 0L, 1L), period = 4))
gdp_diff4 <- diff(gdp, lag=4, differences=1)
adfTest(gdp_diff4, lags = 3, type ="ct")
gdp_diff4_diff <- diff(gdp_diff4, lag=1, differences=1)
fit <- arima(gdp_diff_diff4, order=c(2,0,1), include.mean = FALSE)
summary(fit)
resid <- fit$residuals
shapiro.test(resid)
jarque.bera.test(resid)
summary(lm(resid^2~1+dgp_diff_diff4^3))
bgtest(resid~1, order = 2, type ="F")
