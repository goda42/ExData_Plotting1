## Generate second plot
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
png("./plot2.png")
plot(data2$Datetime,data2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()