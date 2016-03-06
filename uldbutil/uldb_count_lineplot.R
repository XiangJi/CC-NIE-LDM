filein <- read.csv(file="uldb_summary.csv",sep=",",head=TRUE)
index=1:75

library(ggplot2)

ggplot(filein, aes(index)) + 
  geom_step(aes(y = filein$CONDUIT, colour = "CONDUIT")) + 
  geom_step(aes(y = filein$NGRID, colour = "NGRID")) +
  geom_step(aes(y = filein$NEXRAD2, colour = "NEXRAD2")) + 
  geom_step(aes(y = filein$NEXRAD3, colour = "NEXRAD3")) +
  geom_step(aes(y = filein$FSL2, colour = "FSL2")) + 
  geom_step(aes(y = filein$TOTAL, colour = "TOTAL")) +
  labs(title = "Feedtype Requests", x = "Time (Hours)", y = "Number of Feedtype Requested") + 
  theme(legend.title=element_blank())

