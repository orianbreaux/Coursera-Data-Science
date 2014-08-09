## Read data
data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)

## Select subset of data for dates Feb 1 and Feb 2, 2007.
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

## Create unified Date & Time column.
data$DateTime <- paste(data$Date,data$Time,sep=" ")
data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S")

## Create base plot and output PNG file.
png(file="plot1.png",width=480,height=480)

par(mfrow=c(1,1))
hist(as.numeric(data$Global_active_power), col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()