
raw_data<-data


attach(raw_data)
min<-min(Shopping.Amount.at.Airport)
max<-max(Shopping.Amount.at.Airport)
clim = c(min,max)
abc <- plot(Satisfaction, Shopping.Amount.at.Airport, xlim=clim)


