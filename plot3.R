library(dplyr)
main_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c("character","character",rep("numeric",7)))
des_data<-subset(main_data,main_data$Date=="1/2/2007"|main_data=="2/2/2007")
datetime <- strptime(paste(des_data$Date, des_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png",width = 480,height = 480)
plot(datetime,des_data$Sub_metering_1,xlab="",ylab = "Energy sub metering",col="black",type="l",mar=c(2,2,1,1))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
lines(datetime,des_data$Sub_metering_2,col="red")
lines(datetime,des_data$Sub_metering_3,col="blue")
dev.off()