rm(list=ls())
ls()

############plot4
#### Full data set# Getting full datset 
setwd("C:\\Users\\GWANG1\\Documents\\Wanggu2\\DataScience\\ExploratoryDataAnalysis\\exdata_data_household_power_consumption")
datf = read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?",  
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datf$Date <- as.Date(datf$Date, format="%d/%m/%Y") 
### Formating dates
dat <- subset(datf, Date >= "2007-02-01" & Date <= "2007-02-02") 
dtime <- paste(as.Date(dat$Date), dat$Time) 
dat$Dtime <- as.POSIXct(dtime) 

### Plot 4, save to file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 

with(dat, { 
        plot(Global_active_power~Dtime, type="l",  ylab="Global Active Power (kilowatts)", xlab="") 
        plot(Voltage~Dtime, type="l",   ylab="Voltage (volt)", xlab="") 
        plot(Sub_metering_1~Dtime, type="l",  ylab="Global Active Power (kilowatts)", xlab="") 
        lines(Sub_metering_2~Dtime,col='Red') 
        lines(Sub_metering_3~Dtime,col='Blue') 
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
        plot(Global_reactive_power~Dtime, type="l",   ylab="Global Rective Power (kilowatts)",xlab="")  }) 

dev.off() 
