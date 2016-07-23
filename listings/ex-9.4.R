setwd("C:/Users/admin/Desktop/data")
data_flats <- read.csv("flats.csv", sep=";")
ln_totsp2 <- ln_totsp^2
ln_totsp3 <- ln_totsp^3
reg <- lm(ln_price_metr ~ 1 + ln_totsp + ln_totsp2 + ln_totsp3 + ln_livesp, data=data_flats)
summary(reg)

regressors <- matrix(ncol=4, nrow=dim(data_flats)[1])
regressors[,1] <- data_flats$ln_totsp
regressors[,2] <- data_flats$ln_totsp2
regressors[,3] <- data_flats$ln_totsp3
regressors[,4] <- data_flats$ln_livesp
cor(regressors)

install.packages("HH")
library(HH)
vif(ln_price_metr ~ 1 + ln_totsp + ln_totsp2 + ln_totsp3 + ln_livesp, data=data_flats)
