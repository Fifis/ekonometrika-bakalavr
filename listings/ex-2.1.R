setwd("C:/Users/admin/Desktop/data")
data <- read.csv("concrete.csv", header = TRUE, sep=";")
summary(data)

install.packages("pastecs")
require(pastecs)
stat.desc(data)
