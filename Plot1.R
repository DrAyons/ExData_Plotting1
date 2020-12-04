library(tidyverse)
househ <- read_csv2("household_power.txt")
useful <- filter(househ, Date=="1/2/2007" | Date=="2/2/2007")
useful$Global_active_power <- as.numeric(useful$Global_active_power)
png(filename = "plot1.png")
with(useful, hist(Global_active_power, col = "red", 
                  xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
