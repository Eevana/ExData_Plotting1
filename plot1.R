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
png(file="plot1.png", height=480, width=480, bg = "transparent")
hist(hp2d$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()

rm(hp)