# Exploratory Data Analysis
# Course Project 1: Base plotting
# Plot 3

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

par(cex = 0.8)

# Plot the data
with(readings,
    {
        plot(datetime,
            Sub_metering_1,
            type = "l", col = "black",
            main = "", xlab = "", ylab = "Energy sub metering")

        legend(x = "topright",
               col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1)

        lines(datetime, Sub_metering_2, col = "red")
        
        lines(datetime, Sub_metering_3, col = "blue")
    }
)

# Save the plot to a 480x480 PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
