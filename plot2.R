# Plot2
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

mydata2 <- fread("household_power_consumption.txt", sep=";", na.strings = "?")
mydata2 <- subset(mydata2, Date=="1/2/2007" | Date=="2/2/2007")

mydata2$dateTime <- as.POSIXct(paste(mydata2$Date, mydata2$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(y=mydata2$Global_active_power, x=mydata2$dateTime, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

