# read and subset data
data <- read.table("./household_power_consumption.txt", sep=";", header = T)
ds <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# paste Date & Time together
ds$Date_new <- paste(ds$Date, ds$Time, sep=" ")
ds$Date_new <- as.POSIXct(ds$Date_new, format = "%d/%m/%Y %H:%M:%S")

# change variable class to numeric
ds$Global_active_power <- as.numeric(ds$Global_active_power)
ds$Global_reactive_power <- as.numeric(ds$Global_reactive_power)
ds$Voltage <- as.numeric(ds$Voltage)
ds$Sub_metering_1 <- as.numeric(ds$Sub_metering_1)
ds$Sub_metering_2 <- as.numeric(ds$Sub_metering_2)
ds$Sub_metering_3 <- as.numeric(ds$Sub_metering_3)

# create plot
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2, 2))
with(ds, {
        plot(Date_new, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(Date_new, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(Date_new, Sub_metering_1, type="l", xlab="",
             ylab = "Energy sub metering")
        lines(Date_new, Sub_metering_2, type="l", col="red")
        lines(Date_new, Sub_metering_3, type="l", col="blue")
        legend("topright", bty="n", lwd=1, col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date_new, Global_reactive_power, type="l", xlab="datetime", ylim=c(0, 0.5))
})
dev.off()
