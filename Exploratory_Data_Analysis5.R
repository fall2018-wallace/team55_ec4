
library(ggplot2)
library(dplyr)
df<-clean_data
#using this for Age
satisfactionDelay<-ggplot(df,aes(Departure.Delay.in.Minutes,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(aes(y=Satisfaction),fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Departure.Delay.in.Minutes,df$Satisfaction)
