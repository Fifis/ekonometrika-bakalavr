rlms14 <- read.csv(file.choose())
attach(rlms14)

age <- 2005 - birth_year
tenure <- 2005 - beginning

reg <- lm(income ~ age + tenure, data = rlms14)

install.packages("MASS")
library(MASS)

ramsey(rlms14)
