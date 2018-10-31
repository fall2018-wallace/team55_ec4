
raw_data<-data
str(raw_data)
head(raw_data)

# This data has 28 variables  and 129889 observations
# Satisfaction is the dependent variable and all the other columns are independent variables
# The client is Southeast hence this project will have comparisons between Southeast 
# and other providers
# The date column will be converted into month and day of week to determine if time of
# year and time of week have any significant effect on the Satisfaction
#lm(Satisfaction~Gender ,data=raw_data)
