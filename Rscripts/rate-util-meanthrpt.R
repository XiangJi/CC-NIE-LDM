rum <- read.csv("graph0602rate.csv")
attach(rum)


plot(Rate, Utilization, type='o', col="red", xlab='Rate(Mbps)', ylab='Utilization', pch=0,cex=1, main="Utilization vs. Rate; Mean Throughput vs. Rate")
par(new=TRUE)
plot(Rate,Mthroughput, type='o', col="blue", cex=1, axes = F, xlab = NA, ylab = NA)
axis(4)
mtext(side = 4, line = 0, "Mean Throughput(kBps)")


dev.off();
