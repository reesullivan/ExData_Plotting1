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

with(elec2, plot(Time3, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() 
