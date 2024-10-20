#####Read Data#####
store17 <- read.xlsx("./Data//Store_v07//Store17_MG1.xlsx", 1)
store17 <- Outliers(store17)
store17_m <- StoreModel(store17)
model <- store17_m[[1]]
mse <- store17_m[[2]]
train <- store17_m[[3]]
test <- store17_m[[4]]
err <- store17_m[[5]]
rm(store17_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//Others.csv")
predictors$I01_Area <- store17$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store17.csv")