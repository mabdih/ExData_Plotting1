
# Loading,Cleaning and Subsetting the Electric Power Consumption (EPC) data

epc <- read.table("data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)
epc_subset <- epc[epc$Date %in% c("1/2/2007","2/2/2007"), ]


epc_subset$datetime <- strptime(paste(epc_subset$Date, epc_subset$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

#Changing the variable Global Active Power to Numeric

epc_subset$Global_active_power <- as.numeric(epc_subset$Global_active_power)

#Constructing Plot 2 - Linechart of Global Active Power

png("plot2.png", width = 480, height = 480)   # Saving Plot to PNG File 480 by 480 pixel
with(epc_subset, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)"))
dev.off()