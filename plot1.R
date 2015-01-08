myData <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
myData <- subset(myData, Date == "1/2/2007" | Date == "2/2/2007")
head(myData)
str(myData)
table(myData$Date)

myData$DateTime <- paste0(myData$Date,myData$Time)
myData$DateTime <- strptime(myData$DateTime, format = "%d/%m/%Y%H:%M:%S")

par(mfrow = c(1,1),mar = c(4, 4, 2, 1))
hist(myData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()