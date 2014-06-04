#Exploratory Data Analysis, Coursera, Course Project 1

data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",nrows = 3)

data <-read.table("household_power_consumption.txt", sep=";", skip = 66637, nrows = 40322, 
                  colClasses = "character", col.names = names(data))
data$Date <-as.Date(data$Date, format='%d/%m/%Y')
power <- data[data$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]


power[,3:9]<- suppressWarnings(sapply(power[,3:9],as.numeric))

png(file = "plot1.png", width = 480, height = 480)

hist(na.omit(power$Global_active_power), main = "Global Active Power",
     xlab = "Global Active Power (kilowatt)",col = "red")


dev.off()
