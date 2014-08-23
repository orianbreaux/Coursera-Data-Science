## QUESTION 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

# Load necessary libraries
library(plyr)
library(reshape2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")

# Filter emissions data by Baltimore City
NEI <- NEI[NEI$fips == "24510",]

# Determine total PM2.5 emission by year in Baltimore City
NEI_byYear <- melt(NEI, c("year"), measure=c("Emissions"), na.rm=TRUE)
NEI_byYear <- dcast(NEI_byYear, year~variable, sum)

# Create base plot and output PNG file.
png(file="plot2.png",width=600,height=600)

yrange <- c(min(NEI_byYear$Emissions),max(NEI_byYear$Emissions))
ticks <- pretty(yrange)
labels <- format(ticks, big.mark=",", scientific=FALSE)

par(mfrow=c(1,1))
with(NEI_byYear,
     plot(year, Emissions,
          type="l",
          yaxt="n",
          ylim=yrange,
          main=expression('Total emissions from PM'[2.5]* ' in Baltimore City'),
          ylab="Total Emissions (tons)",
          xlab="year",
          col="red",
          pch=19))
axis(2, at = ticks, labels=labels, cex.axis=0.7)
dev.off()