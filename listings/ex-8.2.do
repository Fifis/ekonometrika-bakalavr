reg wage ttl_exp tenure1 grade1 race union south
predict y_hat
reg ln_wage ln_ttl_exp ln_tenure1 ln_grade1 race union south
predict ln_y_hat

gen lin_add=ln_y_hat-ln(y_hat)
reg wage ttl_exp tenure1 grade1 race union south lin_add
gen log_add=y_hat-exp(ln_y_hat)
reg ln_wage ln_ttl_exp ln_tenure1 ln_grade1 race union south log_add
