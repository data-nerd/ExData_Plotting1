# Exploratory Data Analysis
# Course Project 1: Base plotting
# Plot 1

# Read the data
filename <- 'e:/courses/Data Science/hw/household_power_consumption.txt'

# Limit the data for debugging. Set this to -1 to read all rows
debugRowLimit = -1

readings <- read.table(filename, header = TRUE, sep = ';',
    nrows = debugRowLimit, na.strings = c("?"),
    colClasses = c("character", "character",
    "numeric", "numeric", "numeric", "numeric",
    "numeric", "numeric", "numeric"))

# Subset to just 2007-02-01 and 2007-02-02
readings <- readings[readings$Date == '1/2/2007' |
    readings$Date == '2/2/2007',]

# Plot the data
hist(readings$Global_active_power,
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    col = "red")

# Save the plot to a 480x480 PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
