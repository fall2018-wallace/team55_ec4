
library(ggplot2)
library(dplyr)
setwd("C:/Users/Eashani/Desktop/intro to DS/project")
clean_data <- read.csv("satisfactionSurvey.csv")
# 

clean_data$Satisfaction <- as.numeric(as.character(t(clean_data$Satisfaction)))

mean(clean_data$Satisfaction,na.rm=TRUE)
# mean = 3.37941
# replace the NA values with mean
# the NA values are replaces with 3.5 instead of the actual value of the mean because 
# satisfaction is a factor variable and 3.5 is the closest value
clean_data$Satisfaction[is.na(clean_data$Satisfaction)] <- 3.5

clean_data$southeast<-as.factor(trimws(clean_data$Airline.Name)=='Southeast Airlines Co.')
# Satisfaction vs No.of.Flights.p.a.
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
