dat <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", 
                header = TRUE, 
                sep=";", 
                stringsAsFactors=FALSE)

dat2 <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
DateTime = dmy_hms(paste(dt2$Date, dat2$Time)))


png(file="plot2.png",
    bg="transparent",
    width = 480,
    height = 480,
    units="px",
    pointsize = 12)

plot(DateTime1, 
     dat2$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()