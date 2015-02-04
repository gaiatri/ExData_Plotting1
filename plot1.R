
#### Read the downloaded data ####
library(data.table)
powerData <- fread("household_power_consumption.txt")

#### Extract data only for the required dates ####
dateSubset <- powerData[powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007", ]

#### Plot 1 ####

######## Setting global parameters 
par(mfrow=c(1,1), mar=c(5,5,3,1))

######## Plotting a histogram
hist(as.numeric(dateSubset$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

######## Saving the plot to a png file
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
