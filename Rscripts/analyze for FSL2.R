FSL <- read.csv("FSL_2.csv");

attach(FSL)
names(FSL)
quantile(size,seq(0.8,1,0.01))
summary(size)
summary(inter.arrival_time)
length(size)


product_num <- length(FSL$size);
total_time <- FSL[product_num, 2]
total_min <- round(FSL[product_num, 2] / 60 / 1000);
# Generate a summary report (remember to REPLACE the output file name)
sink("FSL2summary.txt");
summary(FSL);

"Total time (in minutes):";
total_min;
"Number of FSL:";
product_num;
"Silence time (in minutes):";
(total_time - length(FSL$size))/1000/60;
sink();

size <- FSL$size;
time <- FSL$arrival_time;

g_range <- range(0, size);
x_range <- range(0, time);
# REPLACE the output pdf file name


plot(time, size, pch=".", type="o", col="blue", ylim=g_range, axes=FALSE, ann=FALSE);
axis(1, las=2, at=round(x_range[2]/10)*0:10, lab=round(x_range[2]/60000)/10*0:10);
axis(2, las=2, at=round(g_range[2]/10)*0:10, lab=round(g_range[2]/1024)/10*0:10);
title(main="size vs. arrival time for FSL2 (Jan.27 2014)");
title(xlab="arrival time(minute)");
title(ylab="size(KB)");
text(60572281, 455972, labels="Size: 445.2KB");
text(60573381, 430972, labels="Time: 1209.6min");

dev.off();