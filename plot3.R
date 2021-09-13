library(tibble)
library(dplyr)

data<-read.table("household_power_consumption.txt",stringsAsFactor = FALSE,sep=";",header=TRUE,na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subsetdata<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
subsetdata$datetime<-(as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S"))

plot(subsetdata$datetime,subsetdata$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(subsetdata$datetime,subsetdata$Sub_metering_1,col="black")
lines(subsetdata$datetime,subsetdata$Sub_metering_2,col="red")
lines(subsetdata$datetime,subsetdata$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
