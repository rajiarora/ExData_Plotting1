library(sqldf)

#using sqldf library, load a subset of the file for the two days we are analysing.
filename="data/household_power_consumption.txt"
hpcdata<-read.csv.sql(filename,sep=";",sql='select * from file 
                      where Date="1/2/2007" OR Date="2/2/2007"')

#Convert the date and time variable to the right format, and class
format<-"%d/%m/%Y %H:%M:%S"
hpcdata$Date<-strptime(paste(hpcdata$Date,hpcdata$Time),format)

#open a png file
png(filename = "plot2.png",width = 480, height = 480, units = "px",bg = "white")

#Turn off Y axis drwaing, to be drawn later separately
par(yaxt="n")

#Draw a line plot
plot(hpcdata$Date,hpcdata$Global_active_power,type="l",
     ylim=c(0,8),ylab="Global Active Power (kilowatts)",xlab="",cex.axis=0.8,cex.lab=0.8)

#Turn y axis drawing on
par(yaxt="s")
axis(2,at=c(0,2,4,6),lwd=2)

dev.off()
