library("data.table")

setwd("C:/Users/Home/Desktop/Exploratory")

#Reads in data from file then subsets data for specified dates
data <- data.table::fread(input = "household_power_consumption.txt",na.strings="?")

#subsetting data 
dateddata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dateddata$Date, dateddata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activepower <- as.numeric(dateddata$Global_active_power)
subMetering1 <- as.numeric(dateddata$Sub_metering_1)
subMetering2 <- as.numeric(dateddata$Sub_metering_2)
subMetering3 <- as.numeric(dateddata$Sub_metering_3)

#plot3
png("plot3.png")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
