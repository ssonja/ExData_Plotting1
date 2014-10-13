dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)
hist(dat$Global_active_power,col="red",main="Global active power",xlab="Global active power (kilowatts)")