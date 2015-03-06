# README
# 1. Ensure that the data file 'household_power_consumption.txt'
#    is in the same place as the 'plot41.R' file
# 2. set te directory of the file plot4.R as your working directory
# 3. Run >   source("plot4.R") at the prompt
# 4. You will see the image plot4.png in your working directory.

# use this library for date time conversions
library(lubridate, warn.conflicts = FALSE, quietly = TRUE)


filename <- "household_power_consumption.txt"

if (!file.exists(filename)) {
    
    print("Data file not in the same dir as this R script")
    print("or working directory is not set correctly")
    
} else {
    
    # This is the code to read the entire file and then subset the required 
    # rows. But that's inefficient if we are going to do this often. Hence we
    # note that the required rows are 66637 to 69516 (including both rows).
    # 
    # all_data <- read.csv(filename, 
    #                header = TRUE, 
    #                sep=";", 
    #                stringsAsFactors=FALSE)
    
    # dat <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
    
    # read just the first row to get the column names
    first_row <- read.csv(filename, 
                          header = TRUE, 
                          sep=";", 
                          stringsAsFactors=FALSE,
                          nrows = 1)
    
    # now read the specific rows that we are interested in
    # 1-Feb-2007 and 2-Feb-2007
    dat <- read.csv(filename,
                    header = FALSE,
                    sep=";", 
                    stringsAsFactors=FALSE,
                    nrows = 2880,
                    skip = 66637)
    
    # set the column names in dat
    names(dat) <- names(first_row)
    
    # now concatenate the date and time strings and convert them into
    # datetime using a function in the library lubridate
    DateTime = dmy_hms(paste(dat$Date, dat$Time))

    # create a graphics device - mostly using the default values except
    # for background
    png(file="plot4.png",
        bg="transparent",
        width = 480,
        height = 480,
        units="px",
        pointsize = 12)
    
    # now setup the device for 2 rows, 2 columns, row-wise
    par(mfrow = c(2,2))
    
    ########## plot (1,1)
    plot(DateTime, 
         dat$Global_active_power,
         type = "l",
         xlab = "",
         ylab = "Global Active Power",
         col="black",
         yaxp = c(0,6,3))
    
    ########## plot (1,2)
    plot(DateTime, 
         dat$Voltage,
         type = "l",
         xlab = "datetime",
         ylab = "Voltage",
         col="black",
         yaxp = c(234, 246, 3))
    
    
    ########## plot (2,1)
    plot(DateTime, 
         dat$Sub_metering_1,
         type = "l",
         xlab = "",
         ylab = "Energy sub metering",
         col="black",
         yaxp = c(0,30,3))
    
    points(DateTime, 
           dat$Sub_metering_2,
           type = "l",
           col="red")
    
    points(DateTime, 
           dat$Sub_metering_3,
           type = "l",
           col="blue")
    
    # note the bty parameter to remove the box around the legend
    legend("topright", 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"),
           lty=c(1,1,1),  
           lwd=c(1,1,1),
           bty = "n")
    
    ########## plot (2,2)
    plot(DateTime, 
         dat$Global_reactive_power,
         type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power",
         col="black",
         yaxp = c(0,0.5,5))
    
    # reset it to the regular setting
    par(mfrow=c(1,1))
    
    # close the graphics device
    dev.off()
}