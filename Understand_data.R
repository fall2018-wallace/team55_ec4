
raw_data<-data
str(raw_data)
head(raw_data)

unique(is.na(raw_data$Arrival.Delay.in.Minutes))

raw_data

lm(formula = Arrival.Delay.in.Minutes ~ Orgin.City, data = raw_data)




