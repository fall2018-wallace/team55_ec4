
happyCust <- 1
med <- median(clean_data$Satisfaction)
happyCust[clean_data$Satisfaction>=med] <- 3
happyCust[clean_data$Satisfaction<med] <- 2

happyCust <- as.factor(happyCust)
clean_data1 <- cbind(clean_data,happyCust)
clean_data1 <- clean_data1[,-c(1)]

#model3 <- glm(happyCust~Airline.Status+Age+Gender+Price.Sensitivity+No.of.Flights.p.a.+ X..of.Flight.with.other.Airlines+Type.of.Travel+Shopping.Amount.at.Airport+Class+Day.of.Month+Airline.Code+Orgin.City+Destination.City+Departure.Delay.in.Minutes+Arrival.Delay.in.Minutes+Arrival.Delay.greater.5.Mins+Eating.and.Drinking.at.Airport,data=clean_data1)
#summary(model3)


clean_data1$Departure.Delay.in.Minutes[is.na(clean_data1$Departure.Delay.in.Minutes)] <- mean(clean_data1$Departure.Delay.in.Minutes,na.rm=T)
clean_data1$Arrival.Delay.in.Minutes[is.na(clean_data1$Arrival.Delay.in.Minutes)] <- mean(clean_data1$Arrival.Delay.in.Minutes,na.rm=T)
clean_data1$Flight.time.in.minutes[is.na(clean_data1$Flight.time.in.minutes)] <- mean(clean_data1$Flight.time.in.minutes,na.rm=T)

model3 <- glm(happyCust~AIrline.Status+Age,family="binomial",data=clean_data1)
summary(model3)
