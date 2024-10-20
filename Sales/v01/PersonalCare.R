PersonalCare <- read.xlsx("./Data/Sales/PersonalCare.xlsx",1)
PersonalCare <- PersonalCare[-c(27,28,29,30,31)]


ggplot(PersonalCare, aes(x = Date)) +
  geom_line(aes(y = Sales), colour="blue") +
  geom_line(aes(y = Sales), colour = "blue") +
  ylab(label="Frequency") +
  xlab("Date")


FootSum <- summary(PersonalCare$Sales)
out1 <- as.numeric(FootSum[2] - 1.5 * (FootSum[5] - FootSum[2]))
out2 <- as.numeric(FootSum[5] + 1.5 * (FootSum[5] - FootSum[2]))
for(i in 1:nrow(PersonalCare)){
  if(PersonalCare$Sales[i] < out1)
    PersonalCare$Sales[i] <- out1
  if(PersonalCare$Sales[i] > out2)
    PersonalCare$Sales[i] <- out2
}


sample <- sample.split(PersonalCare, SplitRatio = 0.8)
train = subset(PersonalCare, sample == TRUE)
test = subset(PersonalCare, sample == FALSE)
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
write.csv(Sales, "./PersonalCare.csv")