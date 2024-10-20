#####Read Data#####
store10 <- read.xlsx("./Data//Store_v07//Store10.xlsx", 1)
store10 <- Outliers(store10)
store10_m <- StoreModel(store10)
model <- store10_m[[1]]
mse <- store10_m[[2]]
train <- store10_m[[3]]
test <- store10_m[[4]]
err <- store10_m[[5]]
rm(store10_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 1)
predictors$I01_Area <- store10$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store10.csv")