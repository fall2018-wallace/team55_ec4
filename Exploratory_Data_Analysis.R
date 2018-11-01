
library(ggplot2)
library(dplyr)
df<-clean_data
#using this for Age
plot<-ggplot(df,aes(Age,Satisfaction))+geom_count()+facet_grid(southeast ~ .)
plot+stat_summary(fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Age,df$Satisfaction)
# As observed from the above plots, We can interpret that initially with increase in age, people's satisfaction raatings increase and then It starts decreasing after certain age
# which says spproximately people in age range of 30 to 50 rate high on satisfaction
# similar trends when comparing south east and other airlines

#using this for Airline Status
plot1<-ggplot(df,aes(Airline.Status,Satisfaction))+geom_count()+facet_grid(southeast ~ .)
plot1+stat_summary(fun.y = "mean", colour = "red", size = 2, geom = "point")
cor(df$Satisfaction,as.numeric(df$Airline.Status))
# More number of passengers are having Blue airline status and it increases from blue to platinum to gold to silver
#similar trends when comapring southeast and other airlines

#using this for gender
plot2<-ggplot(df,aes(Gender,Satisfaction))+facet_grid(southeast ~ .)+geom_count()
plot2+stat_summary(aes(y=Satisfaction,fill=southeast),fun.y="mean",size=2,colour='red',geom="point")
cor(df$Satisfaction,as.numeric(df$Gender))
#similar trends when comparing south east and other airlines

#using this for price sensitivity
plot3<-ggplot(df,aes(Price.Sensitivity,Satisfaction))+facet_grid(southeast ~ .)+geom_count()
plot3+stat_summary(aes(y=Satisfaction),fun.y="mean",size=2,colour='red',geom="point")
cor(df$Satisfaction,df$Price.Sensitivity)
#decrease in satisfaction with increase and price sensitivity factor of the passenger
#similar trends when comparing southeast and other airlines

#using this for year of first flight
plot4<-ggplot(df,aes(as.factor(Year.of.First.Flight),Satisfaction))+facet_grid(southeast ~ .)+geom_count()
plot4+stat_summary(aes(y=Satisfaction),fun.y="mean",size=2,colour='red',geom="point")
cor(df$Satisfaction,df$Year.of.First.Flight)
#similar trend in southeast and other airlines

#comparitive statistics
plot5<-ggplot(df,aes(southeast))
plot6<-plot5+stat_summary(aes(y=Satisfaction),fun.y="mean",geom="bar")
plot7<-plot4+stat_summary(aes(y=Age),fun.y="mean",geom="bar")
plot8<-plot4+stat_summary(aes(y=Price.Sensitivity),fun.y="mean",geom="bar")
#almost same means in Satisfaction, Age abd Price Sensitivity of passengers while comparing southeast and other airlines

#generating proportion plots
plot9<-ggplot(df)+geom_bar(mapping=aes(x=Satisfaction,fill=southeast),position="fill",width=0.4)
plot10<-ggplot(df)+geom_bar(mapping=aes(x=Gender,fill=southeast),position="fill",width=0.4)
plot11<-ggplot(df)+geom_bar(mapping=aes(x=Airline.Status,fill=southeast),position="fill",width=0.4)
plot12<-ggplot(df)+geom_bar(mapping=aes(x=Year.of.First.Flight,color=southeast,fill=Airline.Status),position="fill",width=0.4)
plot13<-ggplot(df)+geom_bar(mapping=aes(x=Price.Sensitivity,fill=southeast),position="fill",width=0.4)
plot14<-ggplot(df)+geom_bar(mapping=aes(x=Age,fill=southeast),position="fill",width=0.4)

df$Satisfaction=as.numeric((as.character((t(df$Satisfaction)))))
class(df$Flight.date)
df$Flight.date=as.Date(df$Flight.date, format="%m/%d/%Y")
class(df$Flight.date)
a=plot(df$Flight.date,df$Satisfaction)

