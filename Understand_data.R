
raw_data<-data


attach(raw_data)
min<-min(Shopping.Amount.at.Airport)
clim = c(min(Shopping.Amount.at.Airport),max(Shopping.Amount.at.Airport))
abc <- plot(Satisfaction, Shopping.Amount.at.Airport, xlim=clim)


