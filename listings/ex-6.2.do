cd "C:\Users\admin\Desktop\data"
import delimited "flats.csv", delimiter(";") clear
gen dist_sq = dist^2
gen metrdist_sq = metrdist^2

reg price totsp dist metrdist dist_sq metrdist_sq
estimates store reg1

reg price totsp
estimates store reg2

lrtest reg1 reg2

reg price totsp dist metrdist dist_sq metrdist_sq
test metrdist = metrdist_sq = 0
