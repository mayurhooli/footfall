#####Read Data#####
store15 <- read.xlsx("./Data//Store_v07//Store15.xlsx", 1)
store15 <- Outliers(store15)
store15_m <- StoreModel(store15)
model <- store15_m[[1]]
mse <- store15_m[[2]]
train <- store15_m[[3]]
test <- store15_m[[4]]
err <- store15_m[[5]]
rm(store15_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 6)
predictors$I01_Area <- store15$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store15.csv")