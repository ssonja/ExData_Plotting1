## Filtering dates using sql query.
##install.packages("sqldf")
library("sqldf")
## it seems that the new version of sqldf has a bug. The script below contains unpublished correct version
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R") 

## my code with SQL query filtering
dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

datetime<-as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
## opening the output device
png(file = "plot3.png") 
## plotting
plot(datetime,dat$Sub_metering_1, type="l",col="black",ylab="Energy sub metering",xlab="")
lines(datetime,dat$Sub_metering_2, type="l",col="red")
lines(datetime,dat$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## closing the device
dev.off()
rm(list=ls())
