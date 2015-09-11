
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



plot(dt$datetime,dt$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

