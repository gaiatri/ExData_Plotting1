
#### Read the downloaded data ####
library(data.table)
powerData <- fread("household_power_consumption.txt")

#### Extract data only for the required dates ####
dateSubset <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007", ]

#### Combine Date and Time variables and convert to Date format ####
datetime <- paste(dateSubset$Date, dateSubset$Time, sep = " ")
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
dateSubset$datetime <- datetime

#### Plot 4 ####

######## Setting global parameters
par(mfrow=c(2,2), mar=c(4,4,2,2), cex.lab = 0.7)

######## Subplot for 1st row, 1st column
with(dateSubset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

######## Subplot for 1st row, 2nd column
with(dateSubset, plot(datetime, Voltage, type = "l", xlab = "datetime"))

######## Subplot for 2nd row, 1st column
with(dateSubset, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dateSubset, lines(datetime, Sub_metering_2, col = "red"))
with(dateSubset, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, lwd = 2, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)

######## Subplot for 2nd row, 2nd column
with(dateSubset, plot(datetime, Global_reactive_power, xlab = "datetime", type = "l"))

######## Saving the plot to a png file
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()
