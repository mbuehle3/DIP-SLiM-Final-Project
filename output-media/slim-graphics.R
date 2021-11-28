setwd("../output/")
getwd()

output <- read.csv("results-20-10.csv", header = TRUE)
output

head(output)

par(mfrow=c(3,1))

plot(mean.phenotype~gen,data = output, type = "l")
abline (h = 10, col = "red")
plot(hetero.~gen, data = output, type = "l")
plot (pop.size~gen,data = output, type = "l")


# ?plot()
