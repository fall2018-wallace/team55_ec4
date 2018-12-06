
model1<-'model1'

library(e1071)

clean_data <- na.omit(clean_data)

happyCust <- 1
med <- median(clean_data$Satisfaction)
happyCust[clean_data$Satisfaction>=med] <- 3
happyCust[clean_data$Satisfaction<med] <- 2

happyCust <- as.factor(happyCust)
clean_data1 <- cbind(clean_data,happyCust)
clean_data1 <- clean_data1[,-c(1)]

nb <- naiveBayes(happyCust ~ Airline.Status + Age + Gender +
           Price.Sensitivity + Year.of.First.Flight + No.of.Flights.p.a. +
              Type.of.Travel +
              Shopping.Amount.at.Airport +
              Class + Scheduled.Departure.Hour +Departure.Delay.in.Minutes +
             Arrival.Delay.greater.5.Mins, data = clean_data1)
             

summary(nb)
nb

predP <- predict(nbP, newdata = clean_data1, type = "class")
matrixSat <- table(predP,clean_data1$happyCust)
sumMatrix <- matrixSat[1,1] + matrixSat[2,2]

percSat <- sumMatrix/sum(matrixSat)
percSat
