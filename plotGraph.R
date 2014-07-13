source('dldata.R')

plot1 <- function() {
    tbl <- prepareData()
    png(filename = "plot1.png", width = 480, height = 480, units = "px")
    hist(tbl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    dev.off()
}
    
plot2 <- function() {
    tbl <- prepareData()
    
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    plot(tbl$DateTime, tbl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}

plot3 <- function() {
    tbl <- prepareData()
    
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(tbl$DateTime, tbl$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(tbl$DateTime, tbl$Sub_metering_2, type="l", col="red")
    lines(tbl$DateTime, tbl$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
    dev.off()
}

plot4 <- function() {
    tbl <- prepareData()
    
    png(filename = "plot4.png", width = 480, height = 480, units = "px")
    
    par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
    with(tbl, {
        plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
        plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
        
        cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
        
        plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
    })    
    dev.off()
}

plot1();
plot2();
plot3();
plot4();
