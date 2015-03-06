# README
# 1. Ensure that the data file 'household_power_consumption.txt'
#    is in the same place as the 'plot12.R' file
# 2. set the directory of the file plot2.R as your working directory
# 3. Run >   source("plot2.R") at the prompt
# 4. You will see the image plot2.png in your working directory.


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
    png(file="plot2.png",
        bg="transparent",
        width = 480,
        height = 480,
        units="px",
        pointsize = 12)
 
    # Now plot the graph. Note the type value set to 'line' only.
    plot(DateTime, 
        dat$Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)")

    # close the graphics device
    dev.off()
}