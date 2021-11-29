setwd("output/")
dir <- getwd()
# dir

# all files across all replicate directories will have the same name so we just need a list of the files
p1.files <- list.files(path = paste(dir, "/1", sep = ""), pattern = paste(c("*-p1-results.csv")))
p1.files
paste(dir,"/1")
p3.files <- list.files(path = paste(dir, "/1", sep = ""), pattern = paste(c("*-p3-results.csv")))
p3.files

reps = 1 # reps is going to be the number of reps - 1, SLiM starts the rep count at 0
# create an object that stores all the files in a respective replicate directoy
for (i in 0:reps) {
        # i = 1
        # nam <- paste("p1.files.",i, sep = "")
        # nam
        
        assign(paste("p1.files.",i, sep = ""), list.files(path = paste(dir,"/",i, sep = ""), pattern = paste(c("*-p1.results.csv"))))
}
# p1.files.0
# p1.files.1

for (i in 0:reps) {
        # i = 1
        # nam <- paste("p1.files.",i, sep = "")
        # nam
        
        assign(paste("p3.files.",i, sep = ""), list.files(path = paste(dir,"/",i, sep = ""), pattern = paste(c("*-p3.results.csv"))))
}
# p3.files.0
# p3.files.1

# make plots for p1
for (file in 1:length(p1.files)) {
    print(file)
    rep.0 = p1.files.0[file]
    print(rep.0)
    rep0.data <- read.csv(paste(dir,"/0/",rep.0,sep = ""), header = TRUE)
    rep1.data <- read.csv(paste(dir,"/1/",rep.0,sep = ""), header = TRUE)
    p1.data.root <- tools::file_path_sans_ext(rep.0)
    p1.data.root
    # p1.data.root
    # p1.data
    jpeg(paste("../output-media/",p1.data.root,".jpg",sep = ""))
    par(mfrow=c(3,1))
    plot(mean.phenotype~gen, data = rep0.data , type = "l", lwd =2.5, col = "blue", ylim = c((min(mean.phenotype)-5), (max(mean.phenotype)+5)))
    lines(mean.phenotype~gen, data = rep1.data, lwd= 2.5, col = "red", ylim = c((min(mean.phenotype)-5), (max(mean.phenotype)+5)))
    # abline (h = 10, col = "red", cex = 2.5)
    title(p1.data.root, cex.main = 3.5)
    plot(hetero~gen, data = rep0.data, type = "l", lwd = 2.5, col = "green", ylim = c(0, max(hetero)+0.0001))
    lines(hetero~gen, data = rep1.data, lwd= 2.5, col = "red" , ylim = c(0, max(hetero)))
    plot(pop.size~gen,data = rep0.data, type = "l", cex = 2.5, col = "purple", ylim = c(0, max(pop.size)))
    lines(pop.size~gen, data = rep1.data, lwd= 2.5, col = "red", ylim = c(0, max(pop.size)))
    
    dev.off()
}
# get the full path name for each of the p3 files for processing
p3.full.rep0 <- matrix(ncol = 1)
p3.full.rep1 <- matrix(ncol = 1)
for (em in 1:length(p3.files)){
  p3.full.rep0[em] <- paste(dir,"/0/",p3.files[em], sep = "")
  p3.full.rep1[em] <- paste(dir,"/1/",p3.files[em],sep = "")
}
p3.full.rep1 
p3.full.rep0.new <- matrix(ncol = 1)
p3.full.rep1.new <- matrix(ncol = 1)

# filter out the p3 files that have no data written to them
for (ele in 1:length(p3.files)) {
  # print(p3.full.rep0[ele])
  # print(file.size(p3.full.rep0[ele]))
  if (file.size(p3.full.rep0[ele])>71) {
    p3.full.rep0.new <- c(p3.full.rep0.new, p3.full.rep0[ele])
    } else { next
  }
p3.full.rep0.new
  if (file.size(p3.full.rep1[ele])>71) {
    p3.full.rep1.new <- c(p3.full.rep1.new, p3.full.rep1[ele])
    } else {
    next
  }
}
# annoying NA in the first row, use na.omit to get rid of it
p3.full.rep1.new <- na.omit(p3.full.rep1.new)
# p3.full.rep1.new
p3.full.rep0.new <- na.omit(p3.full.rep0.new)

# convert the p3 files from their full name back to just *.csv
final.p3.rep1 <- matrix(ncol = 1)
for (i in 1:length(p3.full.rep1.new)){
  tmp <- strsplit(p3.full.rep1.new[i], split = "/")[[1]]
  final.p3.rep1[i] <- tmp[9]
}
# final.p3.rep1

# same as above just for rep0 files
final.p3.rep0 <- matrix(ncol = 1)
for (i in 1:length(p3.full.rep0.new)){
  tmp <- strsplit(p3.full.rep0.new[i], split = "/")[[1]]
  final.p3.rep0[i] <- tmp[9]
}
# final.p3.rep0

# finally make the plots for p3.
# This throws errors, but at this point I can live with it probably needs another if statment to fix it
for (file in 1:length(final.p3.rep0)) {
    print(file)
    rep.0 = final.p3.rep0[file]
    rep.1 = final.p3.rep1[file]
    print(rep.0)
    print(rep.1)
    rep0.data <- read.csv(paste(dir,"/0/",rep.0,sep = ""), header = TRUE)
    rep1.data <- read.csv(paste(dir,"/1/",rep.1,sep = ""), header = TRUE)
    p3.data.root <- tools::file_path_sans_ext(rep.0)
    p3.data.root
    # p1.data.root
    # p1.data
    jpeg(paste("../output-media/",p3.data.root,".jpg",sep = ""))
    par(mfrow=c(3,1))
    plot(mean.phenotype~gen, data = rep0.data , type = "l", lwd = 2.5, col = "blue", ylim=c((min(mean.phenotype)-2), (max(mean.phenotype)+2)))
    lines(mean.phenotype~gen, data = rep1.data, lwd= 2.5, col = "red", ylim=c(min(mean.phenotype), max(mean.phenotype)))
    # abline (h = 10, col = "red", cex = 2.5)
    title(p3.data.root, cex.main = 4)
    plot(hetero~gen, data = rep0.data, type = "l", lwd = 2.5, col = "green", ylim=c(0, max(hetero)+0.0001))
    lines(hetero~gen, data = rep1.data, lwd= 2.5, col = "red", ylim=c(0, max(hetero)))
    plot(pop.size~gen,data = rep0.data, type = "l", lwd = 2.5, col = "purple", ylim = c(0, max(pop.size)))
    lines(pop.size~gen, data = rep1.data, lwd= 2.5, col = "red", ylim = c(0, max(pop.size)))
   
    dev.off()
}
