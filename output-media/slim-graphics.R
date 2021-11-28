setwd("/Users/noahbevers/Documents/Practical Evolution 7230/DIP Practical Evolution Project/DIP Final Project/DIP-SLiM-Final-Project/output")
getwd()
dir <- getwd()
# dir
p1.files <- list.files(path = dir, pattern = paste(c("*-p1-results.csv")))
p3.files <- list.files(path = dir, pattern = paste(c("*-p3-results.csv")))

# p1.files
# p3.files

# files


for (p1.file in p1.files) {
    print(p1.file)
    p1.data <- read.csv(p1.file, header = TRUE)
    p1.data.root <- tools::file_path_sans_ext(p1.file)
    jpeg(paste("../output-media/",p1.data.root,".jpg",sep = ""))
    par(mfrow=c(3,1))
    plot(mean.phenotype~gen, data = p1.data , type = "l", cex = 3.5, col = "blue", ylim = c(-15,15))
    abline (h = 10, col = "red", cex = 2.5)
    title(p1.data.root, cex = 5)
    plot(hetero~gen, data = p1.data, type = "l", cex = 1.5, col = "green")
    plot(pop.size~gen,data = p1.data, type = "l", cex = 1.5, col = "purple")
    dev.off()
}

for (p3.file in p3.files){
    print(p3.file)
    p3.data <- read.csv(p3.file, header = TRUE)
    p3.data.root <- tools::file_path_sans_ext(p3.file)
    jpeg(paste("../output-media/",p3.data.root,".jpg",sep = ""))
    par(mfrow=c(3,1))
    plot(mean.phenotype~gen, data = p3.data , type = "l", lwd = 1.5, col = "blue", ylim = c(-15,15))
    abline (h = -10, col = "red", lwd = 2.5)
    title(p3.data.root, cex = 5)
    plot(hetero~gen, data = p3.data, type = "l", lwd = 1.5, col = "green")
    plot(pop.size~gen, data = p3.data, type = "l",lwd = 1.5, col = "purple")
    dev.off()
}
