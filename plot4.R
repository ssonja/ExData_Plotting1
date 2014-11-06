dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

datetime<-as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png") 

par(mfrow=c(2,2))
with(dat,
  {
    plot(datetime,Global_active_power,ylab="Global active power", type="l",xlab="")
    plot(datetime,Voltage,ylab="Voltage", type="l")
  
    plot(datetime,Sub_metering_1, type="l",col="black",ylab="Energy sub metering",xlab="")
    lines(datetime,Sub_metering_2, type="l",col="red")
    lines(datetime,Sub_metering_3, type="l",col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    plot(datetime,Global_reactive_power, type="l")
  }
)

dev.off()