plot1 <- function() {
    
    #Read data set into memory
    data <-  read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt", 
                         header=TRUE, 
                         sep=";", 
                         na.strings = "?")
    
    #We will only be using data from the dates 1/2/2007 and 2/2/2007
    subset <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
    
    #You may find it useful to convert the Date and Time variables to Date/Time 
    # classes in R using the strptime()  and as.Date() functions.
    subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
    
    #Construct Plot
    hist(subset$Global_active_power
         , col="red"
         , main="Global Active Power"
         , xlab = "Global Active Power (kilowatts)")
    
    #Save plot to file
    dev.copy(png, file="plot1.png")
    dev.off()

}