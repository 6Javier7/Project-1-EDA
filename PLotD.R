#Plot 4

download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "Explory.zip")
unzip("Explory.zip")

data <- read.csv2('/home/javier/Documentos/JAVIER/R/Packages/Exploratory/explory/household_power_consumption.txt')
library(data.table)


data1 <- data.table(data) 
data2 <- data
data2$Date <- gsub("/", "-", data2$Date)
data2$Date <- as.Date(data2$Date, "%d-%m-%Y")
data3 <- data2[Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"),]
data3 <- data1[Date == "2007-02-01" | Date == "2007-02-02",]
data3[,Date1 := strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S")]

png("plotD.png", height = 700, width = 780)
par (mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data3,{
    plot(Date1, as.numeric(Global_active_power), type = "l", ylab = "Global Active Power", xlab = "")
    plot(Date1, as.numeric(Voltage), type = "l", ylab = "Voltage", xlab = "")
    with(data3,{
    plot(Date1, as.numeric(Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
    points(Date1, as.numeric(Sub_metering_2), type = "l", col = "red")
    points(Date1, as.numeric(Sub_metering_3), type = "l", col = "blue")
    legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
    })
    plot(Date1, as.numeric(Global_reactive_power), type = "l", ylab = "Global Reactive Power", xlab = "")

})
dev.off()

par (mfrow = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1), oma = c(0, 0, 0, 0))