library("data.table")

setwd("C:/Users/Home/Desktop/Exploratory")

#Reads in data from file then subsets data for specified dates
data <- data.table::fread(input = "household_power_consumption.txt",na.strings="?")

#subsetting data 
dateddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot2
datetime <- strptime(paste(dateddata$Date, dateddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(dateddata$Global_active_power)
png("plot2.png")
plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
