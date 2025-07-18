# In lines 'To change', the correct number or letter of Intention sub-item should be assigned 
setwd("D:/MY DATA/Works/Intention")
library(haven)
data <- read_sav("data3.sav")
data <- data[,c(1:122,123)]  #### To change

data[,c(2:10,12:13,15:18)] <- as.data.frame(lapply(data[,c(2:10,12:13,15:18)],factor))
data[,22:123] <- as.data.frame(lapply(data[,22:123],function(var) factor(var,ordered=TRUE)))

library(caret)
train_index <- createDataPartition(data$q28aI, p = 0.7, list = F)  #### To change
trainset <- data[train_index,]
testset <- data[-train_index,]

library(ordinalForest)
ofoutput <- ordfor(depvar="q28aI", data = trainset, perffunction = "equal")   #### To change
# other options for perffunction: "proportional", "oneclass"

mypred <- predict(ofoutput,testset)
xtab <- table(observed = testset$q28aI, predicted = mypred) #### To change
print(confusionMatrix(xtab))

imps <- rev(sort(varimp(ofoutput)))
# barplot(imps[15:1],horiz = T)
print(imps[1:20])

# save.image("sessimg_of1.RData")
