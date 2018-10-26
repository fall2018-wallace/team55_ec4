
raw_data<-data
str(raw_data)
head(raw_data)

unique(is.na(raw_data$Arrival.Delay.in.Minutes))

raw_data

subset(raw_data, is.na(raw_data$Arrival.Delay.in.Minutes))
lm(formula = Arrival.Delay.in.Minutes ~ Orgin.City, data = raw_data)




