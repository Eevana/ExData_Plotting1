#Loading data
hp<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#Converting date format
hp$Date<-as.Date(hp$Date, format = "%d/%m/%Y ")

#Subsetting data
hp2d<-subset(hp, Date >= '2007-02-01 00:00:00' & Date <='2007-02-02 23:59:59' )

#DateTime
DateTime<-paste(hp2d$Date, hp2d$Time)
hp2d$DateTime<-as.POSIXct(DateTime)

#Plot
png ( file="plot4.png", height=480, width=480, bg = "transparent")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hp2d, {
  plot(DateTime, Global_active_power, type="l",xlab="", ylab="Global Active Power")
  plot(DateTime, Voltage, type="l", ylab="Voltage" )
  plot(Sub_metering_1~DateTime, type="l", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n", cex=0.8,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power")
})

dev.off()

rm(hp)