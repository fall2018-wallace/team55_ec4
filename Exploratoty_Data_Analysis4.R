
library(ggplot2)
library(dplyr)

sat=clean_data

#convert the target variable to numeric
#to perfrom various EDA operations
sat$Satisfaction=as.numeric((as.character((t(sat$Satisfaction)))))

class(sat$Flight.date)
#covert the character to date format for FlightDate variable
sat$Flight.date=as.Date(sat$Flight.date, format="%m/%d/%Y")
class(sat$Flight.date)
