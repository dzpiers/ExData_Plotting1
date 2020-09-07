# Plot1
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

mydata1 <- fread("household_power_consumption.txt", sep=";", na.strings = "?")
mydata1 <- subset(mydata1, Date=="1/2/2007" | Date=="2/2/2007")

png("plot1.png", width=480, height=480)
hist(mydata1$Global_active_power, col="red", xlim=c(0,6), 
     main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
