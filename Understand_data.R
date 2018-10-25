
raw_data<-data
str(raw_data)
head(raw_data)

unique(is.na(raw_data$Arrival.Delay.in.Minutes))


cor(x=raw_data$Arrival.Delay.in.Minutes, y=raw_data$Origin.City)
flight_time_in_minutes
departure_delay_in_minutes


