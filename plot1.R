# setup
library(dplyr)

# read data
raw.df <- read.csv2(file="fixtures/household_power_consumption_filtered.txt", sep=";", dec=".", header=TRUE, na.strings=c("?"))

# clean up dates
df <- raw.df %>% mutate(dt = as.POSIXct(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))) %>% select(-c(Date, Time))

# plot
with(df, hist(x=Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowats)"))

# save plot
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()