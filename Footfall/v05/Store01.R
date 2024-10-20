#####Read Data#####
store01 <- read.xlsx("./Data//Store_v07//Store01.xlsx", 1)
store01 <- Outliers(store01)
store01_m <- StoreModel(store01)
model <- store01_m[[1]]
mse <- store01_m[[2]]
train <- store01_m[[3]]
test <- store01_m[[4]]
err <- store01_m[[5]]
rm(store01_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 1)
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store01.csv")
