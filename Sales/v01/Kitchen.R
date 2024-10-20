kitchen <- read.xlsx("./Data/Sales/Kitchen.xlsx",1)
kitchen <- kitchen[-c(27,28,29,30,31)]


ggplot(kitchen, aes(x = Date)) +
  geom_line(aes(y = Sales), colour="blue") +
  geom_line(aes(y = Sales), colour = "blue") +
  ylab(label="Frequency") +
  xlab("Date")


FootSum <- summary(kitchen$Sales)
out1 <- as.numeric(FootSum[2] - 1.5 * (FootSum[5] - FootSum[2]))
out2 <- as.numeric(FootSum[5] + 1.5 * (FootSum[5] - FootSum[2]))
for(i in 1:nrow(kitchen)){
  if(kitchen$Sales[i] < out1)
    kitchen$Sales[i] <- out1
  if(kitchen$Sales[i] > out2)
    kitchen$Sales[i] <- out2
}


sample <- sample.split(kitchen, SplitRatio = 0.8)
train = subset(kitchen, sample == TRUE)
test = subset(kitchen, sample == FALSE)
rm(sample)


train <- train[-1]
set.seed(7)
model1 <- randomForest(Sales~., data = train, mtry = 9, importance = TRUE)
salables <- predict(model1, test)
test <- cbind(test, salables)


err <- (test$Sales - test$salables)
mse <- mean(err ^ 2)
mse <- sqrt(mse)
err1 <- abs(err)
mae <- sum(err1/test$Sales)
mape <- mae * 100 / nrow(test)


predictors <- read.xlsx("./Data/Predictors.xlsx", 1)
predictors <- predictors[-c(27:32)]
Sales <- predict(model1, predictors)
write.csv(Sales, "./Kitchen.csv")