test <- read.csv("bin.csv")
attach(test)

plot(range, logcf, xlim=range(0:100), ylim=range(1.5,4),type='o', col="red", xlab='Percentile of Sorted Size (%)', ylab='Log 10 Scale of Mean Throughput (kbps)', pch=0,cex=1)
#par(new=TRUE)
lines(range,logcr, type='o', col="blue",pch=2, cex=1, lty=2)
#par(new=TRUE)
lines(range,lognf, type='o', col="red", pch=5,cex=1, lty=3)
#par(new=TRUE)
lines(range,lognr, type='o', col="blue", pch=7,cex=1, lty=4)

legend(60,2.25,c("CONDUIT FCFS","CONDUIT RR","NEXRAD2 FCFS","NEXRAD2 RR"),pch=c(0,2,5,7),lty=c(1,2,3,4),col=c('red', 'blue', 'red',' blue'))
