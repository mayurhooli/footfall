#####Store Data#####
store02 <- data.frame(event, stores$D01)
plot(store02$stores.D01, type = "l")
write.csv(store02, "./Data//Stores//Store-02.csv")

#####Exploration#####
store02_01 <- subset(store02, store02$Weekday == "Monday")
store02_02 <- subset(store02, store02$Weekday == "Tuesday")
store02_03 <- subset(store02, store02$Weekday == "Wednesday")
store02_04 <- subset(store02, store02$Weekday == "Thursday")
store02_05 <- subset(store02, store02$Weekday == "Friday")
store02_06 <- subset(store02, store02$Weekday == "Saturday")
store02_07 <- subset(store02, store02$Weekday == "Sunday")

summary(store02_01$stores.D01)
summary(store02_02$stores.D01)
summary(store02_03$stores.D01)
summary(store02_04$stores.D01)
summary(store02_05$stores.D01)
summary(store02_06$stores.D01)
summary(store02_07$stores.D01)

#####Predictions#####
preds <- read.csv("./Analysis//Pred.csv")
preds$ï..Store <- as.Date(preds$ï..Store, format = "%d-%B-%y")
preds <- preds[order(preds$ï..Store),]
names(preds)[1] <- "Date"

store02 <- read.csv("./Data//Stores//Store-02.csv")
store02 <- store02[-1]
names(store02)[1] <- "Date"
store02$Date <- as.Date(store02$Date, format = "%d-%B-%y")
store02 <- store02[order(store02$Date),]
names(store02)[9] <- "Footfall"
stores <- smartbind(store02, preds)

stores$Date <- as.Date(stores$Date, format = "%Y-%m-%d")
stores_e01 <- subset(stores, stores$Event_1 == "DSF")
stores_e02 <- subset(stores, stores$Event_1 == "Gitex")
stores_e03 <- subset(stores, stores$Event_1 != "DSF" & store02$Event_1 != "Gitex")

#####Daywise Separation#####
stores_e01_01 <- subset(stores_e01, stores_e01$Weekday == "Monday")
stores_e01_02 <- subset(stores_e01, stores_e01$Weekday == "Tuesday")
stores_e01_03 <- subset(stores_e01, stores_e01$Weekday == "Wednesday")
stores_e01_04 <- subset(stores_e01, stores_e01$Weekday == "Thursday")
stores_e01_05 <- subset(stores_e01, stores_e01$Weekday == "Friday")
stores_e01_06 <- subset(stores_e01, stores_e01$Weekday == "Saturday")
stores_e01_07 <- subset(stores_e01, stores_e01$Weekday == "Sunday")


#####Missing Data#####
for(i in 1:nrow(stores_e01_01)){
  if(is.na(stores_e01_01[i,9]) == TRUE){
    stores_e01_01[i,9] <- round(mean(stores_e01_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_02)){
  if(is.na(stores_e01_02[i,9]) == TRUE){
    stores_e01_02[i,9] <- round(mean(stores_e01_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_03)){
  if(is.na(stores_e01_03[i,9]) == TRUE){
    stores_e01_03[i,9] <- round(mean(stores_e01_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_04)){
  if(is.na(stores_e01_04[i,9]) == TRUE){
    stores_e01_04[i,9] <- round(mean(stores_e01_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_05)){
  if(is.na(stores_e01_05[i,9]) == TRUE){
    stores_e01_05[i,9] <- round(mean(stores_e01_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_06)){
  if(is.na(stores_e01_06[i,9]) == TRUE){
    stores_e01_06[i,9] <- round(mean(stores_e01_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_07)){
  if(is.na(stores_e01_07[i,9]) == TRUE){
    stores_e01_07[i,9] <- round(mean(stores_e01_07[,9], na.rm = TRUE), 0)
  }
}

#####Daywise Separation#####
stores_e03_01 <- subset(stores_e03, stores_e03$Weekday == "Monday")
stores_e03_02 <- subset(stores_e03, stores_e03$Weekday == "Tuesday")
stores_e03_03 <- subset(stores_e03, stores_e03$Weekday == "Wednesday")
stores_e03_04 <- subset(stores_e03, stores_e03$Weekday == "Thursday")
stores_e03_05 <- subset(stores_e03, stores_e03$Weekday == "Friday")
stores_e03_06 <- subset(stores_e03, stores_e03$Weekday == "Saturday")
stores_e03_07 <- subset(stores_e03, stores_e03$Weekday == "Sunday")


#####Missing Data#####
for(i in 1:nrow(stores_e03_01)){
  if(is.na(stores_e03_01[i,9]) == TRUE){
    stores_e03_01[i,9] <- round(mean(stores_e03_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_02)){
  if(is.na(stores_e03_02[i,9]) == TRUE){
    stores_e03_02[i,9] <- round(mean(stores_e03_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_03)){
  if(is.na(stores_e03_03[i,9]) == TRUE){
    stores_e03_03[i,9] <- round(mean(stores_e03_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_04)){
  if(is.na(stores_e03_04[i,9]) == TRUE){
    stores_e03_04[i,9] <- round(mean(stores_e03_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_05)){
  if(is.na(stores_e03_05[i,9]) == TRUE){
    stores_e03_05[i,9] <- round(mean(stores_e03_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_06)){
  if(is.na(stores_e03_06[i,9]) == TRUE){
    stores_e03_06[i,9] <- round(mean(stores_e03_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_07)){
  if(is.na(stores_e03_07[i,9]) == TRUE){
    stores_e03_07[i,9] <- round(mean(stores_e03_07[,9], na.rm = TRUE), 0)
  }
}

#####Merge Data#####
rm(stores_e01)
stores_e01 <- rbind(stores_e01_01, stores_e01_02, stores_e01_03, stores_e01_04,
                    stores_e01_05, stores_e01_06, stores_e01_07)

rm(stores_e01_01, stores_e01_02, stores_e01_03, stores_e01_04,
   stores_e01_05, stores_e01_06, stores_e01_07)

rm(stores_e03)
stores_e03 <- rbind(stores_e03_01, stores_e03_02, stores_e03_03, stores_e03_04,
                    stores_e03_05, stores_e03_06, stores_e03_07)

rm(stores_e03_01, stores_e03_02, stores_e03_03, stores_e03_04,
   stores_e03_05, stores_e03_06, stores_e03_07)

rm(stores)
stores <- rbind(stores_e01, stores_e02, stores_e03)
rm(stores_e01, stores_e02, stores_e03)

stores <- stores[order(stores$Date),]
write.csv(stores, "./Data//Store_v01//Store-02.csv")
plot(stores$Footfall, type = "l")
