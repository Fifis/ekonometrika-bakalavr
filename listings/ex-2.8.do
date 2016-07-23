cd "C:\Users\admin\Desktop\data"
use  "http://www.ats.ucla.edu/stat/stata/examples/icda/afterlife", clear
export delimited using "afterlife.csv", quote replace
tab gender aftlife [fweight=freq], cell row
