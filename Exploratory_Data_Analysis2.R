
library(ggplot2)
library(dplyr)
df<-data
str(data)
#using this for Age
p1<-ggplot(df)+geom_bar(mapping=aes(x=Age,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
# As observed from the above plots, We can interpret that initially with increase in age, people's satisfaction raatings increase and then It starts decreasing after certain age
# which says spproximately people in age range of 30 to 50 rate high on satisfaction
# similar trends when comparing south east and other airlines

#using this for Airline Status
p2<-ggplot(df)+geom_bar(mapping=aes(x=Airline.Status,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()
# More number of passengers are having Blue airline status and it increases from blue to platinum to gold to silver
#similar trends when comapring southeast and other airlines

#using this for gender
p3<-ggplot(df)+geom_bar(mapping=aes(x=Gender,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()

#similar trends when comparing south east and other airlines

#using this for price sensitivity
p4<-ggplot(df)+geom_bar(mapping=aes(x=Price.Sensitivity,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()

#decrease in satisfaction with increase and price sensitivity factor of the passenger
#similar trends when comparing southeast and other airlines

#using this for year of first flight
satisfactionYearOfFirstFlight<-ggplot(df)+geom_bar(mapping=aes(x=Year.of.First.Flight,fill=Satisfaction),position="fill",width=0.4)+scale_fill_grey() + theme_classic()

#similar trend in southeast and other airlines

