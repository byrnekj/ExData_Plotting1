plot3 <- function() {
    
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
        
    #Construct Plot
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
           , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #Save plot to file
    dev.copy(png, file="plot3.png")
    dev.off()

}