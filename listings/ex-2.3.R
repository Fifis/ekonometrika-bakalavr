setwd("C:/Users/admin/Desktop/data")
data <- read.csv("concrete.csv", header = TRUE, sep=";")
png("r-hist-1.png", 600, 400, pointsize=18)
hist(data$q, xlab="l", main="Histogram of q")
dev.off()
png("r-hist-2.png", 600, 400, pointsize=18)
hist(data$l, breaks=16, xlab="l", main="Histogram of l with 16 bars")
dev.off()
