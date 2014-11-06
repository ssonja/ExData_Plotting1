## Filtering dates using sql query.
##install.packages("sqldf")
library("sqldf")
## it seems that the new version of sqldf has a bug. The script below contains unpublished correct version
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R") 

## my code with SQL query filtering
dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

## opening the output device with default width,height=480
png(file = "plot1.png") 

hist(dat$Global_active_power,col="red",main="Global active power",xlab="Global active power (kilowatts)")

## don't forget to close the device
dev.off()
rm(list=ls())
