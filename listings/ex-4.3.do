cd "C:\Users\admin\Desktop\data"
import delimited "flats.csv", delimiter(";") clear
gen price_per_metr= price/totsp
reg price_per_metr dist
test dist=-5830
