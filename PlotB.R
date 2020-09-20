#Plot 2

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

png("plotB.png", height = 480, width = 480)
with(data3, plot(Date1, as.numeric(Global_active_power), type = "l", main = "Global Active Pover", ylab = "Global Active Powe (kilowatts)", xlab = ""))
dev.off()