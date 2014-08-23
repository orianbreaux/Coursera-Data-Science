## QUESTION 5

# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City?

# Load necessary libraries
library(plyr)
library(reshape2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")

# Filter emissions data by motor vehicle type in Baltimore City
NEI <- NEI[NEI$type == "ON-ROAD" & NEI$fips == "24510",]

# Determine total PM2.5 emission by year in Baltimore City by motor vehicle type
NEI_byYear <- melt(NEI, c("year"), measure=c("Emissions"), na.rm=TRUE)
NEI_byYear <- dcast(NEI_byYear, year~variable, sum)

# Create ggplot2 plot and output PNG file.
png(file="plot5.png",width=600,height=600)

par(mfrow=c(1,1))
print(qplot(year,Emissions,
            data=NEI_byYear,
            geom="line",
            main=expression('Total emissions from coal combustion-related sources in U.S'),
            ylab="Total Emissions (tons)",
            xlab="year"))
dev.off()