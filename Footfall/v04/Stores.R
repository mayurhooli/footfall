#####Read Data#####
stores <- read.xlsx("./Data/Store_v07/Stores.xlsx", 1)
stores <- Outliers(stores)
stores_m <- StoreModel(stores)
model <- stores_m[[1]]
mse <- stores_m[[2]]
train <- stores_m[[3]]
test <- stores_m[[4]]
err <- stores_m[[5]]
rm(stores_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//Predictors.csv")
predictors$I01_Area <- stores$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Stores.csv")