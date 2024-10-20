#####Read Data#####
store11 <- read.xlsx("./Data//Store_v07//Store11.xlsx", 1)
store11 <- Outliers(store11)
store11_m <- StoreModel(store11)
model <- store11_m[[1]]
mse <- store11_m[[2]]
train <- store11_m[[3]]
test <- store11_m[[4]]
err <- store11_m[[5]]
rm(store11_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 1)
predictors$I01_Area <- store11$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store11.csv")