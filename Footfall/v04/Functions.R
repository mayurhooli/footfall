#####Load Libraries#####
library(ggplot2)
library(xlsx)
library(ade4)
library(reshape)
library(reshape2)
library(caTools)
library(Information)
library(riv)
library(woe)
library(gridExtra)
library(corrplot)
library(car)
library(tree)
library(randomForest)
library(gbm)
library(DataCombine)
library(data.table)
library(plyr)



#####Outlier Function#####
Outliers <- function(x){
  FootSum <- summary(x$I01_Footfall)
  out1 <- as.numeric(FootSum[2] - 1.5 * (FootSum[5] - FootSum[2]))
  out2 <- as.numeric(FootSum[5] + 1.5 * (FootSum[5] - FootSum[2]))

  for(i in 1:nrow(x)){

    if(x$I01_Footfall[i] < out1)
      x$I01_Footfall[i] <- out1

    if(x$I01_Footfall[i] > out2)
      x$I01_Footfall[i] <- out2

  }

  return(x)
}


#####Model Selection#####
StoreModel <- function(x){
  m <- 9999
  for(i in 1:20){
    
    sample <- sample.split(x, SplitRatio = 0.8)
    x_train = subset(x, sample == TRUE)
    x_test = subset(x, sample == FALSE)
    rm(sample)
    
    x_train <- x_train[-1]
    model1 <- lm(I01_Footfall~., data = x_train)
    model1 <- step(model1)
    storey <- predict(model1, x_test)
    x_test <- cbind(x_test, storey)
    
    err <- (x_test$I01_Footfall - x_test$storey)
    mse <- mean(err ^ 2)
    mse <- sqrt(mse)
    
    if(mse < m){
      model <- model1
      m <- mse
      train <- x_train
      test <- x_test
      e <- err
    }
  }
  return(list(model, m, train, test, e))
}


#####Ad Stock#####
adstock<-function(x,rate=0){
  return(as.numeric(filter(x=x,filter=rate,method="recursive")))
}


#####Ad Stock Rate#####
AdstockRate<-function(Data,Impact,Ads){
  modFit<-nls(data=Data,Impact~a+b*adstock(Ads,rate),
              start=c(a=1,b=1,rate=0), na.action = na.omit)
  if(summary(modFit)$coefficients[3,1]>0){
    AdstockRate=summary(modFit)$coefficients[3,1]
  }
  else{
    library(minpack.lm)
    nls.out<-nlsLM(Impact~a+b*adstock(Ads,rate),data=Data,start=list(a=1,b=1,rate=0),
                   lower=c(a=-Inf,b=-Inf,rate=0),upper=c(a=Inf,b=Inf,rate=1))
    AdstockRate=summary(nls.out)$coefficients[3,1]
  }
  return(AdstockRate)
}


#####Random Forest#####
RandomModel <- function(x){
  m <- 9999
  for(i in 1:20){
    
    sample <- sample.split(x, SplitRatio = 0.8)
    x_train = subset(x, sample == TRUE)
    x_test = subset(x, sample == FALSE)
    rm(sample)
    
    x_train <- x_train[-1]
    set.seed(1)
    model2 <- randomForest(I01_Footfall~., data = x_train, mtry = 3, importance = TRUE)
    stored01 <- predict(model2, newdata = x_test)
    x_test <- cbind(x_test, stored01)

    err <- (x_test$I01_Footfall - x_test$stored01)
    mse <- mean(err ^ 2)
    mse <- sqrt(mse)

    if(mse < m){
      model <- model2
      m <- mse
      train <- x_train
      test <- x_test
      e <- err
    }
  }
  return(list(model, m, train, test, e))
}

#####Plotter#####
# ggplot(store01, aes(x = Date)) +
#   geom_line(aes(y = I01_Footfall), colour="blue") +
#   geom_line(aes(y = I01_Footfall), colour = "blue") +
#   ylab(label="Frequency") +
#   xlab("Date")
