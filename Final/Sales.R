ha_sales <- read.csv("./Analysis/HA_Sales_v02.csv")
stores <- read.csv("./Analysis/Stores.csv")
predicting <- read.csv("./Data/Pred2.csv")
pred <- read.csv("./Data/Pred1.csv")
Foot <- read.csv("./Predictions/Footfall/v01/Predictions.csv")

Date <- pred$ï..Date
values <- data.frame(Date)

for(i in 1:20){
  
  filers <- data.frame()
  
  for(j in 1:7){
    
    sold <- subset(ha_sales, ï..LOC_CODE == i & GROUP_DESC == j)
    Footfall <- stores[i+2]
    Foot1 <- Foot[i+1]

    
    predictor <- predicting
    predictor[1] <- as.Date(predictor$ï..Date, format = "%m/%d/%Y")
    predictor <- predictor[order(predictor$ï..Date),,drop = FALSE]
    
    
    if(nrow(sold) == 0){
      break
    }
      

    sold <- data.frame(aggregate(.~SI_DATE, data = sold, FUN = sum))
    sold[1] <- as.Date(sold$SI_DATE, format = "%m/%d/%Y")
    sold <- sold[order(sold$SI_DATE),,drop = FALSE]
    
    
    l <- 1
    for(k in 1:731){
      if(l > nrow(sold))
        break
      if(predictor$ï..Date[k] == sold$SI_DATE[l]){
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
    Dates <- pred$ï..Date
#    filer <- data.frame(Dates, i, j, Sales)
    filer <- data.frame(Dates, j, Sales)
    filers <- rbind.fill(filers, filer)

  }

  values <- cbind(values, filers)
    
}

write.csv(values, "./Sales_Predictions.csv")
