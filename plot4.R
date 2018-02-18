# setup
library(dplyr)

# read data
raw.df <- read.csv2(file="fixtures/household_power_consumption_filtered.txt", sep=";", dec=".", header=TRUE, na.strings=c("?"))

# clean up dates
df <- raw.df %>% mutate(dt = as.POSIXct(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))) %>% select(-c(Date, Time))

par(mfcol=c(2,2))

# plot 2
with(df, plot(x=dt, y=Global_active_power, ylab="Global Active Power (kilowats)", type="l"))

# plot 3
with(df, plot(x=dt, y=Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(df, lines(x=dt, y=Sub_metering_1, type="l"))
with(df, lines(x=dt, y=Sub_metering_2, type="l", col="red"))
with(df, lines(x=dt, y=Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, box.lty=0)

# plot 3
with(df, plot(x=dt, y=Voltage, xlab="datetime", type="l"))

# plot 4
with(df, plot(x=dt, y=Global_reactive_power, xlab="datetime", type="l"))

# save plot
dev.copy(png, "plot4.png", width=480, height=480, res=45)
dev.off()