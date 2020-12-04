## Plot uses data tibble from previous R files ("useful" and "meter")

png(filename = "plot4.png")
par(mfrow=c(2,2))

with(useful, plot(Date_Time1,Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))
with(useful, plot(Date_Time1,Voltage, type = "l", xlab = "Datetime",ylab = "Voltage"))
with(meter,plot(Date_Time1,value,type = "n",ylab = "Energy sub metering",xlab =""))
with(meter, points(Date_Time1[Submetering=="Sub_metering_1"],
                   value[Submetering=="Sub_metering_1"], type = "l"))
with(meter, points(Date_Time1[Submetering=="Sub_metering_2"],
                   value[Submetering=="Sub_metering_2"], type = "l", col="red"))
with(meter, points(Date_Time1[Submetering=="Sub_metering_3"],
                   value[Submetering=="Sub_metering_3"], type = "l", col="blue"))


with(meter, legend("topright", legend = levels(factor(Submetering)),
                   pt.cex = 2.4, pch = "____",cex = 1.1, col = c("black", "red","blue")))
with(useful, plot(Date_Time1, Global_reactive_power,type = "l",xlab = "Datetime"))
dev.off()