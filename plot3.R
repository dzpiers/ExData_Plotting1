# Plot3
library(dplyr)
library(data.table)

filename <- "exdata_data_houshold_power_consumption.zip"
if(!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, filename, method="curl")
}

if(!file.exists("household_power_consumption.txt")){
    unzip(filename)
}

mydata3 <- fread("household_power_consumption.txt", sep=";", na.strings = "?")
mydata3 <- subset(mydata3, Date=="1/2/2007" | Date=="2/2/2007")

mydata3$datetime <- as.POSIXct(paste(mydata3$Date, mydata3$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(mydata3$datetime, mydata3$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(mydata3$datetime, mydata3$Sub_metering_2, col="red")
lines(mydata3$datetime, mydata3$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))
dev.off()

ts.plot(mydata3$Sub_metering_1, mydata3$Sub_metering_2, mydata3$Sub_metering_3)

