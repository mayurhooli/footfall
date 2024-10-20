#####Read Data#####
store14 <- read.xlsx("./Data//Store_v07//Store14.xlsx", 1)
store14 <- Outliers(store14)
store14_m <- StoreModel(store14)
model <- store14_m[[1]]
mse <- store14_m[[2]]
train <- store14_m[[3]]
test <- store14_m[[4]]
err <- store14_m[[5]]
rm(store14_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 5)
predictors$I01_Area <- store14$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store14.csv")