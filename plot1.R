
# Loading,Cleaning and Subsetting the Electric Power Consumption (EPC) data

epc <- read.table("data/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
filter_dates <- as.Date(c("2007-02-01", "2007-02-02"), format = "%Y-%m-%d")
epc_subset <- epc[epc$Date %in% filter_dates, ]

#Changing the variable Global Active Power to Numeric

epc_subset$Global_active_power <- as.numeric(epc_subset$Global_active_power)

# Constructing Plot 1 - Histogram of Global Active Power in Kilowatts
png("plot1.png", width = 480, height = 480)   # Saving Plot to PNG File 480 by 480 pixel
hist(epc_subset$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()