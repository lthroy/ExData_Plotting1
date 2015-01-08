myData <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
myData <- subset(myData, Date == "1/2/2007" | Date == "2/2/2007")
head(myData)
str(myData)
table(myData$Date)

myData$DateTime <- paste0(myData$Date,myData$Time)
myData$DateTime <- strptime(myData$DateTime, format = "%d/%m/%Y%H:%M:%S")

with(myData, plot(DateTime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)", main = ""))
with(myData, lines(DateTime, Global_active_power))
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off()