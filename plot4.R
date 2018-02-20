## Generate first plot
## Chris M.
## 2/20/2018

#Note that datefile should be in the root directory of this project

#Read in data with correct seperator and NA character
data<-read.csv("./household_power_consumption.txt",sep=";",na="?")

#Convert dates to correct datetime format
data<-cbind(strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S"),data)
names(data)[1]<-"Datetime"

#Filter data to the correct date range
data2<-filter(data,Date=="1/2/2007" | Date=="2/2/2007")

#Generate 2x2 plot array
png("./plot4.png")
par(mfrow=c(2,2))

#Plot 1
plot(data2$Datetime,data2$Global_active_power,type="l",ylab="Global Active Power",xlab="")

#Plot 2
plot(data2$Datetime,data2$Voltage,type="l",ylab="Voltage",xlab="datetime")

#Plot 3
plot(data2$Datetime,data2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data2$Datetime,data2$Sub_metering_2,col="red")
lines(data2$Datetime,data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#Plot 4
plot(data2$Datetime,data2$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()