
logtraindata <- clean_data1
logtestdata <- test
happyCust <- 1
med <- median(logtestdata$Satisfaction)
happyCust[logtestdata$Satisfaction>=med] <- 3
happyCust[logtestdata$Satisfaction<med] <- 2

happyCust <- as.factor(happyCust)

logtestdata$Departure.Delay.in.Minutes[is.na(logtestdata$Departure.Delay.in.Minutes)] <- mean(logtestdata$Departure.Delay.in.Minutes,na.rm=T)
logtestdata$Arrival.Delay.in.Minutes[is.na(logtestdata$Arrival.Delay.in.Minutes)] <- mean(logtestdata$Arrival.Delay.in.Minutes,na.rm=T)
logtestdata$Flight.time.in.minutes[is.na(logtestdata$Flight.time.in.minutes)] <- mean(logtestdata$Flight.time.in.minutes,na.rm=T)

logpred <- predict(model3,logtestdata,type="response")
pos_or_neg <- ifelse(logpred > 0.5, 3, 2)
happyCusttest <- factor(pos_or_neg)

