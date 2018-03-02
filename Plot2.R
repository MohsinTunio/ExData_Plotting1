#----------------------------------------------
#          ***Plot2***
#----------------------------------------------
# I suppose the data have been extracted into the working directory
# This script creates an image with .png extension in the working directory-- it employs graphi device method
# dev.off() to achieve this

#library(mise) # this clears the interface-- removing wordy mess (Optional)
rm(list=ls()) # this clears existing variables and datasets from memmory
#mise()

dta<- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
## set time variable
filtered_data <- dta[dta$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
filtered_data <- cbind(SetTime, filtered_data)

png("Plot2.png", width = 5*480,height = 5*480, res = 300,pointsize = 15)
plot(filtered_data$SetTime, filtered_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() # This creates a file in the working directory