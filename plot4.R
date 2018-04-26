library(lubridate)
library(ggplot2)
#Each plot will load the table, format variables, and subset
powerTable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
powerTable$Date <- dmy(powerTable$Date)
powerTable$Time <- hms(powerTable$Time)
powerTable <- subset(powerTable, Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")))
png(file = "plot4.png", width = 480, height = 480, bg="transparent")
#Graphing Code
#First column
par(mfcol=c(2,2))
with(powerTable, plot(Date + Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
with(powerTable, plot(Date + Time, Sub_metering_1 + Sub_metering_2 + Sub_metering_3, type="n", xlab="", ylab="Energy sub metering", ylim=range(Sub_metering_1)))
with(powerTable[,c("Date", "Time", "Sub_metering_1")], points(Date+Time, Sub_metering_1, col ="black", type="l"))
with(powerTable[,c("Date", "Time", "Sub_metering_2")], points(Date+Time, Sub_metering_2, col ="red", type="l"))
with(powerTable[,c("Date", "Time", "Sub_metering_3")], points(Date+Time, Sub_metering_3, col ="blue", type="l"))
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
#Second column
with(powerTable, plot(Date + Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(powerTable, plot(Date + Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
#Device Off
dev.off()