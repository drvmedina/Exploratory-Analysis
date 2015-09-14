dataFile <- "./data/household_power_consumption.txt"
datos <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selected <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]


horario <- strptime(paste(selected$Date, selected$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
selected <- as.numeric(selected$Global_active_power)
png("plot2.png", width=480, height=480)
plot(horario, selected, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()