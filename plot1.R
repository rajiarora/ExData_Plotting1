library(sqldf)

#using sqldf library, load a subset of the file for the two days we are analysing.
filename="data/household_power_consumption.txt"
hpcdata<-read.csv.sql(filename,sep=";",sql='select * from file 
                      where Date="1/2/2007" OR Date="2/2/2007"')

#Convert the date and time variable to the right format, and class
format<-"%d/%m/%Y %H:%M:%S"
hpcdata$Date<-strptime(paste(hpcdata$Date,hpcdata$Time),format)

#open a png file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px",
    bg = "white")

#Draw histogram
hist(hpcdata$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)", ylab="Frequency", 
     xlim=range(0,6),ylim=c(0,1200),
     axes=FALSE,border="black",cex.axis=0.8,font.lab=2)

#Draw axis according to specification
axis(1,at=c(0,1,2,3,4,5,6),label=c("0","","2","","4","","6"))
axis(2,at=c(0,200,400,600,800,1000,1200),label=c("0","200","400","600","800","1000","1200"))

dev.off()