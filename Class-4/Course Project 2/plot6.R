## QUESTION 6

# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips ==
# "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?

# Load necessary libraries
library(plyr)
library(reshape2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")

# Filter emissions data by motor vehicle type in Baltimore City or LA County
NEI <- NEI[NEI$type == "ON-ROAD" & (NEI$fips == "24510" | NEI$fips == "06037"),]

# Determine total PM2.5 emission by year in Baltimore City and LA County by motor vehicle type
NEI_byYear <- melt(NEI, c("year","fips"), measure=c("Emissions"), na.rm=TRUE)
NEI_byYear <- dcast(NEI_byYear, year+fips~variable, sum)

# Create ggplot2 plot and output PNG file.
png(file="plot6.png",width=600,height=600)

par(mfrow=c(1,1))
print(qplot(year,Emissions,
            data=NEI_byYear,  
            color=fips,
            geom="line",
            main=expression('Total emissions from coal combustion-related sources in U.S'),
            ylab="Total Emissions (tons)",
            xlab="year"))
dev.off()