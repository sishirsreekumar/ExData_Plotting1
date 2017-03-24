elec <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
elec <- subset(elec , Date == "1/2/2007" | Date ==  "2/2/2007")
elec$datetime <- strptime(paste(elec$Date, elec$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(elec$datetime, elec$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(elec$datetime, elec$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(elec$datetime, elec$Sub_metering_1, type="l", xlab ="",  ylab="Energy sub metering")
lines(elec$datetime, elec$Sub_metering_2, type="l", col="red")
lines(elec$datetime, elec$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(elec$datetime, elec$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()