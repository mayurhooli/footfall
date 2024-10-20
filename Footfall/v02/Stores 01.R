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


#####Read Campaign Data#####
promos <- read.csv("./Promotions_master.csv")
promomelt <- melt(promos, id = c("Date", "Campaign.1", "Campaign.2"))
promomelt$value <- 1
promocast1 <- cast(promomelt, Date~Campaign.1)
promocast2 <- cast(promomelt, Date~Campaign.2)
promocaster <- data.frame(promocast1, promocast2[3:4])
promocaster <- promocaster[-2]
promocaster[is.na(promocaster)] <- 0
promocaster <- promocaster[order(as.Date(promocaster$Date,format = "%d-%b-%y")),,drop=FALSE]
rm(promos, promomelt, promocast1, promocast2)


#####Read Store Data#####
store01 <- read.csv("./Data/Store_v02/Store01-I01.csv")
colnames(store01)[1] <- "Date"
store01$Date <- as.Date(store01$Date, format = "%d-%b-%y")


#####Weekday Variables#####
stored <- store01[1:2]
storemelt <- melt(stored, id = c("Date", "Weekday"))
storemelt$Value <- 1
storecast <- cast(storemelt, Date~Weekday)
storecast[is.na(storecast)] <- 0
rm(stored, storemelt)


#####Save Data#####
store01 <- store01[-c(2)]
store01 <- cbind(store01, storecast[2:8], promocaster[2:17])
rm(storecast, promocaster)
write.xlsx(store01, "./Data/Store01.xlsx", row.names = FALSE)
write.csv(store01, "./Data/Store01.csv", row.names = FALSE)


#####Scaling#####
store01 <- read.csv("./Data/Store01.csv")
colnames(store01)[1] <- "Date"
store01d <- store01$Date
store01i <- store01$I01_Footfall
store01 <- store01[-c(1,110)]

store01 <- scale(store01)
store01 <- data.frame(store01)
store01 <- cbind(store01, store01i)
rm(store01i)


#####Outlier Analysis#####
FootSum <- summary(store01$store01i)
out1 <- as.numeric(FootSum[2] - 1.5 * (FootSum[5] - FootSum[2]))
out2 <- as.numeric(FootSum[5] + 1.5 * (FootSum[5] - FootSum[2]))
for(i in 1:nrow(store01)){
  if(store01$store01i[i] > out2)
    store01$store01i[i] <- out2
}
rm(i, out1, out2, FootSum)


#####Correlation#####
sto01 <- lm(store01i~., data = store01)
sto01 <- step(sto01)
viffer <- vif(sto01)

viffer <- viffer[viffer < 5]
viffed <- names(viffer)

storer01 <- data.frame(store01d)
rm(sto01, viffed, store01d)

j <- 1
for(i in 1:nrow(store01)){
  if(names(store01[i])==names(viffer[j])){
    storer01 <- cbind(storer01, store01[i])
    j <- j + 1
  }  
}


#####Finalize Data#####
storer01 <- cbind(storer01, store01$store01i)
colnames(store01)[25] <- "Footfall"
store01 <- storer01
rm(storer01, i, j, viffer)
write.csv(store01, "./Data//Store01_Reg.csv", row.names = FALSE)


#####Training and Test#####
names(store01)[25] <- "Footfall"
sample <- sample.split(store01, SplitRatio = 0.8)
store01_train = subset(store01, sample == TRUE)
store01_test = subset(store01, sample == FALSE)
rm(sample)


#####Linear Regression#####
store01_train <- store01_train[-1]
stored01 <- lm(Footfall~., data = store01_train)
stored01 <- step(stored01)
storey <- predict(stored01, store01_test)
store01_test <- cbind(store01_test, storey)

write.csv(store01_test, "./v01.csv")
summary(stored01)
err <- (store01_test$Footfall - store01_test$storey) ^ 2
mse <- mean(err)
mse <- sqrt(mse)


#####Random Forest#####
store01_train <- store01_train[-1]
set.seed(1)
model2 <- randomForest(Footfall~., data = store01_train, mtry = 3, importance = TRUE)
summary(model2)

stored02 <- predict(model2, newdata = store01_test)
store01_test <- cbind(store01_test, stored02)
err <- (store01_test$Footfall - store01_test$stored02) ^ 2
mse <- mean(err)
mse <- sqrt(mse)
store01_test <- store01_test[-32]
