library(data.table)
ds <- fread('household_power_consumption.txt', na.strings = '?',
            skip = 66637, nrows = 2880)
setnames(ds, unlist(strsplit(readLines('household_power_consumption.txt',
                                       n = 1), ';')))
ds$Date_Time <- with(ds, as.POSIXct(paste(Date, Time),
                                    format = '%d/%m/%Y %H:%M:%S'))
png(file = 'plot3.png')
with(ds, {
     plot(Date_Time, Sub_metering_1, type = 'l', xlab = '',
          ylab = 'Energy sub metering')
     lines(Date_Time, Sub_metering_2, col = 'red')
     lines(Date_Time, Sub_metering_3, col = 'blue')
     legend('topright', col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 2)
 }
 )
dev.off()
