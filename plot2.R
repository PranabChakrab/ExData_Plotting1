# This assignment uses data from the UC Irvine Machine Learning Repository, 
# a popular repository for machine learning datasets. In particular, we will 
# be using the "Individual household electric power consumption Data Set" 
# taken from the following link -
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# This is the code for creating "Plot 2" which is a plot of
# "Global Active Power (kilowatts)" against the two day time period
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

# Now plot "Global Active Power (kilowatts)"
plot(as.numeric(as.character(subdata$Global_active_power)), 
     type="l", xaxt="n", xlab = "", ylab = "Global Active Power (kilowatts)")

# The x-axis tick mark labels are set as follows
axis(1, at=c(1, 1441, 2880),labels=c("Thu", "Fri", "Sat"))

# Now save the picture in a png file
dev.copy(png, file="plot2.png")
dev.off()