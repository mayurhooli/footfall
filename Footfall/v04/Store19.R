#####Read Data#####
store19 <- read.xlsx("./Data//Store_v07//Store19_DS1.xlsx", 1)
store19 <- Outliers(store19)
store19_m <- StoreModel(store19)
model <- store19_m[[1]]
mse <- store19_m[[2]]
train <- store19_m[[3]]
test <- store19_m[[4]]
err <- store19_m[[5]]
rm(store19_m)

err1 <- abs(err)
mae <- sum(err1/test$I01_Footfall)
mape <- mae * 100 / nrow(test)

predictors <- read.csv("./Analysis//ABD.csv")
predictors$I01_Area <- store19$I01_Area[((731-58):731)]
predictions <- predict(model, newdata = predictors)
write.csv(predictions, "./Predictions//Footfall//Store19.csv")