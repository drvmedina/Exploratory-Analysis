dataFile <- "./data/household_power_consumption.txt"
datos <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selected <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

fecha_hora <- strptime(paste(selected$Date, selected$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
poder_global <- as.numeric(selected$Global_active_power)
subs1 <- as.numeric(selected$Sub_metering_1)
subs2 <- as.numeric(selected$Sub_metering_2)
subs3 <- as.numeric(selected$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(fecha_hora, subs1, type="l", ylab="Energy Submetering", xlab="")
lines(fecha_hora, subs2, type="l", col="red")
lines(fecha_hora, subs3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()