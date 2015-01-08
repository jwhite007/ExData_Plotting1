library(data.table)
ds <- fread('household_power_consumption.txt', na.strings = '?',
            skip = 66637, nrows = 2880)
setnames(ds, unlist(strsplit(readLines('household_power_consumption.txt',
                                       n = 1), ';')))
ds$Date_Time <- with(ds, as.POSIXct(paste(Date, Time),
                                    format = '%d/%m/%Y %H:%M:%S'))
png(file = 'plot2.png')
with(ds, plot(Date_Time, Global_active_power, type = 'l',
              ylab = 'Global Active Power (kilowats)', xlab = ''))
dev.off()
