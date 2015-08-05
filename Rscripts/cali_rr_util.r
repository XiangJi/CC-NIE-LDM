test <- read.csv("cali_rr_util.csv")
attach(test)

plot(Date, CONDUIT, xlim=range(1:9), ylim=range(0,100),type='o', col="red", xlab='Date June, 2014', ylab='Utilization (%)', pch=0,cex=1)

lines(Date,NGRID, type='o', col="blue",pch=2, cex=1, lty=2)

lines(Date,NEX2, type='o', col="black", pch=5,cex=1, lty=3)

lines(Date,NEX3, type='o', col="green", pch=7,cex=1, lty=4)

lines(Date,FSL2, type='o', col="purple", pch=4,cex=1, lty=5)

legend(0.75,104,c("CONDUIT","NGRID","NEXRAD2","NEXRAD3","FSL2"),pch=c(0,2,5,7,4),lty=c(1,2,3,4,5),col=c('red', 'blue','black','green','purple'))
