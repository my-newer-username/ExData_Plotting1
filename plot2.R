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
plot(data$Datetime, data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png,"plot2.png",height = 480,width = 480,units = "px")
dev.off()