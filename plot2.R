library(sqldf)
filename="data/household_power_consumption.txt"
hpcdata<-read.csv.sql(filename,sep=";",sql='select * from file where Date="2/1/2007" OR Date="2/2/2007"')
format<-"%d/%m/%Y %H:%M:%S"
hpcdata$Date<-strptime(paste(hpcdata$Date,hpcdata$Time),format)
png(filename = "plot2.png",width = 480, height = 480, units = "px",bg = "white")
par(yaxt="n")
plot(hpcdata$Date,hpcdata$Global_active_power,type="l",
     ylim=c(0,8),ylab="Global Active Power (kilowatts)",xlab="",cex.axis=0.8,cex.lab=0.8)
par(yaxt="s")
axis(2,at=c(0,2,4,6),lwd=2)
dev.off()
