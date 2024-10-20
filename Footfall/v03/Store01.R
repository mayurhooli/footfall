library(caTools)


#####Read Data#####
store01 <- read.csv("./Data//Store_Mine//Store01_I01.csv")
store01d <- store01[1]
store01 <- store01[-1]


#####Outlier Analysis#####
FootSum <- summary(store01$I01_Footfall)
out1 <- as.numeric(FootSum[2] - 1.5 * (FootSum[5] - FootSum[2]))
out2 <- as.numeric(FootSum[5] + 1.5 * (FootSum[5] - FootSum[2]))
for(i in 1:nrow(store01)){
  if(store01$I01_Footfall[i] > out2)
    store01$I01_Footfall[i] <- out2
}
rm(i, out1, out2, FootSum)


#####Training and Test#####
sample <- sample.split(store01, SplitRatio = 0.8)
store01_train = subset(store01, sample == TRUE)
store01_test = subset(store01, sample == FALSE)
rm(sample)


#####Linear Regression#####
model1 <- lm(I01_Footfall ~ ., data = store01_train[,-c(1,3,11)])
store01_pred <- predict(model1, store01_test[,-4])
store01_test <- cbind(store01_test, store01_pred)

plot(store01_test$I01_Footfall, store01_test$store01_pred)
abline(0,1)

err <- (store01_test$I01_Footfall - store01_test$store01_pred) ^ 2
mse <- mean(err)
mse <- sqrt(mse)

store01_test[4] <- store01_test[28]
store_pred <- rbind(store01_train, store01_test)
store_pred <- store_pred[order(as.Date(store_pred$ï..Date, format = "%m/%d/%Y")),]

# > err1 <- sort(-err1)
# > err1 <- sort(err1)
# > err1 <- abs(err)
# > err1 <- sort(-err1) * -1
# > plot(err1, type = "l")
# > err1 <- sort(abs(err))
# > plot(err1, type = "l")
# > err1[153]
# [1] 1621.038
# > err1[128]
# [1] 633.5228
# > err1[112]
# [1] 472.9796
# > mean(err)
# [1] -5.537383
# > sd(err)
# [1] 765.0579
# > acf(err)


#####Random Forest#####
store01_train <- store01_train[-1]
set.seed(1)
model2 <- randomForest(Footfall~., data = store01_train[,-c(2,10)], mtry = 3, importance = TRUE)
summary(model2)

stored02 <- predict(model2, newdata = store01_test)
store01_test <- cbind(store01_test, stored02)
err <- (store01_test$Footfall - store01_test$stored02) ^ 2
mse <- mean(err)
mse <- sqrt(mse)
store01_test <- store01_test[-32]