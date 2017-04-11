#read data file
data<-read.csv2("household_power_consumption.txt",sep=";",strip.white = TRUE,stringsAsFactors =FALSE,
                dec = ".",colClasses=c(rep("character",2),rep("numeric",7)),na.strings = "?")

#extract day1 and day2
date_day1<-as.Date("2007-02-01")
date_day2<-as.Date("2007-02-02")
dates<-as.Date(data[,1],format="%d/%m/%Y")
data_day_1<-data[dates==date_day1,]
data_day_2<-data[dates==date_day2,]
data_day_1_2<-rbind(data_day_1,data_day_2)

par(mfrow=c(2,2))
#plot figure1
plot(data_day_1_2[,3],type="l",xlab="",main ="",ylab="Global Active Power (kilowatts)",xaxt = "n")
axis(1, at=c(1 ,1440, 2880), labels=c("Thu","Fri","Sat"))

#plot figure2
plot(data_day_1_2[,5],type="l",xlab="datetime",main ="",ylab="Voltage",xaxt = "n")
axis(1, at=c(1 ,1440, 2880), labels=c("Thu","Fri","Sat"))

#plot figure3
plot(data_day_1_2[,7],type="l",xlab="",main ="",ylab="Energy sub metering",xaxt = "n",yaxt = "n",
     col="black", ylim=c(0.0,40.0))
par(new=T)
plot(data_day_1_2[,8],type="l",xlab="",main ="",ylab="",xaxt = "n",yaxt = "n",col="red", ylim=c(0.0,40.0))
par(new=T)
plot(data_day_1_2[,9],type="l",xlab="",main ="",ylab="",xaxt = "n",yaxt = "n",col="blue", ylim=c(0.0,40.0))
axis(1, at=c(1 ,1440, 2880), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0 ,10, 20,30), labels=c("0","10","20","30"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=1)

#plot figure4
plot(data_day_1_2[,4],type="l",xlab="datetime",main ="",ylab="Global_reactive_power",xaxt = "n")
axis(1, at=c(1 ,1440, 2880), labels=c("Thu","Fri","Sat"))

#write png file
dev.copy(png,file="plot4.png")
dev.off(dev.prev())
dev.off()
