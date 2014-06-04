#Reading and cleaning data
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",nrows = 3)

data <-read.table("household_power_consumption.txt", sep=";", skip = 66637, nrows = 40322, 
                  colClasses = "character", col.names = names(data))
Date1 <-as.Date(data$Date, format='%d/%m/%Y')


power <- data[Date1 %in%  as.Date(c('2007-02-01','2007-02-02')), ]

power$fullDate <-strptime(paste(power$Date, power$Time, sep=" "),
                          format="%d/%m/%Y %H:%M:%S")

power[,3:9]<- suppressWarnings(sapply(power[,3:9],as.numeric))

#making fourth plot
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,3,2,1))

#first plot
plot(power$fullDate,power$Global_active_power, xlab = "",ylab = "Global Active Power",
     type ="l" )
#second plot
plot(power$fullDate,power$Voltage, xlab = "datetime",ylab = "Voltage",
     type ="l" )
with(power,{
#third plot
plot(fullDate,Sub_metering_1, xlab = "",ylab = "Energy sub metering",
     type ="l" )
lines(fullDate,Sub_metering_2, xlab = "",ylab = "Energy sub metering",
      type ="l",col = "red")
lines(fullDate,Sub_metering_3, xlab = "",ylab = "Energy sub metering",
      type ="l",col = "blue")
legend('topright',legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,col = c("black","blue","red"))
})
#fourth plot

plot(power$fullDate,power$Global_reactive_power, xlab = "datetime",ylab = "Global reactive Power",
     type ="l" )

dev.off()