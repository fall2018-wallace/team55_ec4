
library(ggplot2)
library(dplyr)

sat=clean_data

#convert the target variable to numeric
#to perfrom various EDA operations
sat$Satisfaction=as.numeric((as.character((t(sat$Satisfaction)))))

class(sat$Flight.date)
#covert the character to date format for FlightDate variable
sat$Flight.date=as.Date(sat$Flight.date, format="%m/%d/%Y")
class(sat$Flight.date)

#plot the graph for Satisfaction Vs FlightDate

fD=ggplot(sat, aes(x=Flight.date, y=Satisfaction))+facet_grid(.~southeast)+
  stat_summary(fun.y="mean",geom="point", color ="red", size =2)
fD=fD+ geom_line(aes(color = Flight.date))
fD=fD+ ggtitle("Flight Date")
fD

