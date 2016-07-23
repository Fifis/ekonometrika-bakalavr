cd "C:\Users\admin\Desktop\data"
import delimited "nlsw88.csv", delimiter(";") clear
reg wage hours ttl_exp tenure union

gen hours_union = hours*union
gen ttl_exp_union = ttl_exp*union
gen tenure_union = tenure*union
reg wage hours ttl_exp tenure union hours_union ttl_exp_union tenure_union
test union = hours_union = ttl_exp_union = tenure_union = 0
reg wage hours tenure ttl_exp if union==1
reg wage hours tenure ttl_exp if union==0
