
library(ggplot2)
library(dplyr)
sat=clean_data
sat$Satisfaction=as.numeric((as.character((t(sat$Satisfaction)))))
class(sat$Flight.date)
sat$Flight.date=as.Date(sat$Flight.date, format="%m/%d/%Y")
class(sat$Flight.date)
