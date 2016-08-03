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

hist(data$Global_active_power,12,col="red",xlim=c(0,6),ylim=c(0,1200),xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

dev.copy(png,"plot1.png",height = 480,width = 480,units = "px")
dev.off()