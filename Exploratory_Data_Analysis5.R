
library(ggplot2)
library(dplyr)
df<-clean_data
#using this for Age
satisfactionDelay<-ggplot(df,aes(Departure.Delay.in.Minutes,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Departure.Delay.in.Minutes,df$Satisfaction)

satisfactionArrivalDelay<-ggplot(df,aes(Arrival.Delay.in.Minutes,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Arrival.Delay.in.Minutes,df$Satisfaction)

satisfactionCancelled<-ggplot(df,aes(Flight.cancelled,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")

satisfactionFlightTime<-ggplot(df,aes(Flight.time.in.minutes,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Flight.time.in.minutes,df$Satisfaction)

satisfactionDistance<-ggplot(df,aes(Flight.Distance,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Flight.Distance,df$Satisfaction)
