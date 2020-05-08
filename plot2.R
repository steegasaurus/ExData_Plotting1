#Plot 2

#Load libraries
library(dplyr)
library(lubridate)

#Read in data
power_data <- read.table('household_power_consumption.txt', sep = ';', 
                         na.strings = '?')

#Fix column names
names(power_data) <- power_data %>% slice(1) %>% unlist()
power_data <- slice(power_data, -1)

#Set Date data to Date class to make it easier to work with
power_data$Date <- dmy(power_data$Date)
power_data$Time <- hms(power_data$Time)
power_data <- power_data[power_data$Date == '2007-02-01' | power_data$Date == 
                           '2007-02-02', ]

#Fix class of data
power_data$Global_active_power <- as.numeric(power_data$Global_active_power)

#Set graphics device to new png
png('plot2.png')

#Create plot and line
plot(power_data$Date + power_data$Time, power_data$Global_active_power, type = 'n',
     xlab = '', ylab = 'Global Active Power (kilowatts)')
lines(power_data$Date + power_data$Time, power_data$Global_active_power)

#Close graphics device
dev.off()