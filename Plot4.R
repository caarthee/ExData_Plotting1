data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data1<-subset(data_full,Date=="1/2/2007" | Date=="2/2/2007")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

datetime<-paste(data1$Date,data1$Time)
data1$Datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2))
plot(data1$Global_active_power ~ data1$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
plot(data1$Voltage ~ data1$Datetime, type="l",ylab="Voltage (volt)", xlab="")

with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
plot(data1$Global_reactive_power ~ data1$Datetime, type="l",ylab="Global Rective Power (kilowatts)",xlab="")

