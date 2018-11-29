
happyCust <- 1
med <- median(clean_data$Satisfaction)
happyCust[clean_data$Satisfaction>=med] <- 3
happyCust[clean_data$Satisfaction<med] <- 2

happyCust <- as.factor(happyCust)
clean_data1 <- cbind(clean_data,happyCust)
clean_data1 <- clean_data1[,-c(1)]




clean_data1$Departure.Delay.in.Minutes[is.na(clean_data1$Departure.Delay.in.Minutes)] <- mean(clean_data1$Departure.Delay.in.Minutes,na.rm=T)
clean_data1$Arrival.Delay.in.Minutes[is.na(clean_data1$Arrival.Delay.in.Minutes)] <- mean(clean_data1$Arrival.Delay.in.Minutes,na.rm=T)
clean_data1$Flight.time.in.minutes[is.na(clean_data1$Flight.time.in.minutes)] <- mean(clean_data1$Flight.time.in.minutes,na.rm=T)


# origin city, destination, airline code, flights with other airlines don't affect happiness significantly
model3 <- glm(happyCust~Airline.Status+Age+Gender+Price.Sensitivity+No.of.Flights.p.a.+ Type.of.Travel+Shopping.Amount.at.Airport+Class+Arrival.Delay.greater.5.Mins+Eating.and.Drinking.at.Airport,family="binomial",data=clean_data1)
summary(model3)
