#read in the data
 elec <-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#transform date and time
 elec$Date <-as.Date(elec[,1], "%d/%m/%Y")
elec$Time2 <-strptime(elec[,2], "%H:%M:%S")

#filter to only include the 2 days
elec2 <- subset (elec, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02') )

#transform the Global_active_power to numeric
elec2$Global_active_power  <- as.numeric(elec2[,3])
elec2$Global_active_power2 <- elec2[,3]/1000

#graph
 hist(elec2$Global_active_power2, col="red",  main = "Global Active Power" , xlab="Global Active Power (kilowatts)")

#export ot png
dev.copy(png, file = "plot1.png")
dev.off() 
