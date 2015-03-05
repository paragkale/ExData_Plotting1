dat <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", 
                header = TRUE, 
                sep=";", 
                stringsAsFactors=FALSE)

dat2 <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot1.png", 
    bg="transparent",
    width = 480,
    height = 480,
    units="px",
    pointsize = 12)

hist(as.numeric(dat2$Global_active_power), 
     main = "Global Active Power",
     freq = TRUE, 
     col="red",
     xlab = "Global Active Power(kilowatts)", 
     ylab = "Frequency",
     include.lowest = TRUE
     )

dev.off()
