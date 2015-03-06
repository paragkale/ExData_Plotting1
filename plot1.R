# README
# 1. Ensure that the data file 'household_power_consumption.txt'
#    is in the same place as the 'plot1.R' file
# 2. set the directory of the file plot1.R as your working directory
# 3. Run >   source("plot1.R") at the prompt
# 4. You will see the image plot1.png in your working directory.

filename <- "household_power_consumption.txt"

if (!file.exists(filename)) {
    
    print("Data folder not in the same dir as this R script")
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
    
    # create a graphics device - mostly using the default values except 
    # for background
    png(file="plot1.png", 
        bg="transparent",
        width = 480,
        height = 480,
        units="px",
        pointsize = 12)
    
    # Now plot the graph.
    hist(as.numeric(dat$Global_active_power), 
         main = "Global Active Power",
         freq = TRUE, 
         col="red",
         xlab = "Global Active Power(kilowatts)", 
         ylab = "Frequency",
         include.lowest = TRUE
    )
    
    # close the graphics device
    dev.off()
}
