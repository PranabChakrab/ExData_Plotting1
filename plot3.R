# This assignment uses data from the UC Irvine Machine Learning Repository, 
# a popular repository for machine learning datasets. In particular, we will 
# be using the "Individual household electric power consumption Data Set" 
# taken from the following link -
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# This is the code for creating "Plot 3" which is a plot of
# "Energy sub metering" against the two day time period
#
# Libraries used are as follows
library(dplyr)
library(lubridate)

# Please keep the data text file "household_power_consumption.txt" in the same directory
# The following code reads the data
# The nrows argument is expected to make the reading faster
data <- read.table("household_power_consumption.txt", header=TRUE, nrows=2100000, sep=";")

# Convert the data in a form that can be used by the functions of 'dplyr' package
data <- tbl_df(data)

# Now filter and take only those rows that correspond to 2007-02-01 and 2007-02-02
d1 <- ymd("2007-02-01")
d2 <- ymd("2007-02-02")
subdata <- filter(data, (dmy(as.character(Date)) == d1) | (dmy(as.character(Date)) == d2))

# Now plot "Sub-metering_1"
plot(as.numeric(as.character(subdata$Sub_metering_1)), 
     type="l", xaxt="n", xlab = "", ylab = "Energy sub metering", 
     ylim=c(0,38), cex.axis = 0.7, cex.lab = 0.7)

# Superimpose the next plot on the same plot
par(new=TRUE)

# Now plot "Sub_metering_2"
plot(as.numeric(as.character(subdata$Sub_metering_2)), 
     type="l", xaxt="n", yaxt="n", xlab = "", ylab ="", col="red", ylim=c(0,38))

# Superimpose the next plot on the same plot
par(new=TRUE)

#Now plot "Sub_metering_3"
plot(subdata$Sub_metering_3, 
     type="l", xaxt="n", yaxt="n", xlab = "", ylab ="", col="blue", ylim=c(0,38))

# The x-axis tick mark labels are set as follows
axis(1, at=c(1, 1441, 2880),labels=c("Thu", "Fri", "Sat"), cex.axis = 0.7)

# Put the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       pch="-", cex = 0.5, pt.cex = 0.5, col = c("black", "red", "blue"), 
       lwd = 3, x.intersp = 1)

# Now save the picture in a png file
dev.copy(png, file="plot3.png")
dev.off()