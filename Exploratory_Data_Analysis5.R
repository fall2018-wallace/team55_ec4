
library(ggplot2)
library(dplyr)
df<-data

satisfactionArrivalDelay<-ggplot(df)+geom_bar(mapping=aes(x=Arrival.Delay.in.Minutes,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#The percentage of satisfied and not satisfied customers is pretty much the same considering the Arrival Delay.
#Even when it is High, Average or Low.

satisfactionCancelled<-ggplot(df)+geom_bar(mapping=aes(x=Flight.cancelled,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#It can be seen that there are more non satisfied people where flights are cancelled. 
#This is explainable as cancelled flights could result in a negative review.
satisfactionFlightTime<-ggplot(df)+geom_bar(mapping=aes(x=Flight.time.in.minutes,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#In this plot, the arrival delay of flights which are greater than 5 minutes have comparatively low satisfaction than the flights

satisfactionDistance<-ggplot(df)+geom_bar(mapping=aes(x=Flight.Distance,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#In this plot, it can be observed that most number ofcustomers had flights which were of the distance of 500-1000 miles. 
#The average customer satisfaction is about 3.5 with most flight distances under 1000 miles.
#Customer satisfaction is about the same for longer flight distances as well.

satisfactionArrivalGreater<-ggplot(df)+geom_bar(mapping=aes(x=Arrival.Delay.greater.5.Mins,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
#In this plot, it is observed that the customer satisfaction is comparatively lower than the arrival delay which is greater than 5 minutes. 

