data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data1<-subset(data_full,Date=="1/2/2007" | Date=="2/2/2007")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

datetime<-paste(data1$Date,data1$Time)
data1$Datetime <- as.POSIXct(datetime)

with(data1, {
     plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")   })

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

  