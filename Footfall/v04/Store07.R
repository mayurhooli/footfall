#####Read Data#####
store07 <- read.xlsx("./Data//Store_v07//Store07_AD123.xlsx", 1)
store07 <- Outliers(store07)
store07_m <- StoreModel(store07)
model <- store07_m[[1]]
mse <- store07_m[[2]]
train <- store07_m[[3]]
test <- store07_m[[4]]
err <- store07_m[[5]]
rm(store07_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//AbuDhabi.csv")
predictors$I01_Area <- store07$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store07.csv")
