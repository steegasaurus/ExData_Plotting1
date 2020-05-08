#Plot 3

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
png('plot3.png')

#Create plot and line
plot(power_data$Date + power_data$Time, power_data$Sub_metering_1, type = 'n',
     xlab = '', ylab = 'Energy sub metering')
lines(power_data$Date + power_data$Time, power_data$Sub_metering_1)
lines(power_data$Date + power_data$Time, power_data$Sub_metering_2, col = 'red')
lines(power_data$Date + power_data$Time, power_data$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 
        'Sub_metering_2'), lty = c(1,1), lwd = c(2, 2, 2), col = c('black', 'red', 'blue'))

#Close graphics device
dev.off()
