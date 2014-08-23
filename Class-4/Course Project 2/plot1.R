## QUESTION 1

# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Load necessary libraries
library(plyr)
library(reshape2)

# Read data
NEI <- readRDS("summarySCC_PM25.rds")

# Determine total PM2.5 emission by year in U.S.
NEI_byYear <- melt(NEI, c("year"), measure=c("Emissions"), na.rm=TRUE)
NEI_byYear <- dcast(NEI_byYear, year~variable, sum)

# Create base plot and output PNG file.
png(file="plot1.png",width=600,height=600)

yrange <- c(min(NEI_byYear$Emissions),max(NEI_byYear$Emissions))
ticks <- pretty(yrange)
labels <- format(ticks, big.mark=",", scientific=FALSE)

par(mfrow=c(1,1))
with(NEI_byYear,
     plot(year, Emissions,
          type="l",
          yaxt="n",
          ylim=yrange,
          main=expression('Total emissions from PM'[2.5]* ' from all sources in U.S.'),
          ylab="Total Emissions (tons)",
          xlab="year",
          col="red",
          pch=19))
axis(2, at = ticks, labels=labels, cex.axis=0.7)
dev.off()