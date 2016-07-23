cd "C:\Users\admin\Desktop\data"
import delimited "flats.csv", delimiter(";") clear
gen price_metr = price/totsp
gen livesp_walk = livesp * walk
gen kitsp_walk = kitsp * walk
gen dist_walk = dist * walk
gen metrdist_walk = metrdist * walk
gen floors_walk = floors * walk

reg price_metr livesp kitsp dist metrdist floors walk livesp_walk kitsp_walk dist_walk metrdist_walk floors_walk
test livesp_walk = kitsp_walk = dist_walk = metrdist_walk = floors_walk = walk = 0

reg price_metr livesp kitsp dist metrdist floors
scalar rssp = e(rss)
reg price_metr livesp kitsp dist metrdist floors if walk==0
scalar rss1 = e(rss)
reg price_metr livesp kitsp dist metrdist floors if walk==1
scalar rss2 = e(rss)
scalar F = ((rssp-rss1-rss2)/6) / ((rss1+rss2)/(773-2*6))
display F
