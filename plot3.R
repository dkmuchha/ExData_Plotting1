electric_con <- read.table('ExData_Plotting1/household_power_consumption.txt', header=TRUE, sep=';' , na.strings = c("?"))
electric_con <- electric_con[complete.cases(electric_con),]
electric_con$DateTime <- paste(electric_con[,1], electric_con[,2], sep= " ")
electric_con$DateTime <- strptime(electric_con$DateTime, "%d/%m/%Y %H:%M:%S")
electric_con <- subset(electric_con, select = -c(Date,Time))
electric_con_feb_2007 <- subset(electric_con, electric_con$DateTime >= as.POSIXlt("2007-02-01") & electric_con$DateTime < as.POSIXlt("2007-02-03"))

png(filename = "ExData_Plotting1/plot3.png",width = 480, height = 480, units = "px")
yrange<-range(c(electric_con_feb_2007$Sub_metering_1,electric_con_feb_2007$Sub_metering_2,electric_con_feb_2007$Sub_metering_3))
with(electric_con_feb_2007, plot(electric_con_feb_2007$DateTime, electric_con_feb_2007$Sub_metering_1, col='black',type='l',ylim=yrange, ylab="Energy sub metering", xlab=""))
par(new=T)
with(electric_con_feb_2007, plot(electric_con_feb_2007$DateTime, electric_con_feb_2007$Sub_metering_2, col='red',type='l',ylim=yrange, xlab="",ylab=""))
par(new=T)
with(electric_con_feb_2007, plot(electric_con_feb_2007$DateTime, electric_con_feb_2007$Sub_metering_3, col='blue',type='l',ylim=yrange, xlab="",ylab=""))
par(new=T)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue","red"))


dev.off()