# README
# 1. Ensure that the data file 'household_power_consumption.txt'
#    is in the same place as the 'plot3.R' file
# 2. set the directory of the file plot3.R as your working directory
# 3. Run >   source("plot3.R") at the prompt
# 4. You will see the image plot3.png in your working directory.

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
                          na.strings = "?",
                          stringsAsFactors=FALSE,
                          nrows = 1)
    
    # now read the specific rows that we are interested in
    # 1-Feb-2007 and 2-Feb-2007
    dat <- read.csv(filename,
                    header = FALSE,
                    sep=";", 
                    na.strings = "?",
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
    png(file="plot3.png",
        bg="transparent",
        width = 480,
        height = 480,
        units="px",
        pointsize = 12)
    
    # plot the first value
    plot(DateTime, 
         dat$Sub_metering_1,
         type = "l",
         xlab = "",
         ylab = "Energy sub metering",
         col="black")
    
    # plot the second value
    points(DateTime, 
           dat$Sub_metering_2,
           type = "l",
           col="red")
    
    # plot the third value
    points(DateTime, 
           dat$Sub_metering_3,
           type = "l",
           col="blue")
    
    # now draw the legend
    legend("topright", 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
           col=c("black", "red", "blue"),
           lty=c(1,1,1),  
           lwd=c(1,1,1) )
    
    # close the graphics device
    dev.off()
}