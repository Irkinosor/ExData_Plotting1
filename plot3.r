#Reading and cleaning data
data <- read.table(fileurl,header=TRUE, sep=";",nrows = 3)
data <-read.table(fileurl, sep=";", skip = 66637, nrows = 40322, 
                  colClasses = "character", col.names = names(data))
Date1 <-as.Date(data$Date, format='%d/%m/%Y')


power <- data[Date1 %in%  as.Date(c('2007-02-01','2007-02-02')), ]

power$fullDate <-strptime(paste(power$Date, power$Time, sep=" "),
                          format="%d/%m/%Y %H:%M:%S")
power[,3:9]<- suppressWarnings(sapply(power[,3:9],as.numeric))

#Making the third plot
plot(power$fullDate,power$Sub_metering_1, xlab = "",ylab = "Energy sub metering",
     type ="l" )
lines(power$fullDate,power$Sub_metering_2, xlab = "",ylab = "Energy sub metering",
      type ="l",col = "red")
lines(power$fullDate,power$Sub_metering_3, xlab = "",ylab = "Energy sub metering",
      type ="l",col = "blue")
legend('topright',legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,col = c("black","blue","red"))
dev.copy(png, file = "plot3.png")
dev.off()