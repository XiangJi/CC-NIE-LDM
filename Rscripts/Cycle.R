cycle <- read.csv("CONDUIT_20140602_fft.csv")
attach(cycle)

#plot(time.ms., size, type = "o")

I <- abs(fft(size)/sqrt(86400002))^2


# > which(I == max(I[2:43200001]))
# [1] 9  The first dominant period
# > which(I == max(I[10:43200001]))
# [1] 13 The second dominant period

# The period is 86400002/(9-1)ms = 3 hours

P <- (4/86400002)*I[1:43200002]

freq <- (0,43200001)/86400002

plot(freq, P, type = "l")