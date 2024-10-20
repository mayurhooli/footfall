#####Read Data#####
store13 <- read.xlsx("./Data//Store_v07//Store13.xlsx", 1)
store13 <- Outliers(store13)
store13_m <- StoreModel(store13)
model <- store13_m[[1]]
mse <- store13_m[[2]]
train <- store13_m[[3]]
test <- store13_m[[4]]
err <- store13_m[[5]]
rm(store13_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 4)
predictors$I01_Area <- store13$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store13.csv")