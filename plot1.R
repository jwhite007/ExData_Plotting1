library(data.table)
ds <- fread('household_power_consumption.txt', na.strings = '?', skip = 66637, nrows = 2880)
setnames(ds, unlist(strsplit(readLines('household_power_consumption.txt',
                                       n = 1), ';')))
png(file = 'plot1.png')
with(ds, hist(Global_active_power, xlab = 'Global Active Power (kilowats)',
              main = 'Global Active Power', col = 'red'))
dev.off()
