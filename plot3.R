myData <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
myData <- subset(myData, Date == "1/2/2007" | Date == "2/2/2007")
head(myData)
str(myData)
table(myData$Date)

myData$DateTime <- paste0(myData$Date,myData$Time)
myData$DateTime <- strptime(myData$DateTime, format = "%d/%m/%Y%H:%M:%S")

with(myData, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(myData, lines(DateTime, Sub_metering_1, col = "black"))
with(myData, lines(DateTime, Sub_metering_2, col = "red"))
with(myData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7, pt.cex = 1)
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off()