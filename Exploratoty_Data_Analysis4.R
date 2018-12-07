
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

#our major concentration is on southeast airline 
sat$southeast<-as.factor(trimws(sat$Airline.Name)=='Southeast Airlines Co.')

#plot the graph for Satisfaction Vs FlightDate
fD=ggplot(sat, aes(x=Flight.date, y=Satisfaction))+facet_grid(.~southeast)+
 stat_summary(fun.y="mean",geom="point", size =2)+scale_fill_grey() + theme_classic()
fD=fD+ geom_line()
fD=fD+ ggtitle("Flight Date")
fD
#as plotting the whole date has no meaning,
#plot it with day off the week_days
sat$week_days=weekdays(sat$Flight.date)
#day of the month is already present as a variable
#the spread is more for southeast Airlines
#also few values fall near Satisfaction 3 and below

fD1=ggplot(sat, aes(x=week_days, y=Satisfaction))+facet_grid(.~southeast)+
  stat_summary(fun.y="mean",geom="point",size =2)+scale_fill_grey() + theme_classic()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
fD1=fD1+ geom_count()
fD1=fD1+ ggtitle("Flight weekdays")
fD1
#the Satisfaction for southeast is more on tuesdays
#the remaining are almost same for all days

fD2=ggplot(sat, aes(x=Airline.Name, y=Satisfaction))
fD2=fD2+ geom_point()
fD2=fD2+theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  stat_summary(fun.y="mean",geom="point", color ="red", size =2)
fD2=fD2+ ggtitle("Airline Satisfaction")
fD2
#the Satisfaction for different airlines is seen
#almost all of them have an average Satisfaction of 3.5

fD3=ggplot(sat, aes(x=sat$Scheduled.Departure.Hour, y=Satisfaction))+facet_grid(.~southeast)+
  stat_summary(fun.y="mean",geom="point", color ="red", size =2)
fD3=fD3+ geom_point()
fD3=fD3+ ggtitle("Scheduled departure hour")
fD3
#the graph is more spread for southeast Airlines
#few of them lead to Satisfaction 3

fD4=ggplot(sat, aes(x=Departure.Delay.in.Minutes, y=Satisfaction))+facet_grid(.~southeast)+
  stat_summary(fun.y="mean",geom="point", color ="red", size =2)
fD4=fD4+geom_count()
fD4=fD4+ ggtitle("Departure delay")
fD4
#the rest of Satisfaction seems similar for all Airlines
#all the departure delays are below 500 Minutes for southeast Airlines
