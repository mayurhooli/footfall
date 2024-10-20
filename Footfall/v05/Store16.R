#####Read Data#####
store16 <- read.xlsx("./Data//Store_v07//Store16.xlsx", 1)
store16 <- Outliers(store16)
store16_m <- StoreModel(store16)
model <- store16_m[[1]]
mse <- store16_m[[2]]
train <- store16_m[[3]]
test <- store16_m[[4]]
err <- store16_m[[5]]
rm(store16_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//Dubai.csv")
predictors$I01_Area <- store16$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store16.csv")
