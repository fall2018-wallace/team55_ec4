
raw_data<-data
str(raw_data)
head(raw_data)

unique(is.na(raw_data$Arrival.Delay.in.Minutes))

raw_data

length(raw_data$Flight.cancelled == 'No')
library('dplyr')
abc <- raw_data %>% filter(is.na(Arrival.Delay.in.Minutes), Flight.cancelled == 'No')
head(abc,10)
max((raw_data$Arrival.Delay.in.Minutes), na.rm=TRUE)
lm(formula = Arrival.Delay.in.Minutes ~ Orgin.City, data = raw_data)




