# read and subset data
data <- read.table("./household_power_consumption.txt", sep=";", header = T)
ds <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# change variable class to numeric
ds$Global_active_power <- as.numeric(ds$Global_active_power)

# create plot
png("plot1.png", width = 480, height = 480, units = "px")
hist(ds$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()