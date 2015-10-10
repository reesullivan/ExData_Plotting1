#read in the data
elec <-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#transform date and time
 elec$Date <-as.Date(elec[,1], "%d/%m/%Y")
elec$Time2 <-strptime(elec[,2], "%H:%M:%S")


#filter based on date
elec2 <- subset (elec, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02') )

elec2$weekday <-weekdays(elec2[,1])
 elec2$Time3 <-as.POSIXct(paste(elec2$Date, elec2$Time))

#format the needed elements to numeric
elec2$Global_active_power  <- as.numeric(elec2[,3])
elec2$Global_active_power2 <- elec2[,3]/1000

elec2$Sub_metering_1  <- as.numeric(elec2[,7])
elec2$Sub_metering_2  <- as.numeric(elec2[,8])
elec2$Sub_metering_3  <- as.numeric(elec2[,9])
elec2$Global_reactive_power <- as.numeric(elec2[,6])
elec2$Voltage <- as.numeric(elec2[,5])

#graphs
 par(mfrow = c(2, 2))
with(elec2, {
plot(Time3, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(Time3, Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(Time3,Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="",  ylim=c(0.0,35.0))
par(new=T)
plot(Time3,Sub_metering_2, type="l", col="red" ,ylab="Energy Sub Metering", xlab="",  ylim=c(0.0,35.0))
par(new=T)
plot(Time3,Sub_metering_3, type="l", col="blue" ,ylab="Energy Sub Metering", xlab="",  ylim=c(0.0,35.0))
par(new=F)
plot(Time3, Global_reactive_power, type="l", xlab="datetime")
})

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() 
