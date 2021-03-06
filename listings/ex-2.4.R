setwd("C:/Users/admin/Desktop/data")
data <- read.csv("concrete.csv", header = TRUE, sep=";")
png("r-scatter-1.png", 600, 400, pointsize=18)
plot(data$l, data$q, xlab="l", ylab="q", main="Histogram of q and l")
dev.off()
png("r-scatter-2.png", 600, 400, pointsize=18)
plot(data$l, ylab="l", main="l by observation number")
dev.off()
