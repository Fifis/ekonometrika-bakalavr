gen daily=date(date,"DMY")
tsset daily
twoway (line cac40 daily)
dfuller  cac40, regress lags(3) nocons
dfuller  cac40, regress lags(3)