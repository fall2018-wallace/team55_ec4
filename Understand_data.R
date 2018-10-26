
raw_data<-data
str(raw_data)
head(raw_data)

unique(is.na(raw_data$Arrival.Delay.in.Minutes))

raw_data

head(subset(raw_data, is.na(raw_data$Arrival.Delay.in.Minutes)),10)
raw_data %>% filter(is.na(raw_data$Arrival.Delay.in.Minutes), raw_data$Flight.cancelled = 'Yes')
lm(formula = Arrival.Delay.in.Minutes ~ Orgin.City, data = raw_data)




