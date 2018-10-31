
raw_data<-data


raw_data$Satisfaction <- as.numeric(raw_data$Satisfaction)
cor(raw_data$Shopping.Amount.at.Airport, raw_data$Satisfaction)
