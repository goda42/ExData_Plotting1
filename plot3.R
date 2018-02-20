## Generate third plot
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

#Generate plot
png("./plot3.png")
plot(data2$Datetime,data2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data2$Datetime,data2$Sub_metering_2,col="red")
lines(data2$Datetime,data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()