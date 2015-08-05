intertime <- read.csv("CONDUIT_20140602.csv")
attach(intertime)
hist(inter.arrival_time, main="CONDUIT_20140602 Inter-arrival Time Histogram. Total Count: 1017621", xlab="Millisecond", col="grey")

