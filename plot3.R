library(sqldf)

#using sqldf library, load a subset of the file for the two days we are analysing.
filename="data/household_power_consumption.txt"
hpcdata<-read.csv.sql(filename,sep=";",sql='select * from file 
                      where Date="1/2/2007" OR Date="2/2/2007"')

#Convert the date and time variable to the right format, and class
format<-"%d/%m/%Y %H:%M:%S"
hpcdata$Date<-strptime(paste(hpcdata$Date,hpcdata$Time),format)

#Open a png device
png(filename = "plot3.png",width = 480, height = 480, units = "px",bg = "white")

#Turn Y axis plotting off
par(yaxt="n")

#Plot the Data, with the widest range first
plot(hpcdata$Date,hpcdata$Sub_metering_3,type="l",col="blue",
     xlab="",ylab="Energy sub metering",ylim=c(0,40),cex.axis=0.8,cex.lab=0.8)
box(which="plot",lty="solid")

#Line plot the other two sets of data
lines(hpcdata$Date,hpcdata$Sub_metering_1,type="l")
lines(hpcdata$Date,hpcdata$Sub_metering_2,type="l",col="red")

#Draw the legend
legend("topright", col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,cex=.8)

#Plot the y -axis
par(yaxt="s")
axis(2,at=c(0,10,20,30),lwd=2)
dev.off()
