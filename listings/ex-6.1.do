clear
set more off

set obs 1000

local b1=1
local b2=2
local gamma=3

gen e=invnorm(uniform())
gen x1=invnorm(uniform())
gen x2=uniform()
gen y=`b1'*x1 + `b2'*x2^`gamma' + e

program maxlik 
version 12 
args lnf b1 b2 gamma sigma
quietly replace `lnf' = ln(normalden(y, `b1'*x1 + `b2'*x2^`gamma', `sigma')) - ln(`sigma')
end 

ml model lf maxlik (b1: ) (b2: ) (gamma: ) (sigma: )
ml max
