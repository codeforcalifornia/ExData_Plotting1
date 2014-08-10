
png("plot1.png", width=480, height=480)

pwrdata <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
pwrdata_filter <- (pwrdata$Date == '1/2/2007') | (pwrdata$Date == '2/2/2007')
pwrdata <- pwrdata[pwrdata_filter,]
hist(pwrdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.off()
