cd "C:\Users\admin\Desktop\data"
import delimited "flats.csv", delimiter(";") clear
gen ln_price_metr=ln(price/totsp)
gen ln_livesp=ln(livesp)
gen ln_kitsp=ln(kitsp)
gen ln_dist=ln(dist)
gen ln_metrdist=ln(metrdist)
gen ln_metrdist_walk=ln(metrdist*walk)

reg ln_price_metr ln_livesp ln_kitsp ln_dist ln_metrdist ln_metrdist_walk walk new floor1 floor2
reg ln_price_metr ln_livesp ln_kitsp ln_dist ln_metrdist ln_metrdist_walk walk floor1 floor2
