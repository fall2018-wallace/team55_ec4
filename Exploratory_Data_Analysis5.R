
library(ggplot2)
library(dplyr)
df<-data
satisfactionDelay<-ggplot(df)+geom_bar(mapping=aes(x=Departure.Delay.in.Minutes,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#Customer satisfaction for Departure Delay for Southeast airlines is at an average of 3.5.
#The delay in minutes is at an average of about 100-150 minutes for both airlines.

satisfactionArrivalDelay<-ggplot(df)+geom_bar(mapping=aes(x=Arrival.Delay.in.Minutes,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#The customer satisfaction for Southeast Airlines is average at the highest arrival delay. 
#Whereas average delay is about 50-100 minutes with customer satisfaction ranging from 3-3.5.
#For other airlines, there has been more delays but average is slightly the same.

satisfactionCancelled<-ggplot(df)+geom_bar(mapping=aes(x=Flight.cancelled,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#In this plot, customer satisfactions can be seen by flights which were cancelled as well.

satisfactionFlighTime<-ggplot(df)+geom_bar(mapping=aes(x=Flight.time.in.minutes,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#In this plot, the arrival delay of flights which are greater than 5 minutes have comparatively low satisfaction than the flights

satisfactionDistance<-ggplot(df)+geom_bar(mapping=aes(x=Flight.Distance,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#In this plot, it can be observed that most number ofcustomers had flights which were of the distance of 500-1000 miles. 
#The average customer satisfaction is about 3.5 with most flight distances under 1000 miles.
#Customer satisfaction is about the same for longer flight distances as well.

#In this plot, it is observed that the customer satisfaction is comparatively lower than the arrival delay which is greater than 5 minutes. 
satisfactionArrivalGreater<-ggplot(df,aes(Arrival.Delay.greater.5.Mins,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")

