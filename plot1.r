data <- read.table(fileurl,header=TRUE, sep=";",nrows = 3)
data <-read.table(fileurl, sep=";", skip = 66637, nrows = 40322, 
                  colClasses = "character", col.names = names(data))

data[,3:9]<- suppressWarnings(sapply(data[,3:9],as.numeric))

hist(na.omit(data$Global_active_power),breaks = 50, main = "Global Active Power",
     xlab = "Global Active Power (kilowatt)",col = "red")

dev.copy(png, file = "plot1.png")
dev.off()
