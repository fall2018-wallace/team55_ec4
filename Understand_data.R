
raw_data<-data


attach(raw_data)
clim = c(min(Shopping.Amount.at.Airport),max(Shopping.Amount.at.Airport))
abc <- plot(Satisfaction, Shopping.Amount.at.Airport, xlim=clim)


