gen age = 2005 - birth_year
gen tenure=2005 - beginning

reg income age tenure

ovtest

gen agesq = age^2
reg income age agesq tenure
ovtest
