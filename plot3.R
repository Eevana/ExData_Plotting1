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
png ( file="plot3.png", height=480, width=480, bg = "transparent")

with(hp2d, {
  plot(Sub_metering_1~DateTime, type="l", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

rm(hp)