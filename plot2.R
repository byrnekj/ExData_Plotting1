plot2 <- function() {
    
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
         , subset$Global_active_power
         , type = "l"
         , ylab = "Global Active Power (kilowatts)"
         , xlab = "")
    
    #Save plot to file
    dev.copy(png, file="plot2.png")
    dev.off()

}