library("data.table")

setwd("C:/Users/Home/Desktop/Exploratory")

#Reads in data from file then subsets data for specified dates
data <- data.table::fread(input = "household_power_consumption.txt",na.strings="?")

#subsetting data 
dateddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot1
activepower <- as.numeric(dateddata$Global_active_power)
png("plot1.png")
hist(activepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
