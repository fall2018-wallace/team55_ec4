

predP <- predict(model1, newdata = clean_data1, type = "class")
matrixSat <- table(predP,clean_data1$happyCust)
sumMatrix <- matrixSat[1,1] + matrixSat[2,2]

percSat <- sumMatrix/sum(matrixSat)
percSat
