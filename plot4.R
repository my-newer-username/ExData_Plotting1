FileName <- "household_power_consumption.txt"

if (!file.exists(FileName))
{
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip")
    unzip("power.zip")
}

data <- read.table(FileName, sep = ";", header = T, na.strings = "?")

data_dates <- as.Date(as.character(data[,1]),format="%d/%m/%Y")

D1 <- as.Date("2007-02-01")
D2 <- as.Date("2007-02-02")

data <- subset(data,D1==data_dates | D2==data_dates)

data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


par(mfrow = c(2, 2))

plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power",xlab = "")

plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.copy(png,"plot4.png",height = 480,width = 480,units = "px")
dev.off()