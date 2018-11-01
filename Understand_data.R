
raw_data<-data
str(raw_data)
length(is.na(raw_data$Arrival.Delay.in.Minutes))

raw_data$Satisfaction <- as.numeric(raw_data$Satisfaction)
cor(raw_data$Shopping.Amount.at.Airport, raw_data$Satisfaction)
