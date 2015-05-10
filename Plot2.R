household_power_consumption <- read.csv("C:/Users/user/Dropbox/coursera/exploratory data/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", na.string="?")
shortdata<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ]
shortdata$DateTime <- as.POSIXct(paste(shortdata$Date, shortdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
z<-shortdata$Global_active_power
png(filename="plot2.png", width=480,height=480)
plot(shortdata$DateTime, z, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
