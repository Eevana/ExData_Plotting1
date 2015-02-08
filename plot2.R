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
png(file="plot2.png", height=480, width=480, bg = "transparent")
plot(hp2d$DateTime,hp2d$Global_active_power,type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

rm(hp)