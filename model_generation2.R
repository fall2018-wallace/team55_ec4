
data<-clean_data
data$Flight.date=as.Date(data$Flight.date, format="%m/%d/%Y")
data$week_days=weekdays(data$Flight.date)
data$month<- strftime(data$Flight.date, "%m")
