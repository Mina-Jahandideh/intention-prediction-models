# In lines 'To change', the number or letter of Intention sub-item should be assigned 
setwd("D:/MY DATA/Works/Intention")
library(haven)
data <- read_sav("data3.sav")
data <- data[,c(1:122,131:136)]  #### To change

data[,c(2:10,12:13,15:18)] <- as.data.frame(lapply(data[,c(2:10,12:13,15:18)],factor))
data[,c(22:128)] <- as.data.frame(lapply(data[,c(22:128)],function(var) factor(var,ordered=TRUE)))

library(caret)
train_index <- createDataPartition(data[123:128], p = 0.7, list = F)  #### To change
trainset <- data[-train_index,]
testset <- data[train_index,]
depvari <- trainset[,123:128]

library(party);library(e1071)
cfoutput <- cforest(depvari~., data = trainset, controls = cforest_unbiased())   #### To change
print(cforestStats(cfoutput))

mypred <- predict(cfoutput,testset,OOB=TRUE) # Without OOB=T, throws error
xtab <- table(observed = testset[,123:128], predicted = mypred[-train_index]) #### To change
print(confusionMatrix(xtab))

library(pROC)
rf.roc <- multiclass.roc(data,as.ordered(mypred)) #### To change
print(auc(rf.roc)) 

Breiman_imp <- rev(sort(varimp(cfoutput, pre1.0_0 = T))) # Importance using Breiman method
# barplot(Breiman_imp[15:1],horiz = T)
print(Breiman_imp[1:20])

# save.image("sessimg_cf1.RData")
