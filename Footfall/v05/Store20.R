#####Read Data#####
store20 <- read.xlsx("./Data/Store_v07/Store20.xlsx", 1)
store20 <- Outliers(store20)
store20_m <- StoreModel(store20)
model <- store20_m[[1]]
mse <- store20_m[[2]]
train <- store20_m[[3]]
test <- store20_m[[4]]
err <- store20_m[[5]]
rm(store20_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//Dubai.csv")
predictors$I01_Area <- store20$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store20.csv")