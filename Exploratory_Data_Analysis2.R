
library(ggplot2)
library(dplyr)

p1 <- ggplot(clean_data,aes(x=Satisfaction,y=No.of.Flights.p.a.)) + geom_point()
p1 <- p1+ stat_summary(fun.y=median, colour="darkred", geom="point", shape=18, size=5) + facet_grid(southeast ~ .)
p1

# Satisfaction vs X..of.Flight.with.other.Airlines
p2 <- ggplot(clean_data,aes(x=Satisfaction,y=X..of.Flight.with.other.Airlines)) + geom_point() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=5) + facet_grid(southeast ~ .)
p2

# Type of travel vs Satisfaction
fltmean <- clean_data %>% group_by(Type.of.Travel,southeast) %>% summarize(mean1 = mean(Satisfaction))
fltmean <- as.data.frame(fltmean)
p3 <- ggplot(fltmean,aes(x=Type.of.Travel,y=mean1)) + geom_point(size=5) + facet_grid(southeast ~ .)
p3

# Satisfaction vs No..of.other.Loyalty.Cards 
p4 <- ggplot(clean_data,aes(x=Satisfaction,y=No..of.other.Loyalty.Cards)) + geom_point() + facet_grid(southeast ~ .) + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=5)
p4
