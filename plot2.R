dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

datetime<-as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
png(file = "plot2.png") 
plot(datetime,dat$Global_active_power,ylab="Global active power (kilowatts)", type="l",xlab="")
dev.off()