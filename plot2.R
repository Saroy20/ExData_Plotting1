library(tibble)
library(dplyr)

data<-read.table("household_power_consumption.txt",stringsAsFactor = FALSE,sep=";",header=TRUE,na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
subsetdata<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
subsetdata$datetime<-(as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%Y-%m-%d %H:%M:%S"))

plot(subsetdata$datetime,subsetdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
