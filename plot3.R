
#### Read the downloaded data ####
library(data.table)
powerData <- fread("household_power_consumption.txt")

#### Extract data only for the required dates ####
dateSubset <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007", ]

#### Combine Date and Time variables and convert to Date format ####
datetime <- paste(dateSubset$Date, dateSubset$Time, sep = " ")
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
dateSubset$datetime <- datetime

#### Plot 3 ####

######## Setting global parameters
par(mfrow=c(1,1), mar=c(5,5,3,1))

######## Plotting a line plot with color coded variables
with(dateSubset, plot(datetime, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "l"))
with(dateSubset, lines(datetime, Sub_metering_2, col = "red"))
with(dateSubset, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

######## Saving the plot to a png file
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()
