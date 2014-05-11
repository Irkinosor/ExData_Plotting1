#Reading and cleaning data
data <- read.table(fileurl,header=TRUE, sep=";",nrows = 3)
data <-read.table(fileurl, sep=";", skip = 66637, nrows = 40322, 
                  colClasses = "character", col.names = names(data))
Date1 <-as.Date(data$Date, format='%d/%m/%Y')


power <- data[Date1 %in%  as.Date(c('2007-02-01','2007-02-02')), ]

power$fullDate <-strptime(paste(power$Date, power$Time, sep=" "),
                     format="%d/%m/%Y %H:%M:%S")
power[,3:9]<- suppressWarnings(sapply(power[,3:9],as.numeric))

#making second plot

plot(power$fullDate,power$Global_active_power, xlab = "",ylab = "Global Active Power",
     type ="l" )
