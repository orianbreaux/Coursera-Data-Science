## QUESTION 3

# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999–2008 for Baltimore City? Which have seen increases in
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
# answer this question.

# Load necessary libraries
library(plyr)
library(reshape2)
library(ggplot2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")

# Filter emissions data by Baltimore City
NEI <- NEI[NEI$fips == "24510",]

# Determine total PM2.5 emission by year in Baltimore City by source type
NEI_byYear <- melt(NEI, c("year","type"), measure=c("Emissions"), na.rm=TRUE)
NEI_byYear <- dcast(NEI_byYear, year+type~variable, sum)

# Create ggplot2 plot and output PNG file.
png(file="plot3.png",width=600,height=600)

par(mfrow=c(1,1))
print(qplot(year,Emissions,
            data=NEI_byYear,
            geom="line",
            color=type,
            main=expression('Total emissions from PM'[2.5]* ' in Baltimore City by source type'),
            ylab="Total Emissions (tons)",
            xlab="year"))
dev.off()