household_power_consumption <- read.csv("C:/Users/user/Dropbox/coursera/exploratory data/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", na.string="?")
shortdata<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ]
shortdata$DateTime <- as.POSIXct(paste(shortdata$Date, shortdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
z<-shortdata$Global_active_power

png(filename="Plot4.png", width=480, height=480)

   par(mfrow=c(2,2)) 

    plot(shortdata$DateTime, z, type="l", xlab="", ylab="Global Active Power")

    plot(shortdata$DateTime, shortdata$Voltage, type="l", xlab="datetime", 
         ylab="Voltage")


    plot(shortdata$DateTime, shortdata$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
     lines(shortdata$DateTime, shortdata$Sub_metering_2, col="red")
      lines(shortdata$DateTime, shortdata$Sub_metering_3, col="blue")
     legend("topright",lty=1,cex=0.7, pt.lwd=0.1, col=c("black", "red", "blue"), 
          legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="o")


    plot(shortdata$DateTime, shortdata$Global_reactive_power, type="l", 
        xlab="datetime", ylab="Global_reactive_power")

    dev.off()
