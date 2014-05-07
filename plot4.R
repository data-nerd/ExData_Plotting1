# Exploratory Data Analysis
# Course Project 1: Base plotting
# Plot 4

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

# Output to a PNG file. Do so directly because plotting to the screen and then
#  saving to a file distorts the image (most noticably the legend is truncated)
png("plot4.png", width = 480, height = 480)

# 2 x 2 plots
par(mfrow = c(2, 2))

# Plot the data
with(readings,
    {
        # Top left plot
        plot(datetime,
            Global_active_power,
            type = "l", col = "black",
            main = "", xlab = "", ylab = "Global Active Power")

        # Top right plot
        plot(datetime,
             Voltage,
             type = "l", col = "black",
             main = "", xlab = "datetime", ylab = "Voltage")

        # Lower left plot
        plot(datetime,
             Sub_metering_1,
             type = "l", col = "black",
             main = "", xlab = "", ylab = "Energy sub metering")

        legend(x = "topright",
               col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1, bty = "n")

        lines(datetime, Sub_metering_2, col = "red")
        
        lines(datetime, Sub_metering_3, col = "blue")

        # Lower right plot
        plot(datetime,
             Global_reactive_power,
             type = "l", col = "black",
             main = "", xlab = "datetime")
    }
)

dev.off()
