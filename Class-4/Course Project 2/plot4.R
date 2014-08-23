## QUESTION 4

# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?

# Load necessary libraries
library(plyr)
library(reshape2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Find SCC codes that correspond to coal combustion-related sources
SCC <- SCC[grep("Coal", SCC$Short.Name),]
SCC <- SCC[grep("Comb", SCC$Short.Name),]

# Filter emissions data by SCC codes of coal combustion-related sources
NEI <- NEI[NEI$SCC %in% SCC$SCC,]

# Determine total PM2.5 emission by year in U.S. by coal combustion-related sources
NEI_byYear <- melt(NEI, c("year"), measure=c("Emissions"), na.rm=TRUE)
NEI_byYear <- dcast(NEI_byYear, year~variable, sum)

# Create ggplot2 plot and output PNG file.
png(file="plot4.png",width=600,height=600)

par(mfrow=c(1,1))
print(qplot(year,Emissions,
            data=NEI_byYear,
            geom="line",
            main=expression('Total emissions from coal combustion-related sources in U.S'),
            ylab="Total Emissions (tons)",
            xlab="year"))
dev.off()