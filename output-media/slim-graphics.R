setwd("/Users/noahbevers/Documents/Practical Evolution 7230/DIP Practical Evolution Project/DIP Final Project/DIP-SLiM-Final-Project/output")
getwd()
dir <- getwd()
# dir
p1.files <- list.files(path = dir, pattern = paste(c("*-p1-results.csv")))
p3.files <- list.files(path = dir, pattern = paste(c("*-p3-results.csv")))

reps = 1

for (i in 0:reps) {
        # i = 1
        # nam <- paste("p1.files.",i, sep = "")
        # nam
        
        assign(paste("p1.files.",i, sep = ""), list.files(path = paste(dir,"/",i, sep = ""), pattern = paste(c("*-p1.results.csv"))))
}
p1.files.0
p1.files.1

p1.files.0[1] == p1.files.1[1]

p1.files.1

# parser = matrix(nrow = length(p1.files), ncol = 2)
# i = 1
# for (file in p1.files){
#     print(i)
#     split <- strsplit(file, '--')[[1]]
#     parser[i,1] <- split[1]
#     parser[i,2] <- split[2]
#     i = i+1
# }
# parser[,1] <- as.factor(parser[,1])
# str(parser)
# parser[1,1]

# rep = 2

# for (file in p1.files) {
    
# }\
\
# files

# p1.files[1]
# p1.data <- read.csv(p1.files[1], header = TRUE)
# str(p1.data)
# p1.data[,1] <- as.factor(p1.data[,1])

# plot(mean.phenotype~gen,
#   data = rep.subset,
#    type = "n", 
#    cex = 3.5, 
#    col = "blue")


print(rep.subset[,2] == 1)

rep.subset <- subset(p1.data , replicate == 1)
rep.subset
head(rep.subset)

lines(mean.phenotype~gen,
 data = rep.subset,
  type = "l", 
  cex = 3.5, 
  col = "red", 
  ylim = c(-15,15))

lines(mean.phenotype[replicate=="0"]~gen[replicate=="0"],
 data = p1.data ,
  type = "l", 
  cex = 3.5, 
  col = "purple", 
  ylim = c(-15,15))

lines(mean.phenotype[replicate=="2"]~gen[replicate=="2"],
 data = p1.data ,
  type = "l", 
  cex = 3.5, 
  col = "orange", 
  ylim = c(-15,15))

lines(mean.phenotype[replicate=="3"]~gen[replicate=="3"],
 data = p1.data ,
  type = "l", 
  cex = 3.5, 
  col = "green", 
  ylim = c(-15,15))


reps = 2-1
reps 
getwd()
p1.files.1
p1.file = p1.files.1[1]
p1.file
file = 2
length(p1.files.1)

for (file in 1:length(p1.files.1)) {
    print(file)
    rep.0 = p1.files.0[file]
    rep.1 = p1.files.1[file]
    print(rep.0)
    print(rep.1)
    rep0.data <- read.csv(paste(dir,"/0/",rep.0,sep = ""), header = TRUE)
    rep1.data <- read.csv(paste(dir,"/1/",rep.1,sep = ""), header = TRUE)
    p1.data.root <- tools::file_path_sans_ext(rep.0)
    p1.data.root
    # p1.data.root
    # p1.data
    jpeg(paste("../output-media/",p1.data.root,".jpg",sep = ""))
    par(mfrow=c(3,1))
    plot(mean.phenotype~gen, data = rep0.data , type = "l", cex = 3.5, col = "blue", ylim = c(-15,15))
    lines(mean.phenotype~gen, data = rep1.data, lwd= 1.5, col = "red")
    abline (h = 10, col = "red", cex = 2.5)
    title(p1.data.root, cex = 5)
    plot(hetero~gen, data = rep0.data, type = "l", cex = 1.5, col = "green")
    lines(hetero~gen, data = rep1.data, lwd= 1.5, col = "red")
    plot(pop.size~gen,data = rep0.data, type = "l", cex = 1.5, col = "purple")
    lines(pop.size~gen, data = rep1.data, lwd= 1.5, col = "red")
    
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
