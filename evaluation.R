
logtraindata <- clean_data
logtestdata <- test

logpred <- predict(model3,testdata,type="response")
#round(logpred)
str(clean_data)
