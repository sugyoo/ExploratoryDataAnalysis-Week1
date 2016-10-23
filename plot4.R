data <- read.csv("./household_power_consumption.txt", header=T, sep=";", na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote="\"")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


## Subsetting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Plot 4

# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow = c(2, 2))
plot(subdata$DateTime, subdata$Global_active_power, xlab = "",         ylab = "Global Active Power (kilowatt)", type = "l")
plot(subdata$DateTime, subdata$Voltage,             xlab = "datetime", ylab = "Voltage",                        type = "l")

plot(subdata$DateTime,  subdata$Sub_metering_1, xlab = "",             ylab = "Energy sub metering",            type = "l")
lines(subdata$DateTime, subdata$Sub_metering_2, col = "red" )
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1),cex=.5) #bty="n", cex=.5)



plot(subdata$DateTime, subdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()