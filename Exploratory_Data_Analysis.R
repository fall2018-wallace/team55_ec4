
library(ggplot2)
library(dplyr)
df<-clean_data
#using this for Age
satisfactionAge<-ggplot(df,aes(Age,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Age,df$Satisfaction)
# As observed from the above plots, We can interpret that initially with increase in age, people's satisfaction raatings increase and then It starts decreasing after certain age
# which says spproximately people in age range of 30 to 50 rate high on satisfaction
# similar trends when comparing south east and other airlines

#using this for Airline Status
satisfactionAirlineStatus<-ggplot(df,aes(Airline.Status,Satisfaction))+geom_count()+facet_grid(southeast ~ .)+stat_summary(fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Satisfaction,as.numeric(df$Airline.Status))
# More number of passengers are having Blue airline status and it increases from blue to platinum to gold to silver
#similar trends when comapring southeast and other airlines

#using this for gender
satisfactionGender<-ggplot(df,aes(Gender,Satisfaction))+facet_grid(southeast ~ .)+geom_count()+stat_summary(aes(y=Satisfaction),fun.y="mean",size=2,colour='red',geom="point")
cor(df$Satisfaction,as.numeric(df$Gender))
#similar trends when comparing south east and other airlines

#using this for price sensitivity
satisfactionPriceSensitivity<-ggplot(df,aes(Price.Sensitivity,Satisfaction))+facet_grid(southeast ~ .)+geom_count()+stat_summary(aes(y=Satisfaction),fun.y="mean",size=2,colour='red',geom="point")
cor(df$Satisfaction,df$Price.Sensitivity)
#decrease in satisfaction with increase and price sensitivity factor of the passenger
#similar trends when comparing southeast and other airlines

#using this for year of first flight
satisfactionYearOfFirstFlight<-ggplot(df,aes(as.factor(Year.of.First.Flight),Satisfaction))+facet_grid(southeast ~ .)+geom_count()+stat_summary(aes(y=Satisfaction),fun.y="mean",size=2,colour='red',geom="point")
cor(df$Satisfaction,df$Year.of.First.Flight)
#similar trend in southeast and other airlines

