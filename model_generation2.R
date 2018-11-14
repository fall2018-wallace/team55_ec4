
data<-clean_data
data$Flight.date=as.Date(data$Flight.date, format="%m/%d/%Y")
data$week_days=weekdays(data$Flight.date)
data$month<- strftime(data$Flight.date, "%m")

numbertoCategory<-function(vec){
  #getting the 40th and 60th percentile of the data
  q <- quantile(vec, c(0.4, 0.6),na.rm=TRUE)
  #creating a vector with 'Average' value of length of vec
  vBuckets <- replicate(length(vec), "Average")
  #values lower than 40th percentile are replaced by 'Low'
  vBuckets[vec < q[1]] <- "Low"
  #values greater than 60th percentile are replaced by 'high'
  vBuckets[vec > q[2]] <- "High"
  return(as.factor(vBuckets))
  
}
str(data)
data$Age=numbertoCategory(data$Age)
data$No.of.Flights.p.a.=numbertoCategory(data$No.of.Flights.p.a.)
data$X..of.Flight.with.other.Airlines=numbertoCategory(data$X..of.Flight.with.other.Airlines)
data$Shopping.Amount.at.Airport=numbertoCategory(data$Shopping.Amount.at.Airport)
data$Departure.Delay.in.Minutes=numbertoCategory(data$Departure.Delay.in.Minutes)
data$Arrival.Delay.in.Minutes=numbertoCategory(data$Arrival.Delay.in.Minutes)
data$Flight.time.in.minutes=numbertoCategory(data$Flight.time.in.minutes)
data$Flight.Distance=numbertoCategory(data$Flight.Distance)
data[data$Flight.cancelled=='Yes',]$Arrival.Delay.in.Minutes='NotAvailable'
data[data$Flight.cancelled=='Yes',]$Departure.Delay.in.minutes='NotAvailable'
data[data$Flight.cancelled=='Yes',]$Flight.time.in.Minutes='NotAvailable'
data$Eating.and.Drinking.at.Airport=numbertoCategory(data$Eating.and.Drinking.at.Airport)
str(data)
quantile(data$Satisfaction)

data$Satisfaction[data$Satisfaction>=4]="Satisfied"
data$Satisfaction[data$Satisfaction<4]="Not Satisfied"
data$Satisfaction=as.factor(data$Satisfaction)
data$Price.Sensitivity=as.factor(data$Price.Sensitivity)
data$No..of.other.Loyalty.Cards=as.factor(data$No..of.other.Loyalty.Cards)
data$Day.of.Month=as.factor(data$Day.of.Month)
data$Scheduled.Departure.Hour=as.factor(data$Scheduled.Departure.Hour)
data$week_days=as.factor(data$week_days)
data$month=as.factor(data$month)
data=data[,-15]

facna=addNA(data$Arrival.Delay.in.Minutes)
levels(facna) <- c(levels(data$Arrival.Delay.in.Minutes), 'Not Available')
data$Arrival.Delay.in.Minutes<-facna
facna=addNA(data$Departure.Delay.in.Minutes)
levels(facna) <- c(levels(data$Departure.Delay.in.Minutes), 'Not Available')
data$Departure.Delay.in.Minutes<-facna
facna=addNA(data$Flight.time.in.minutes)
levels(facna) <- c(levels(data$Flight.time.in.minutes), 'Not Available')
data$Arrival.Delay.in.Minutes<-facna
data$Departure.Delay.in.Minutes=removeNA(data$Departure.Delay.in.Minutes)
data$Flight.time.in.minutes=removeNA(data$Flight.time.in.minutes)

ibrary(arules)
library(arulesViz)
data$southeast=as.factor(data$southeast)
data$Year.of.First.Flight=as.factor(data$Year.of.First.Flight)
dataX <- as(data,"transactions")

ruleset <- apriori(dataX, parameter=list(support = 0.3,confidence = 0.3))
#inspect to see the ruleset
inspect(ruleset)
#subsetting to get only those rules that result into high overallCustSat
sub<-subset(ruleset, subset = rhs %in% "Satisfaction=Satisfied")
#inspect to see those rules
inspect(sub)
