## Read data
data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)

## Select subset of data for dates Feb 1 and Feb 2, 2007.
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

## Create unified Date & Time column.
data$DateTime <- paste(data$Date,data$Time,sep=" ")
data$DateTime <- strptime(data$DateTime,"%Y-%m-%d %H:%M:%S")

## Create base plot and output PNG file.
png(file="plot3.png",width=480,height=480)

par(mfrow=c(1,1))
with(data, {
        plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub reading",xlab="")
        lines(DateTime,Sub_metering_2,col="red")
        lines(DateTime,Sub_metering_3,col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        })

## Print plot to PNG file.
dev.off()