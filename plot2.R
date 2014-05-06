# Exploratory Data Analysis
# Course Project 1: Base plotting
# Plot 2

# Read the data
filename <- 'e:/courses/Data Science/hw/household_power_consumption.txt'

# Limit the data for debugging. Set this to -1 to read all rows
debugRowLimit = -1

readings <- read.table(filename, header = TRUE, sep = ';',
    nrows = debugRowLimit, na.strings = c("?"),
    colClasses = c("character", "character",
    "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Transform the data (dates and missing values)
datetime <- with(readings, strptime(paste(Date, Time),
    format = "%d/%m/%Y %H:%M:%S"))

readings <- cbind(datetime, readings)

# Subset to just 2007-02-01 and 2007-02-02
readings <- readings[readings$Date == '1/2/2007' |
    readings$Date == '2/2/2007',]

# Plot the data
plot(readings$datetime,
     readings$Global_active_power,
     type = "l", col = "black",
     main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

# Save the plot to a 480x480 PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
