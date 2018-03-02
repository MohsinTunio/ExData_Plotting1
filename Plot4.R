#----------------------------------------------
#          ***Plot4***
#----------------------------------------------
# I suppose the data have been extracted into the working directory
# This script creates an image with .png extension in the working directory-- it employs graphi device method
# dev.off() to achieve this

#library(mise) # this clears the console-- removing wordy mess (Optional)
rm(list=ls()) # this clears existing variables and datasets from memmory
#mise()

dta<- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
filtered_data <- dta[dta$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
filtered_data <- cbind(SetTime, filtered_data)

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
png("Plot4.png", width = 5*480,height = 5*480, res = 300,pointsize = 15) # place this line at this location only
par(mfrow=c(2,2))

plot(filtered_data$SetTime, filtered_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(filtered_data$SetTime, filtered_data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(filtered_data$SetTime, filtered_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(filtered_data$SetTime, filtered_data$Sub_metering_2, type="l", col="red")
lines(filtered_data$SetTime, filtered_data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(filtered_data$SetTime, filtered_data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")


dev.off()