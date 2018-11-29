
happyCust <- 0
med <- median(clean_data$Satisfaction)
happyCust[clean_data$Satisfaction>=med] <- 1
happyCust[clean_data$Satisfaction<med] <- 0

happyCust <- as.factor(happyCust)
clean_data1 <- cbind(clean_data,happyCust)
clean_data1 <- clean_data1[,-c(1)]

#model3 <- glm(happyCust~Airline.Status+Age+Gender+Price.Sensitivity+No.of.Flights.p.a.+ X..of.Flight.with.other.Airlines+Type.of.Travel+Shopping.Amount.at.Airport+Class+Day.of.Month+Airline.Code+Orgin.City+Destination.City+Departure.Delay.in.Minutes+Arrival.Delay.in.Minutes+Arrival.Delay.greater.5.Mins+Eating.and.Drinking.at.Airport,data=clean_data1)
#summary(model3)

sapply(clean_data1,function(x) sum(is.na(x)))
#sapply(clean_data1, function(x) length(unique(x)))
