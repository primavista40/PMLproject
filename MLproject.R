#reading data
train<-read.csv("pml-training.csv")
final<-read.csv("pml-testing.csv")
#There are many variables
factors<-colnames(train)
smallTrain<-train[,-c(grep('kurtosis',factors),grep('skewness',factors),grep('avg',factors),grep('var',factors)
          ,grep('stddev',factors),grep('min',factors),grep('max',factors),grep('amplitude',factors))]
smallFinal<-test[,-c(grep('kurtosis',factors),grep('skewness',factors),grep('avg',factors),grep('var',factors)
                    ,grep('stddev',factors),grep('min',factors),grep('max',factors),grep('amplitude',factors))]
used<-smallTrain[,8:60]
inTrain<-createDataPartition(used$classe,p=0.7,list=FALSE)
trainUsed<-used[inTrain,]
testUsed<-used[-inTrain,]
finalUsed<-smallTest[,8:60]
modFit<-randomForest(classe~.,data=trainUsed)
predicted<-predict(modFit,testUsed)
table(predicted,testUsed$classe)
answers<-as.character(predict(modFit,finalUsed))