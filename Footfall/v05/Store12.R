#####Read Data#####
store12 <- read.xlsx("./Data//Store_v07//Store12.xlsx", 1)
store12 <- Outliers(store12)
store12_m <- StoreModel(store12)
model <- store12_m[[1]]
mse <- store12_m[[2]]
train <- store12_m[[3]]
test <- store12_m[[4]]
err <- store12_m[[5]]
rm(store12_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 4)
predictors$I01_Area <- store12$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store12.csv")