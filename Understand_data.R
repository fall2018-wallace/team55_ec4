
raw_data<-data
str(raw_data)
head(raw_data)

unique(is.na(raw_data$Arrival.Delay.in.Minutes))

raw_data
unique(raw_data$Airline.Code)
length(raw_data$Flight.cancelled == 'No')

max((raw_data$Arrival.Delay.in.Minutes), na.rm=TRUE)
lm(formula = Arrival.Delay.in.Minutes ~ Orgin.City, data = raw_data)

attach(raw_data)
abc <- plot(Satisfaction, Shopping.Amount.at.Airport)


