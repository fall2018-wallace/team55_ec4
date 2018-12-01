
logtraindata <- clean_data1
logtestdata <- test

logpred <- predict(model3,logtestdata,type="response")
#round(logpred)
str(clean_data)
