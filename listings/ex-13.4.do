format date %tm
tsset  date
twoway (tsline inf)
ac inf
pac inf
arima inf, arima(0, 0, 0) sarima(1, 0, 1, 12)
gen inf_sa = D12.inf
dfuller inf_sa, regress lags(3)
dfuller inf_sa, regress lags(3) nocons
ac inf_sa
pac inf_sa
arima inf, arima(1, 0, 0) sarima(0, 1, 1, 12)
estat ic
predict res, res
sktest res
swilk res
arima inf, arima(1, 0, 0) sarima(0, 1, 1, 12) r
arima inf, arima(1, 0, 0) sarima(1, 0, 1, 12) r
reg res
estat bgodfrey, lag(3)
arima inf  if date<=664, arima(1, 0, 0) sarima(0, 1, 1, 12) r
predict inf_sa_forec if date>=665
