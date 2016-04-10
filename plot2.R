rm(list=ls())
ls()
#####Plot2
### Full data set
setwd("C:\\Users\\GWANG1\\Documents\\Wanggu2\\DataScience\\DS4_ExploratoryDataAnalysis\\exdata_data_household_power_consumption")
datf = read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?",  
                  nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datf$Date <- as.Date(datf$Date, format="%d/%m/%Y") 


### Formating dates 
dat <- subset(datf, Date >= "2007-02-01" & Date <= "2007-02-02") 
dtime <- paste(as.Date(dat$Date), dat$Time) 
dat$Dtime <- as.POSIXct(dtime) 


### Plot 2, save to file
png("plot2.png", width=480, height=480)
plot(dat$Global_active_power~dat$Dtime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
dev.off() 
