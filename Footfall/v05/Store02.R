#####Read Data#####
store02 <- read.xlsx("./Data//Store_v07//Store02.xlsx", 1)
store02 <- Outliers(store02)
store02_m <- StoreModel(store02)
model <- store02_m[[1]]
mse <- store02_m[[2]]
train <- store02_m[[3]]
test <- store02_m[[4]]
err <- store02_m[[5]]
rm(store02_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 1)
predictors$I01_Area <- store02$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store02.csv")
