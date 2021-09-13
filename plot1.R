library(tibble)
library(dplyr)

data<-read.table("household_power_consumption.txt",stringsAsFactor = FALSE,sep=";",header=TRUE,na.strings = "?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

subsetdata<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
hist(subsetdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
