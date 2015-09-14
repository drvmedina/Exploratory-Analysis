dataFile <- "./data/household_power_consumption.txt"
datos <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selected <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

graph1 <- as.numeric(selected$Global_active_power)
png("plot1.png", width=480, height=480)
hist(graph1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
