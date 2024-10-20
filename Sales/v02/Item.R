ha_sales <- read.csv("./Analysis/HA_Sales_v04.csv")
stores <- read.csv("./Analysis/Stores.csv")
predicting <- read.csv("./Data/Pred2.csv")
pred <- read.csv("./Data/Pred1.csv")
Foot <- read.csv("./Predictions/Footfall/v01/Stores.csv")

names(ha_sales)[1] <- "SI_DATE"
names(predicting)[1] <- "Date"
names(pred)[1] <- "Date"

Date <- pred$Date
values <- data.frame()
values <- Date
Footfall <- stores[29]
Foot1 <- Foot[2]


for(j in 5293:5757){
    
  sold <- subset(ha_sales, ITEM_CODE == j)
  
  predictor <- predicting
  predictor[1] <- as.Date(predictor$Date, format = "%m/%d/%Y")
  predictor <- predictor[order(predictor$Date),,drop = FALSE]
  
  
  if(nrow(sold) == 0){
    next
  }
  
  
  sold <- data.frame(aggregate(.~SI_DATE, data = sold, FUN = sum))
  sold[1] <- as.Date(sold$SI_DATE, format = "%m/%d/%Y")
  sold <- sold[order(sold$SI_DATE),,drop = FALSE]
  
  
  l <- 1
  for(k in 1:731){
    if(l > nrow(sold))
      next
    if(predictor$Date[k] == sold$SI_DATE[l]){
      predictor$Sales[k] <- sold$SII_QUANTITY[l]
      l <- l+1
    }
  }
  
  
  predictor <- cbind(predictor, Footfall)
  names(predictor)[20] <- "Footfall"
  pred <- cbind(pred,Foot1)
  names(pred)[19] <- "Footfall"
  predictor <- predictor[-1]
  set.seed(7)
  model1 <- randomForest(Sales~., data = predictor, mtry = 6, importance = TRUE)
  Sales <- predict(model1, pred)
  Sales <- round(Sales)
  namer <- j
  filers <- data.frame(Sales)
  names(filers)[1] <- namer
  values <- cbind(values, filers)
  print(j)
  
}

values <- t(values)

write.csv(values, "./Item_Predictions.csv", col.names = FALSE)
