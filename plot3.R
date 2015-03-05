dat <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", 
                header = TRUE, 
                sep=";", 
                stringsAsFactors=FALSE)

dat2 <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
DateTime = dmy_hms(paste(dt2$Date, dat2$Time)))


png(file="plot3.png",
    bg="transparent",
    width = 480,
    height = 480,
    units="px",
    pointsize = 12)

plot(DateTime1, 
     dat2$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col="black")

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

dev.off()