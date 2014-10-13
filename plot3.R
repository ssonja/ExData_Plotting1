dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

datetime<-as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

plot(datetime,dat$Sub_metering_1, type="l",col="black",ylab="Energy sub metering",xlab="")
lines(datetime,dat$Sub_metering_2, type="l",col="red")
lines(datetime,dat$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
