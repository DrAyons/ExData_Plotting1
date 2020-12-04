## Plot uses data tibble from previous R file ("useful")

meter <- pivot_longer(useful, cols=c(Sub_metering_1, Sub_metering_2, 
                                     Sub_metering_3), names_to = "Submetering")


png(filename = "plot3.png")
with(meter,plot(Date_Time1,value,type = "n",ylab = "Energy sub metering",xlab =""))
with(meter, points(Date_Time1[Submetering=="Sub_metering_1"],
                   value[Submetering=="Sub_metering_1"], type = "l"))
with(meter, points(Date_Time1[Submetering=="Sub_metering_2"],
                   value[Submetering=="Sub_metering_2"], type = "l", col="red"))
with(meter, points(Date_Time1[Submetering=="Sub_metering_3"],
                   value[Submetering=="Sub_metering_3"], type = "l", col="blue"))


with(meter, legend("topright", legend = levels(factor(Submetering)),
                   pt.cex = 2.4, pch = "____",cex = 1.1, col = c("black", "red","blue")))
dev.off()
