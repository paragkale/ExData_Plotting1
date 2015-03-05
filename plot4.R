dat <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", 
                header = TRUE, 
                sep=";", 
                stringsAsFactors=FALSE)

dat2 <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
DateTime = dmy_hms(paste(dt2$Date, dat2$Time)))


png(file="plot4.png",
    bg="transparent",
    width = 480,
    height = 480,
    units="px",
    pointsize = 12)

par(mfrow = c(2,2))

########## plot (1,1)
plot(DateTime1, 
     dat2$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power",
     col="black",
     yaxp = c(0,6,3))

######## plot (1,2)
plot(DateTime1, 
     dat2$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     col="black",
     yaxp = c(234, 246, 3))


######## plot (2,1)
plot(DateTime1, 
     dat2$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col="black",
     yaxp = c(234,246,3))

points(DateTime1, 
       dat2$Sub_metering_2,
       type = "l",
       col="red"
)

points(DateTime1, 
       dat2$Sub_metering_3,
       type = "l",
       col="blue"
)

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       col=c("black", "red", "blue"),
       lty=c(1,1,1),  
       lwd=c(1,1,1)
)

################ plot (2,2)
plot(DateTime1, 
     dat2$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     col="black",
     yaxp = c(0,0.5,5))

par(mfrow=c(1,1))

dev.off()