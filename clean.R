
clean_data<-raw_data

# find unique values in each column to check for abnormal values
sapply(clean_data,function(y)unique(y))

# the Satisfaction variable has 3 abnormal values which need to be replaced or removed

#conversion to numeric converts the abnprmal values to NA
clean_data$Satisfaction <- as.numeric(as.character(t(clean_data$Satisfaction)))

mean(clean_data$Satisfaction)
# replace the NA values 
#clean_data$Satisfaction[is.na(clean_data$Satisfaction)] <- meanSatisfaction

unique(clean_data$Satisfaction)
