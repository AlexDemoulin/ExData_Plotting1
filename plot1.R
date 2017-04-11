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

#plot the figure
hist(data_day_1_2[,3],col="red",main ="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)")

#write png file
dev.copy(png,file="plot1.png")
dev.off(dev.prev())
dev.off()
