
clean_data<-raw_data

# find unique values in each column to check for abnormal values
sapply(raw_data,function(y)unique(y))

# the Satisfaction variable has 3 abnormal values which need to be replaced or removed

