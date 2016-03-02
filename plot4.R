plot4 <- function() {
    
    #Read data set into memory
    data <-  read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt", 
                        header=TRUE, 
                        sep=";", 
                        na.strings = "?")
    
    #We will only be using data from the dates 1/2/2007 and 2/2/2007
    subset <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

    #create date/time column to display weekday on x axis
    subset$datetime <- paste(subset$Date, subset$Time, sep=" ")   
    subset$datetime <- strptime(subset$datetime, "%d/%m/%Y %H:%M:%S")
    
    #create 2 by 2 plot palette
    par(mfrow = c(2, 2))
    
    #First Plot (top left)
    plot(subset$datetime
         , subset$Global_active_power
         , type = "l"
         , ylab = "Global Active Power (kilowatts)"
         , xlab = "")
    
    #Second Plot (top right)
    plot(subset$datetime
         , subset$Voltage
         , type = "l"
         , ylab = "Voltage"
         , xlab = "datetime")
    
    #Third Plot (bottom left)
    plot(subset$datetime
         , subset$Sub_metering_1
         , type = "l"
         , ylab = "Energy sub metering"
         , xlab = ""
         , col = "black")
    
        #add second line
        lines(subset$datetime
             , subset$Sub_metering_2
             , col = "red")
    
        #add third line
        lines(subset$datetime
             , subset$Sub_metering_3
             , col = "blue")
    
       #add legend
        legend("topright"
              , lty = 1
              , col = c("black","red","blue")
              , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
              , bty = "n")
    
    #Fourth plot (bottom right)
    plot(subset$datetime
         , subset$Global_reactive_power
         , type = "l"
         , ylab = "Global_reactive_power"
         , xlab = "datetime")
        
    #Save plot to file
    dev.copy(png, file="plot4.png")
    dev.off()

}