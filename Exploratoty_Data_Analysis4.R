
library(ggplot2)
library(dplyr)



#convert the target variable to numeric
#to perfrom various EDA operations
data$Satisfaction=as.numeric((as.character((t(data$Satisfaction)))))


fD3<-ggplot(data)+geom_bar(mapping=aes(x=Scheduled.Departure.Hour,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
fD3



#plot the graph for Satisfaction Vs FlightDate
fD
#as plotting the whole date has no meaning,
#plot it with day off the week_days

#day of the month is already present as a variable
#the spread is more for southeast Airlines
#also few values fall near Satisfaction 3 and below

fD1<-ggplot(data)+geom_bar(mapping=aes(x=week_days,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
fD1

#the Satisfaction for southeast is more on tuesdays
#the remaining are almost same for all days


Scheduled.Departure.Hour
#the Satisfaction for different airlines is seen
#almost all of them have an average Satisfaction of 3.5

fD2<-ggplot(data)+geom_bar(mapping=aes(x=Airline.Name,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
fD2

#the graph is more spread for southeast Airlines
#few of them lead to Satisfaction 3
fD3<-ggplot(data)+geom_bar(mapping=aes(x=Scheduled.Departure.Hour,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
fD3

fD4<-ggplot(data)+geom_bar(mapping=aes(x=Departure.Delay.in.Minutes,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
fD4
#the rest of Satisfaction seems similar for all Airlines
#all the departure delays are below 500 Minutes for southeast Airlines
