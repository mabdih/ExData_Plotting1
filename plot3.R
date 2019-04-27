
# Loading,Cleaning and Subsetting the Electric Power Consumption (EPC) data

epc <- read.table("data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)
epc_subset <- epc[epc$Date %in% c("1/2/2007","2/2/2007"), ]


epc_subset$datetime <- strptime(paste(epc_subset$Date, epc_subset$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

#Changing the sub-metering variables to numeric

epc_subset$Sub_metering_1 <- as.numeric(epc_subset$Sub_metering_1)
epc_subset$Sub_metering_2 <- as.numeric(epc_subset$Sub_metering_2)
epc_subset$Sub_metering_3 <- as.numeric(epc_subset$Sub_metering_3)

#Constructing Plot 3 - Categorized linechart of energy sub-metering

png("plot3.png", width = 480, height = 480)   # Saving Plot to PNG File 480 by 480 pixel
plot(epc_subset$datetime, epc_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(epc_subset$datetime, epc_subset$Sub_metering_2, type="l", col="red")
lines(epc_subset$datetime, epc_subset$Sub_metering_3, type="l", col="blue")
legend("topright",  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()