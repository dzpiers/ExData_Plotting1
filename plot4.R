# Plot4
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

mydata4 <- fread("household_power_consumption.txt", sep=";", na.strings = "?")
mydata4 <- subset(mydata4, Date=="1/2/2007" | Date=="2/2/2007")

mydata4$datetime <- as.POSIXct(paste(mydata4$Date, mydata4$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Plot4.1
plot(y=mydata4$Global_active_power, x=mydata4$datetime, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Plot 4.2
plot(y=mydata4$Voltage, x=mydata4$datetime, type="l", 
     xlab="datetime", ylab="Voltage")

# Plot 4.3
plot(mydata4$datetime, mydata4$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(mydata4$datetime, mydata4$Sub_metering_2, col="red")
lines(mydata4$datetime, mydata4$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))

# Plot 4.4
plot(y=mydata4$Global_reactive_power, x=mydata4$datetime, type="l", 
     xlab="datetime", ylab="global_reactive_power")

dev.off()


