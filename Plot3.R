#----------------------------------------------
#          ***Plot3***
#----------------------------------------------
# I suppose the data have been extracted into the working directory
# This script creates an image with .png extension in the working directory-- it employs graphi device method
# dev.off() to achieve this

# I suppose the data have been extracted into the working directory
#library(mise) # this clears the console-- removing wordy mess (Optional)
rm(list=ls()) # this clears existing variables and datasets from memmory
#mise()

dta<- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
filtered_data <- dta[dta$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
filtered_data <- cbind(SetTime, filtered_data)



columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
png("Plot3.png", width = 5*480,height = 5*480, res = 300,pointsize = 15)
plot(filtered_data$SetTime, filtered_data$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(filtered_data$SetTime, filtered_data$Sub_metering_2, col=columnlines[2])
lines(filtered_data$SetTime, filtered_data$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

dev.off()

