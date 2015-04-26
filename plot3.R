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
png(filename="plot3.png", width=480, height=480)

# Plot
col <- c(rep("", 5), "black", "red", "blue")
with(data, {
        plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
        for(i in 6:8) lines(Time, data[,i], col=col[i])
})
legend("topright", lty=1, lwd=1, bty="n", legend=colnames(data[6:8]), col=col[6:8])

# Close graphics device
dev.off()