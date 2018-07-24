library(plyr)
library(ggplot2)
d = read.csv('Parking_Tags_Data_2016_1.csv')
d <- subset(d, province == "ON")
d = count(d, 'infraction_description')
d = d[order(d$freq, decreasing=TRUE), ]
d = head(d, n = 52)
descriptions = head(d$infraction_description, n = 52)
frequency = head(d$freq, n = 52)
ggplot(d, aes(descriptions, frequency)) +
    geom_bar(stat = 'identity') +
    ggtitle('Histogram of Infraction Description') +
    theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) + 
    coord_cartesian(ylim = c(0, 150000)) + 
    theme(plot.margin = unit(c(1,1,1,1), "cm"))

