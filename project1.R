## Read file 
datos <- read.csv("household_power_consumption.txt"; sep = ";")

## Subset file with date between 2007-02-01 and 2007-02-02
datos_filtrados <- subset(datos, Date %in%  c("1/2/2007","2/2/2007"))

## obtain size of matrix
dim(datos_filtrados)

## first plot histogram
png("plot1.png", width=400, height=400)
hist(as.numeric(datos_filtrados$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()

## second plot
png("plot2.png", width=400, height=400)
plot(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(datos_filtrados$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

## third plot
png("plot3.png", width=400, height=400)
plot(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), datos_filtrados$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), datos_filtrados$Sub_metering_2, col="red")
lines(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), datos_filtrados$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()

## fourth plot
## grid 2x2
png("plot4.png", width=400, height=400)
par(mfrow=c(2,2))
# first cell
plot(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(datos_filtrados$Global_active_power), type="l", xlab="", ylab="Global Active Power")
# second cell
plot(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(datos_filtrados$Voltage), type="l", xlab="datetime", ylab="Voltage")
# third cell
plot(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), datos_filtrados$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), datos_filtrados$Sub_metering_2, col="red")
lines(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), datos_filtrados$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),
c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0)
# fourth cell
plot(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(datos_filtrados$Global_reactive_power), type="n", xlab="datetime", ylab="Global_reactive_power")
lines(strptime(paste(datos_filtrados$Date, datos_filtrados$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(datos_filtrados$Global_reactive_power))
dev.off()
