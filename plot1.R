# Assess classes
init <- read.table("household.txt", header=T, sep=";", nrows=100)
classes <- sapply(init, class)

# Read data
data <- subset(read.table("household.txt", header=T, sep=";", na.strings="?", 
        colClasses=classes, nrows=2075259), Date=="1/2/2007"|Date=="2/2/2007")

# Open graphics device
png(filename="plot1.png", width=480, height=480)

# Plot
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# Close graphics device
dev.off()