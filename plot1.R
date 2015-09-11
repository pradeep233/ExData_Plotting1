
rt <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                 stringsAsFactors=FALSE, dec=".",strip.white = FALSE,blank.lines.skip = TRUE)
#nrow(rt)
dt<-rt[rt$Date %in% c("1/2/2007","2/2/2007") ,]


dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
dt$Voltage <- as.numeric(dt$Voltage)
dt$datetime <- strptime(paste(dt$Date, dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



hist(dt$Global_active_power, 
     include.lowest = TRUE, right = TRUE,
     density = NULL, angle = 30, col = "red", border = NULL,  
     main = paste("Global Active Power"),
     xlab=paste("Global Active Power (kilowatts)"),
     axes = TRUE, plot = TRUE, warn.unused = TRUE)

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
