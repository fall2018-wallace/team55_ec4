
raw_data<-data
str(raw_data)
head(raw_data)

any(is.na(raw_data))
unique(colnames(df[is.na(df),]))
