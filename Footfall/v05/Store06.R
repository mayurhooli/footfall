#####Read Data#####
store06 <- read.xlsx("./Data//Store_v07//Store06.xlsx", 1)
store06 <- Outliers(store06)
store06_m <- StoreModel(store06)
model <- store06_m[[1]]
mse <- store06_m[[2]]
train <- store06_m[[3]]
test <- store06_m[[4]]
err <- store06_m[[5]]
rm(store06_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 2)
predictors$I01_Area <- store06$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store06.csv")