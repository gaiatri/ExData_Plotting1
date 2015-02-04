
#### Read the downloaded data ####
library(data.table)
powerData <- fread("household_power_consumption.txt")

#### Extract data only for the required dates ####
dateSubset <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007", ]

#### Combine Date and Time variables and convert to Date format ####
datetime <- paste(dateSubset$Date, dateSubset$Time, sep = " ")
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
dateSubset$datetime <- datetime

#### Plot 2 ####

######## Setting global parameters
par(mfrow=c(1,1), mar=c(5,5,3,1))

######## Plotting a line plot
with(dateSubset, plot(datetime, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))

######## Saving the plot to a png file
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
