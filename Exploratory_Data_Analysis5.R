
library(ggplot2)
library(dplyr)
df<-data

#Customer satisfaction for Departure Delay for Southeast airlines is at an average of 3.5.
#The delay in minutes is at an average of about 100-150 minutes for both airlines.
satisfactionDelay<-ggplot(df,aes(Departure.Delay.in.Minutes,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Departure.Delay.in.Minutes,df$Satisfaction)

#The customer satisfaction for Southeast Airlines is average at the highest arrival delay. 
#Whereas average delay is about 50-100 minutes with customer satisfaction ranging from 3-3.5.
#For other airlines, there has been more delays but average is slightly the same.
satisfactionArrivalDelay<-ggplot(df,aes(Arrival.Delay.in.Minutes,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Arrival.Delay.in.Minutes,df$Satisfaction)


#In this plot, customer satisfactions can be seen by flights which were cancelled as well.
satisfactionCancelled<-ggplot(df,aes(Flight.cancelled,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")


#In this plot, the arrival delay of flights which are greater than 5 minutes have comparatively low satisfaction than the flights
satisfactionFlightTime<-ggplot(df,aes(Flight.time.in.minutes,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Flight.time.in.minutes,df$Satisfaction)


#In this plot, it can be observed that most number ofcustomers had flights which were of the distance of 500-1000 miles. 
#The average customer satisfaction is about 3.5 with most flight distances under 1000 miles.
#Customer satisfaction is about the same for longer flight distances as well.
satisfactionDistance<-ggplot(df,aes(Flight.Distance,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Flight.Distance,df$Satisfaction)

#In this plot, it is observed that the customer satisfaction is comparatively lower than the arrival delay which is greater than 5 minutes. 
satisfactionArrivalGreater<-ggplot(df,aes(Arrival.Delay.greater.5.Mins,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")

