#####Read Data#####
store18 <- read.xlsx("./Data//Store_v07//Store18_KS1.xlsx", 1)
store18 <- Outliers(store18)
store18_m <- StoreModel(store18)
model <- store18_m[[1]]
mse <- store18_m[[2]]
train <- store18_m[[3]]
test <- store18_m[[4]]
err <- store18_m[[5]]
rm(store18_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//Dubai.csv")
predictors$I01_Area <- store18$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store18.csv")
