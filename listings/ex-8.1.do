sum wage ttl_exp tenure grade

gen tenure1 = tenure+1
gen grade1 = grade+1

gen ln_wage=ln(wage)
gen ln_ttl_exp=ln(ttl_exp)
gen ln_tenure1=ln(tenure1)
gen ln_grade1=ln(grade1)

reg ln_wage ln_ttl_exp ln_tenure1 ln_grade1 race union south
reg ln_wage ttl_exp tenure1 grade1 race union south
