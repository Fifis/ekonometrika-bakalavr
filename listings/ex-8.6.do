boxcox EARNINGS S ASVABC, model (theta)
boxcox EARNINGS placeS ASVABC, model (lambda)

gen ln_EARNINGS = ln(EARNINGS)
gen ln_S = ln(S)
gen ln_ASVABC = ln(ASVABC)

reg ln_EARNINGS ln_S ln_ASVABC
