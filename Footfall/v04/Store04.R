#####Read Data#####
store04 <- read.xlsx("./Data//Store_v07//Store04_DM1.xlsx", 1)
store04 <- Outliers(store04)
store04_m <- StoreModel(store04)
model <- store04_m[[1]]
mse <- store04_m[[2]]
train <- store04_m[[3]]
test <- store04_m[[4]]
err <- store04_m[[5]]
rm(store04_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//Dubai.csv")
predictors$I01_Area <- store04$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store04.csv")