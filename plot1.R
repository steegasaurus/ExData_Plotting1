
library(dplyr)

power_data <- read.table('household_power_consumption.txt', sep = ';', na.strings = '?')
names(power_data) <- power_data %>% slice(1) %>% unlist()
power_data <- slice(power_data, -1)
power_data$Date <- dmy(power_data$Date)
power_data$Time <- hms(power_data$Time)
power_data <- power_data[power_data$Date == '2007-02-01' | power_data$Date == '2007-02-02', ]
pow$Global_active_power <- as.numeric(pow$Global_active_power)

#Make histogram
hist(pow$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')