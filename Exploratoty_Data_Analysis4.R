
library(ggplot2)
library(dplyr)

sat=data

#convert the target variable to numeric
#to perfrom various EDA operations
sat$Satisfaction=as.numeric((as.character((t(sat$Satisfaction)))))

class(sat$Flight.date)
#covert the character to date format for FlightDate variable

#our major concentration is on southeast airline 
sat$southeast<-as.factor(trimws(sat$Airline.Name)=='Southeast Airlines Co.')


fD=ggplot(data)+geom_bar(mapping=aes(x=Class,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()+facet_grid(Flight.date ~ .)
#plot the graph for Satisfaction Vs FlightDate
fD
#as plotting the whole date has no meaning,
#plot it with day off the week_days
sat$week_days=weekdays(sat$Flight.date)
#day of the month is already present as a variable
#the spread is more for southeast Airlines
#also few values fall near Satisfaction 3 and below
fD1=ggplot(data)+geom_bar(mapping=aes(x=Class,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()+facet_grid(weekdays~ .)

fD1
#the Satisfaction for southeast is more on tuesdays
#the remaining are almost same for all days

fD3=ggplot(data)+geom_bar(mapping=aes(x=Class,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()+facet_grid(Airline.Name ~ .)

fD2
#the Satisfaction for different airlines is seen
#almost all of them have an average Satisfaction of 3.5

fD3=ggplot(data)+geom_bar(mapping=aes(x=Class,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()+facet_grid(Scheduled.Departure ~ .)
fD3
#the graph is more spread for southeast Airlines
#few of them lead to Satisfaction 3

fD4=ggplot(data)+geom_bar(mapping=aes(x=Class,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()+facet_grid(Departure.Delay.in.Minutes ~ .)
fD4
#the rest of Satisfaction seems similar for all Airlines
#all the departure delays are below 500 Minutes for southeast Airlines
