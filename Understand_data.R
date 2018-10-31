
raw_data<-data


dataframe$Satisfaction <- as.numeric(dataframe$Satisfaction)
cor(dataframe$Shopping.Amount.at.Airport, dataframe$Satisfaction)
