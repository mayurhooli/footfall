#####Read Data#####
store09 <- read.xlsx("./Data//Store_v07//Store09_IB1.xlsx", 1)
store09 <- Outliers(store09)
store09_m <- StoreModel(store09)
model <- store09_m[[1]]
mse <- store09_m[[2]]
train <- store09_m[[3]]
test <- store09_m[[4]]
err <- store09_m[[5]]
rm(store09_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//Dubai.csv")
predictors$I01_Area <- store09$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store09.csv")