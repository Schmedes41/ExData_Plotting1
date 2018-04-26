library(lubridate)
#Each plot will load the table, format variables, and subset
powerTable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
powerTable$Date <- dmy(powerTable$Date)
powerTable$Time <- hms(powerTable$Time)
powerTable <- subset(powerTable, Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")))
png(file = "plot2.png", width = 480, height = 480, bg="transparent")
#Graphing Code
with(powerTable, plot(Date + Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
#Device Off
dev.off()