# Assess classes
init <- read.table("household.txt", header=T, sep=";", nrows=100)
classes <- sapply(init, class)

# Read data
data <- subset(read.table("household.txt", header=T, sep=";", na.strings="?", 
                          colClasses=classes, nrows=2075259), Date=="1/2/2007"|Date=="2/2/2007")

# Convert "Date"
data$Time <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time))
data$Date <- NULL

# Open graphics device
png(filename="plot2.png", width=480, height=480)

# Plot
with(data, plot(Time, Global_active_power, type="l", xlab="", 
                ylab="Global Active Power (kilowatts)"))

# Close graphics device
dev.off()