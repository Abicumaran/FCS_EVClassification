
library(ggplot2)
library(tidyr)
library(plyr)
library(dplyr)
#library(reshape2)
#library(cowplot)
library("scales")
#library(ggsci)


# set working directory, where FCS files are stored

setwd("C:/Users/15145/Desktop/FCS1")

# plug in filename
file <- "420_FCS_30s_001.fcs"

#import data
data <- read.delim(file, header = FALSE, row.names=NULL)




#
# The following is hard-coded with regards to Zeiss FCS files
# and how they are weirdly imported in R
# 
#



# get rows of count rate data

countstr1 <- "CountRateArray "
countstr2 <- "CorrelationArraySize"


l <- lapply(colnames(data), function(x) grep(countstr1, data[,x]))
countrateStart <- as.numeric(unlist(l[2])) + 1

l <- lapply(colnames(data), function(x) grep(countstr2, data[,x]))
countrateEnd <- as.numeric(unlist(l[2])) - 1



# get rows of correlation data

corrstr1 <- "CorrelationArray "
corrstr2 <- "PhotonCountHistogramArraySize "


l <- lapply(colnames(data), function(x) grep(corrstr1, data[,x]))
correlationStart <- as.numeric(unlist(l[2])) + 1

l <- lapply(colnames(data), function(x) grep(corrstr2, data[,x]))
correlationEnd <- as.numeric(unlist(l[2])) -1 



# build a proper table with countrate data, convert strings to numerics

countrateData <- data[countrateStart:countrateEnd,]

countrateTable <- NULL
countrateTable$Time <- subset(countrateData$V2, countrateData$V2 != "")
countrateTable$Counts <- subset(countrateData$V1, countrateData$V1 != "")
countrateTable <- data.frame(countrateTable)

countrateTable[] <- lapply(countrateTable, function(x) as.numeric(as.character(x)))





# build a proper table with correlation data, convert strings to numerics

correlationData <- data[correlationStart:correlationEnd,]

correlationTable <- NULL
correlationTable$Time <- subset(correlationData$V2, correlationData$V2 != "")
correlationTable$Corr<- subset(correlationData$V1, correlationData$V1 != "")
correlationTable <- data.frame(correlationTable)
correlationTable[] <- lapply(correlationTable, function(x) as.numeric(as.character(x)))



# Plotting using ggplot package, log10 scale might require scales package
# The data we want to use here are in countrateTable and correlationTable 

ggplot(countrateTable, aes(x = Time, y = Counts))+
  geom_line(group = 1)+
  xlab("Time (s)")+
  ylab("Countrate (Hz)")


ggplot(correlationTable, aes(x = Time, y = Corr))+
  geom_line(group = 1)+
  scale_x_log10() + 
  xlab("Time lag (s)")+
  ylab("G_corr_")
 

