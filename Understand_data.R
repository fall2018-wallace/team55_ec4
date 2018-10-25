
raw_data<-data
str(raw_data)
head(raw_data)

unique(is.na(raw_data$Arrival.Delay.in.Minutes))


cor(raw_data)
flight_time_in_minutes
departure_delay_in_minutes


