
png("plot2.png", width=480, height=480)

pwrdata <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
pwrdata_filter <- (pwrdata$Date == '1/2/2007') | (pwrdata$Date == '2/2/2007')
pwrdata <- pwrdata[pwrdata_filter,]
pwrdata$datetime <- as.POSIXct(strptime(paste(pwrdata$Date, pwrdata$Time),'%d/%m/%Y %H:%M:%S'))
with(pwrdata, plot(datetime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)'))

dev.off()
