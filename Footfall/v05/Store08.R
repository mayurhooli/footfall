#####Read Data#####
store08 <- read.xlsx("./Data//Store_v07//Store08.xlsx", 1)
store08 <- Outliers(store08)
store08_m <- StoreModel(store08)
model <- store08_m[[1]]
mse <- store08_m[[2]]
train <- store08_m[[3]]
test <- store08_m[[4]]
err <- store08_m[[5]]
rm(store08_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 1)
predictors$I01_Area <- store08$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store08.csv")