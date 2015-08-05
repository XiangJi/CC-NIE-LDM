svt <- read.csv("CONDUIT_20140602.csv")
attach(svt)

plot(arrival_time/(60*1000), size/(1024*1024), pch=".",type="o",col="blue",main="Size vs. Arrival Time",xlab="Arrival Time(Minute)",ylab="Size(MB)")

