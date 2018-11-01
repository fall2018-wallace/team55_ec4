
data<-clean_data
df$Satisfaction <- as.numeric(as.character(t(df$Satisfaction)))
df$Satisfaction[is.na(df$Satisfaction)] <- 3.5
