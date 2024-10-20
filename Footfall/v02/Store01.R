#####Load Libraries#####
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


#####Read Data#####
# store01 <- read.xlsx("./Data/Store_v04/Store01.xlsx", 1)
# store01d <- store01$Date


#####Outlier Analysis#####
# FootSum <- summary(store01$I01_Footfall)
# out1 <- as.numeric(FootSum[2] - 1.5 * (FootSum[5] - FootSum[2]))
# out2 <- as.numeric(FootSum[5] + 1.5 * (FootSum[5] - FootSum[2]))
# for(i in 1:nrow(store01)){
#   if(store01$I01_Footfall[i] > out2)
#     store01$I01_Footfall[i] <- out2
# }
# rm(i, out1, out2, FootSum)


#####Weekly Aggregation#####
# store01w <- data.frame(aggregate(.~Year+Week,data = store01, FUN=mean))
# store01w <- store01w[order(store01w$Year, store01w$Week),]


#####Ad Stock Rate Functions#####
# store01$Radio <- as.integer(store01$Radio)
# adstock<-function(x,rate=0){
#   return(as.numeric(filter(x=x,filter=rate,method="recursive")))
# }
# 
# AdstockRate<-function(Data,Impact,Ads){
#   modFit<-nls(data=Data,Impact~a+b*adstock(Ads,rate),
#               start=c(a=1,b=1,rate=0), na.action = na.omit)
#   if(summary(modFit)$coefficients[3,1]>0){
#     AdstockRate=summary(modFit)$coefficients[3,1]
#   }
#   else{
#     library(minpack.lm)
#     nls.out<-nlsLM(Impact~a+b*adstock(Ads,rate),data=Data,start=list(a=1,b=1,rate=0),
#                    lower=c(a=-Inf,b=-Inf,rate=0),upper=c(a=Inf,b=Inf,rate=1)) 
#     AdstockRate=summary(nls.out)$coefficients[3,1]
#   }
#   return(AdstockRate)
# }


#####Ad Stock Function#####
# AdstockRate(store01w, store01w$I01_Footfall, store01w$Radio)
# AdstockRate(store01w, store01w$I01_Footfall, store01w$DPS)
# AdstockRate(store01w, store01w$I01_Footfall, store01w$OBC)
# AdstockRate(store01w, store01w$I01_Footfall, store01w$FP)
# AdstockRate(store01w, store01w$I01_Footfall, store01w$HP)
# AdstockRate(store01w, store01w$I01_Footfall, store01w$Strip)


#####Ad Stock#####
# attach(store01w)
# ad.adstock <- as.numeric(filter(x=Radio, filter=.15, method="recursive"))
# store01w$Radio <- ad.adstock
# ad.adstock <- as.numeric(filter(x=DPS, filter=.07, method="recursive"))
# store01w$DPS <- ad.adstock
# ad.adstock <- as.numeric(filter(x=OBC, filter=.34, method="recursive"))
# store01w$OBC <- ad.adstock
# ad.adstock <- as.numeric(filter(x=FP, filter=.49, method="convolution"))
# store01w$FP <- ad.adstock
# ad.adstock <- as.numeric(filter(x=HP, filter=.54, method="recursive"))
# store01w$HP <- ad.adstock
# ad.adstock <- as.numeric(filter(x=Strip, filter=.46, method="recursive"))
# store01w$Strip <- ad.adstock
# detach(store01w)

# write.csv(store01w, "./12345.csv")
store01 <- read.xlsx("./Data//Store_v07//Store01.xlsx", 1)


#####Correlation#####
# sto01 <- lm(I01_Footfall~., data = store01)
# sto01 <- step(sto01)
# viffer <- vif(sto01)
# 
# viffer <- viffer[viffer < 5]
# viffed <- names(viffer)
# 
# storer01 <- data.frame(store01d)
# store01i <- store01$I01_Footfall
# storer01 <- data.frame(storer01, store01i)
# rm(sto01, viffed, store01d)
# 
# j <- 1
# for(i in 1:nrow(store01)){
#   if(names(store01[i])==names(viffer[j])){
#     storer01 <- cbind(storer01, store01[i])
#     j <- j + 1
#   }  
# }


#####Finalize Data#####
# storer01 <- cbind(storer01, store01$I01_Footfall)
# colnames(store01)[21] <- "Footfall"
# store01 <- storer01
# rm(storer01, i, j, viffer, ad.adstock)
# write.csv(store01, "./Data//Store_v04//Store01_Reg.csv", row.names = FALSE)
# store01 <- read.csv("./Data//Store_v04//Store01_Reg.csv")


store01 <- Outliers(store01)

#####Training and Test#####
m <- 9999

for(i in 1:20){
  
  sample <- sample.split(store01, SplitRatio = 0.8)
  store01_train = subset(store01, sample == TRUE)
  store01_test = subset(store01, sample == FALSE)
  rm(sample)
  
  store01_train <- store01_train[-1]
  stored01 <- lm(I01_Footfall~., data = store01_train)
  stored01 <- step(stored01)
  # summary(stored01)
  storey <- predict(stored01, store01_test)
  store01_test <- cbind(store01_test, storey)
  
  err <- (store01_test$I01_Footfall - store01_test$storey)
  mse <- mean(err ^ 2)
  mse <- sqrt(mse)
  
  if(mse < m){
    model <- stored01
    m <- mse
    train <- store01_train
    test <- store01_test
  }
  
}

# #####Random Forest#####
# store01_train <- store01_train[-1]
# set.seed(1)
# model2 <- randomForest(Footfall~., data = store01_train, mtry = 3, importance = TRUE)
# summary(model2)
# 
# stored01 <- predict(model2, newdata = store01_test)
# store01_test <- cbind(store01_test, stored01)
# err <- (store01_test$Footfall - store01_test$storey)
# mse <- mean(err ^ 2)
# mse <- sqrt(mse)
# err1 <- sort(abs(err))
# plot(err)
# err1[152]
# err1[128]
# err1[112]
# mean(err)
# sd(err)
# acf(err)
# 
# save(model2, stored01, file = "./Model2.RData")
