#read in the data
elec <-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#transform date and time
 elec$Date <-as.Date(elec[,1], "%d/%m/%Y")
elec$Time2 <-strptime(elec[,2], "%H:%M:%S")


#filter based on date
elec2 <- subset (elec, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02') )

elec2$weekday <-weekdays(elec2[,1])
 elec2$Time3 <-as.POSIXct(paste(elec2$Date, elec2$Time))


elec2$Global_active_power  <- as.numeric(elec2[,3])
elec2$Global_active_power2 <- elec2[,3]/1000


#transform sub metering
elec2$Sub_metering_1  <- as.numeric(elec2[,7])
elec2$Sub_metering_2  <- as.numeric(elec2[,8])
elec2$Sub_metering_3  <- as.numeric(elec2[,9])

#graphs
with(elec2, plot(Time3,Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="",  ylim=c(0.0,35.0)))
par(new=T)
with(elec2,  plot(Time3,Sub_metering_2, type="l", col="red" ,ylab="Energy Sub Metering", xlab="",  ylim=c(0.0,35.0)))
par(new=T)
with(elec2,  plot(Time3,Sub_metering_3, type="l", col="blue" ,ylab="Energy Sub Metering", xlab="",  ylim=c(0.0,35.0)), legend("topright", col = c("black", "red", "blue")))


dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() 
