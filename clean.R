
clean_data<-raw_data

# find unique values in each column to check for abnormal values
sapply(raw_data,function(y)unique(y))

# the Satisfaction variable has 3 abnormal values which need to be replaced or removed

#conversion to numeric converts the abnprmal values to NA
clean_data$Satisfaction <- as.numeric(as.character(t(dataframe$Satisfaction)))
clean_data$Satisfaction[is.na(dataframe$Satisfaction)] <- 3.5
