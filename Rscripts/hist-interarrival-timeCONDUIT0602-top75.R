intertime <- read.csv("CONDUIT_20140602.csv")
attach(intertime)


intertime1 <- sort(inter.arrival_time)
# For 75 percentile, I used 3/4 the numbers. Used ceiling to get an integer
intertime2<- vector(mode="numeric", length=ceiling(3*length(intertime1)/4))
intertime2<-intertime1[1:length(intertime2)]
intertime2[length(intertime2)]

histoinfo <- hist(intertime2, main="CONDUIT_20140602 Inter-arrival Time Histogram. Total Count: 763216", xlab="Millisecond", col="grey")
print("Summary of Histogram Information for Inter-arrival time")
print(histoinfo)

detach(intertime)
