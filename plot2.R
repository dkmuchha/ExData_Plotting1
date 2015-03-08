electric_con <- read.table('ExData_Plotting1/household_power_consumption.txt', header=TRUE, sep=';' , na.strings = c("?"))
electric_con <- electric_con[complete.cases(electric_con),]
electric_con$DateTime <- paste(electric_con[,1], electric_con[,2], sep= " ")
electric_con$DateTime <- strptime(electric_con$DateTime, "%d/%m/%Y %H:%M:%S")
electric_con <- subset(electric_con, select = -c(Date,Time))
electric_con_feb_2007 <- subset(electric_con, electric_con$DateTime >= as.POSIXlt("2007-02-01") & electric_con$DateTime < as.POSIXlt("2007-02-03"))

png(filename = "ExData_Plotting1/plot2.png",width = 480, height = 480, units = "px")
with(electric_con_feb_2007, plot(electric_con_feb_2007$DateTime, electric_con_feb_2007$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab=''))
dev.off()