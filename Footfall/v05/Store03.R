#####Read Data#####
store03 <- read.xlsx("./Data//Store_v07//Store03.xlsx", 1)
store03 <- Outliers(store03)
store03_m <- StoreModel(store03)
model <- store03_m[[1]]
mse <- store03_m[[2]]
train <- store03_m[[3]]
test <- store03_m[[4]]
err <- store03_m[[5]]
rm(store03_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.xlsx("./Analysis//Predictors.xlsx", 1)
predictors$I01_Area <- store03$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store03.csv")