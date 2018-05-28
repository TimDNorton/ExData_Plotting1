plot1<-function(){
    png1<-fread("household_power_consumption.txt")
    png1[png1=="?"]<-NA
    png1<-na.omit(png1)
    png1<-png1[png1$Date %in% c("1/2/2007", "2/2/2007"), ]
    png1$Date_Time<- paste(png1$Date, png1$Time)
    png1$Date_Time<-as.POSIXct(png1$Date_Time,format="%d/%m/%Y %H:%M:%S")
    
    cols.num <- c("Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    ind <- match(cols.num, names(png1))
    
    for (i in seq_along(ind)) {
        set(png1, NULL, ind[i], as.numeric(png1[[ind[i]]]))
    }    
    png(filename="plot1.png", width=480, height=480)
    hist(png1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    dev.off()
    }