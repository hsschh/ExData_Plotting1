# read and subset data
data <- read.table("./household_power_consumption.txt", sep=";", header = T)
ds <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# paste Date & Time together
ds$Date_new <- paste(ds$Date, ds$Time, sep=" ")
ds$Date_new <- as.POSIXct(ds$Date_new, format = "%d/%m/%Y %H:%M:%S")

# change variable class to numeric
ds$Global_active_power <- as.numeric(ds$Global_active_power)

# create plot
png("plot2.png", width = 480, height = 480, units = "px")
plot(ds$Date_new, ds$Global_active_power, type="l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()