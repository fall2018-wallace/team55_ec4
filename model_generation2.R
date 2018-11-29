
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

library(arules)
library(arulesViz)
library(methods)
data$southeast=as.factor(data$southeast)
data$Year.of.First.Flight=as.factor(data$Year.of.First.Flight)
data<-data.frame(sapply(data,as.factor))
str(data)
dataX <- as(data,"transactions")

ruleset <- apriori(dataX, parameter=list(support = 0.3,confidence = 0.3))
#inspect to see the ruleset
inspect(ruleset)
#subsetting to get only those rules that result into high overallCustSat
sub<-subset(ruleset, subset = rhs %in% "Satisfaction=Satisfied")
#inspect to see those rules
inspect(sub)

# Output
# lhs                                     rhs                        support confidence      lift count
# [1]  {}                                   => {Satisfaction=Satisfied} 0.5106351  0.5106351 1.0000000 44437
# [2]  {Shopping.Amount.at.Airport=Average} => {Satisfaction=Satisfied} 0.3031957  0.4951861 0.9697454 26385
# [3]  {Type.of.Travel=Business travel}     => {Satisfaction=Satisfied} 0.4348850  0.7098378 1.3901076 37845
# [4]  {Departure.Delay.in.Minutes=Average} => {Satisfaction=Satisfied} 0.3323374  0.5401857 1.0578702 28921
# [5]  {Arrival.Delay.greater.5.Mins=no}    => {Satisfaction=Satisfied} 0.3659033  0.5575556 1.0918865 31842
# [6]  {Price.Sensitivity=1}                => {Satisfaction=Satisfied} 0.3652827  0.5386792 1.0549201 31788
# [7]  {Class=Eco}                          => {Satisfaction=Satisfied} 0.4112936  0.5057224 0.9903793 35792
# [8]  {southeast=FALSE}                    => {Satisfaction=Satisfied} 0.4720706  0.5094433 0.9976660 41081
# [9]  {Flight.cancelled=No}                => {Satisfaction=Satisfied} 0.5042920  0.5140203 1.0066294 43885
# [10] {Type.of.Travel=Business travel,                                                                     
# Arrival.Delay.greater.5.Mins=no}    => {Satisfaction=Satisfied} 0.3040805  0.7604679 1.4892588 26462
# [11] {Price.Sensitivity=1,                                                                                
# Type.of.Travel=Business travel}     => {Satisfaction=Satisfied} 0.3138596  0.7208118 1.4115985 27313
# [12] {Type.of.Travel=Business travel,                                                                     
# Class=Eco}                          => {Satisfaction=Satisfied} 0.3489307  0.7045898 1.3798302 30365
# [13] {Type.of.Travel=Business travel,                                                                     
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.4019512  0.7083494 1.3871928 34979
# [14] {Type.of.Travel=Business travel,                                                                     
# Flight.cancelled=No}                => {Satisfaction=Satisfied} 0.4306678  0.7122522 1.3948360 37478
# [15] {Departure.Delay.in.Minutes=Average,                                                                 
# Arrival.Delay.greater.5.Mins=no}    => {Satisfaction=Satisfied} 0.3035175  0.5564615 1.0897438 26413
# [16] {Departure.Delay.in.Minutes=Average,                                                                 
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3036209  0.5399407 1.0573905 26422
# [17] {Departure.Delay.in.Minutes=Average,                                                                 
# Flight.cancelled=No}                => {Satisfaction=Satisfied} 0.3260517  0.5465367 1.0703077 28374
# [18] {Arrival.Delay.greater.5.Mins=no,                                                                    
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3366351  0.5568862 1.0905757 29295
# [19] {Flight.cancelled=No,                                                                                
# Arrival.Delay.greater.5.Mins=no}    => {Satisfaction=Satisfied} 0.3595601  0.5641599 1.1048200 31290
# [20] {Price.Sensitivity=1,                                                                                
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3379911  0.5377148 1.0530314 29413
# [21] {Price.Sensitivity=1,                                                                                
# Flight.cancelled=No}                => {Satisfaction=Satisfied} 0.3610195  0.5422053 1.0618253 31417
# [22] {Class=Eco,                                                                                          
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3801064  0.5043916 0.9877730 33078
# [23] {Class=Eco,                                                                                          
# Flight.cancelled=No}                => {Satisfaction=Satisfied} 0.4056629  0.5091145 0.9970221 35302
# [24] {Flight.cancelled=No,                                                                                
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.4659458  0.5127336 1.0041096 40548
# [25] {Price.Sensitivity=1,                                                                                
# Type.of.Travel=Business travel,                                                                     
# Flight.cancelled=No}                => {Satisfaction=Satisfied} 0.3110902  0.7235214 1.4169049 27072
# [26] {Type.of.Travel=Business travel,                                                                     
# Class=Eco,                                                                                          
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3223516  0.7025470 1.3758298 28052
# [27] {Type.of.Travel=Business travel,                                                                     
# Class=Eco,                                                                                          
# Flight.cancelled=No}                => {Satisfaction=Satisfied} 0.3452421  0.7072338 1.3850082 30044
# [28] {Type.of.Travel=Business travel,                                                                     
# Flight.cancelled=No,                                                                                
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3979063  0.7107786 1.3919500 34627
# [29] {Flight.cancelled=No,                                                                                
# Arrival.Delay.greater.5.Mins=no,                                                                    
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3305103  0.5634305 1.1033916 28762
# [30] {Price.Sensitivity=1,                                                                                
# Flight.cancelled=No,                                                                                
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3338773  0.5411421 1.0597431 29055
# [31] {Class=Eco,                                                                                          
# Flight.cancelled=No,                                                                                
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3746711  0.5076525 0.9941591 32605
# [32] {Type.of.Travel=Business travel,                                                                     
# Class=Eco,                                                                                          
# Flight.cancelled=No,                                                                                
# southeast=FALSE}                    => {Satisfaction=Satisfied} 0.3188238  0.7052080 1.3810410 27745
