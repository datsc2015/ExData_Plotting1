rm(list=ls())
ls()
### Full data set
 setwd("C:\\Users\\GWANG1\\Documents\\Wanggu2\\DataScience\\DS4_ExploratoryDataAnalysis\\exdata_data_household_power_consumption")
 datf = read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?",  
                               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
 datf$Date <- as.Date(datf$Date, format="%d/%m/%Y") 
 dat <- subset(datf, Date >= "2007-02-01" & Date <= "2007-02-02") 

 ### Formating dates 
 dtime <- paste(as.Date(dat$Date), dat$Time) 
 dat$Dtime <- as.POSIXct(dtime) 
  
 ### Plot 1, save to file
 png("plot1.png", width=480, height=480)
 hist(dat$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
  
 #dev.copy(png, file="plot1.png", height=480, width=480) 
 dev.off() 
