
rt <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                 stringsAsFactors=FALSE, dec=".",strip.white = FALSE,blank.lines.skip = TRUE)

dt<-rt[rt$Date %in% c("1/2/2007","2/2/2007") ,]


dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
dt$Voltage <- as.numeric(dt$Voltage)
dt$datetime <- strptime(paste(dt$Date, dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))

plot(dt$datetime,dt$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dt$datetime,dt$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dt$datetime, dt$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dt$datetime, dt$Sub_metering_2, type="l", col="red")
lines(dt$datetime, dt$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(dt$datetime,dt$Global_reactive_power, type='l', ylim = c(0.0, 0.5),xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()












