
png("plot3.png", width=480, height=480)

pwrdata <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
pwrdata_filter <- (pwrdata$Date == '1/2/2007') | (pwrdata$Date == '2/2/2007')
pwrdata <- pwrdata[pwrdata_filter,]
pwrdata$datetime <- as.POSIXct(strptime(paste(pwrdata$Date, pwrdata$Time),'%d/%m/%Y %H:%M:%S'))
par('lty'=1)
#par('pch'='.')
with(pwrdata, plot(c(datetime,datetime), c(Sub_metering_1, Sub_metering_2), pch='.', type='l', ylab='Energy sub metering', xlab=''))
#with(pwrdata, plot(datetime, Sub_metering_1, type='l', ylab='Energy sub metering', xlab=''))
with(pwrdata, lines(datetime, Sub_metering_1, col='black'))
with(pwrdata, lines(datetime, Sub_metering_2, col='red'))
with(pwrdata, lines(datetime, Sub_metering_3, col='blue'))

legend('topright', lty=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
