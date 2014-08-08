library(sqldf)
filename="data/household_power_consumption.txt"
hpcdata<-read.csv.sql(filename,sep=";",sql='select * from file where Date="2/1/2007" OR Date="2/2/2007"')
png(filename = "plot4.png",width = 480, height = 480, units = "px",bg = "white")
par(mfrow=c(2,2))#Plot 1
#Plot 1
par(yaxt="n")
plot(hpcdata$Date,hpcdata$Global_active_power,type="l",
     ylim=c(0,8),ylab="Global Active Power (kilowatts)",xlab="",cex.axis=0.8,cex.lab=0.8)
par(yaxt="s")
axis(2,at=c(0,2,4,6),lwd=2)
#Plot 2
plot(hpcdata$Date,hpcdata$Voltage,type="l",
xlab="datetime",ylab="Voltage",cex.axis=0.8,cex.lab=0.8)

#plot 3
par(yaxt="n")
plot(hpcdata$Date,hpcdata$Sub_metering_3,type="l",col="blue",
     xlab="",ylab="Energy sub metering",ylim=c(0,40),cex.axis=0.8,cex.lab=0.8)
box(which="plot",lty="solid")
lines(hpcdata$Date,hpcdata$Sub_metering_1,type="l")
lines(hpcdata$Date,hpcdata$Sub_metering_2,type="l",col="red")
legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,cex=.8)
par(yaxt="s")
axis(2,at=c(0,10,20,30),lwd=2)

#plot 4
plot(hpcdata$Date,hpcdata$Global_reactive_power,type="l",
xlab="datetime",ylab="Global reactive power",cex.axis=0.8,cex.lab=0.8)

dev.off()
