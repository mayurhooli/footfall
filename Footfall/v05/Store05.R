#####Read Data#####
store05 <- read.xlsx("./Data//Store_v07//Store05.xlsx", 1)
store05 <- Outliers(store05)
store05_m <- StoreModel(store05)
model <- store05_m[[1]]
mse <- store05_m[[2]]
train <- store05_m[[3]]
test <- store05_m[[4]]
err <- store05_m[[5]]
rm(store05_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 1)
predictors$I01_Area <- store05$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store05.csv")