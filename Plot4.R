plot4 <- function() {
    
    # Prior analysis of the load file identied that the data rows required for the dates required
    # started on row 66,637 and ended on row 69,517.  For efficiency, only these data rows are to
    # be imported
    initial_data = read.table( "household_power_consumption.txt", header = T, sep = ";",  
            skip = 66636, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", 
            "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
            "Sub_metering_2", "Sub_metering_3"))
    data_set = cbind( date_time = strptime( paste( initial_data$Date, initial_data$Time), 
            "%d/%m/%Y %H:%M:%S"), initial_data[ ,-c(1:2)])
    
    # Open the graphic device and plot the graph.  Closing the device afterwards
    png( filename = "plot4.png",  width = 480, height = 480)
    par( mfrow = c( 2, 2))
    plot( data_set$date_time, data_set$Global_active_power, type = "l", ylab = 
            "Global Active Power", xlab = "")
    plot( data_set$date_time, data_set$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot( data_set$date_time, data_set$Sub_metering_1, type = "l", xlab = "", 
            ylab = "Energy Sub metering")
    lines( data_set$date_time, data_set$Sub_metering_2, col = "red")
    lines( data_set$date_time, data_set$Sub_metering_3, col = "blue")
    legend( "topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c( "black", "red", "blue"), lty = 1, cex = 0.7)
    plot(data_set$date_time, data_set$Global_reactive_power, type = "l", xlab = "datetime",
            ylab = "Global_reactive_power")
    dev.off()
}