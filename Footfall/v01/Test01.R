#####Store Data#####
store01 <- data.frame(event, stores$I01)
plot(store01$stores.I01, type = "l")
rm(event, stores, storedg)


#####Event Based Separation#####
store01_e01 <- subset(store01, store01$Event_1 == "DSF")
store01_e02 <- subset(store01, store01$Event_1 == "Gitex")
store01_e03 <- subset(store01, store01$Event_1 != "DSF" & store01$Event_1 != "Gitex")


#####Daywise Separation#####
store01_e03_01 <- subset(store01_e03, store01_e03$Weekday == "Monday")
store01_e03_02 <- subset(store01_e03, store01_e03$Weekday == "Tuesday")
store01_e03_03 <- subset(store01_e03, store01_e03$Weekday == "Wednesday")
store01_e03_04 <- subset(store01_e03, store01_e03$Weekday == "Thursday")
store01_e03_05 <- subset(store01_e03, store01_e03$Weekday == "Friday")
store01_e03_06 <- subset(store01_e03, store01_e03$Weekday == "Saturday")
store01_e03_07 <- subset(store01_e03, store01_e03$Weekday == "Sunday")


#####Missing Data#####
for(i in 1:nrow(store01_e03_01)){
  if(is.na(store01_e03_01[i,9]) == TRUE){
    store01_e03_01[i,9] <- round(mean(store01_e03_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store01_e03_02)){
  if(is.na(store01_e03_02[i,9]) == TRUE){
    store01_e03_02[i,9] <- round(mean(store01_e03_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store01_e03_03)){
  if(is.na(store01_e03_03[i,9]) == TRUE){
    store01_e03_03[i,9] <- round(mean(store01_e03_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store01_e03_04)){
  if(is.na(store01_e03_04[i,9]) == TRUE){
    store01_e03_04[i,9] <- round(mean(store01_e03_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store01_e03_05)){
  if(is.na(store01_e03_05[i,9]) == TRUE){
    store01_e03_05[i,9] <- round(mean(store01_e03_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store01_e03_06)){
  if(is.na(store01_e03_06[i,9]) == TRUE){
    store01_e03_06[i,9] <- round(mean(store01_e03_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store01_e03_07)){
  if(is.na(store01_e03_07[i,9]) == TRUE){
    store01_e03_07[i,9] <- round(mean(store01_e03_07[,9], na.rm = TRUE), 0)
  }
}


#####Merge Data#####
rm(store01_e03)
store01_e03 <- rbind(store01_e03_01, store01_e03_02, store01_e03_03, store01_e03_04,
                     store01_e03_05, store01_e03_06, store01_e03_07)

rm(store01_e03_01, store01_e03_02, store01_e03_03, store01_e03_04,
   store01_e03_05, store01_e03_06, store01_e03_07)

rm(store01)
store01 <- rbind(store01_e01, store01_e02, store01_e03)
rm(store01_e01, store01_e02, store01_e03)

store01$ï..Store <- as.Date(store01$ï..Store, format = "%d-%B-%y")
store01 <- store01[order(store01$ï..Store),]


#####Plot#####
plot(store01$stores.I01, type = "l")
write.csv(store01, "./Data//Stores//Store-01.csv", row.names = FALSE)


#####Training & Test#####
names(store01)[1] <- "Date"
names(store01)[9] <- "Footfall"
sample <- sample.split(store01, SplitRatio = 0.9)
store01_train = subset(store01, sample == TRUE)
store01_test = subset(store01, sample == FALSE)
rm(sample, i)


#####Predictions#####
store01_test[9] <- 0
stores <- rbind.fill(store01_train, store01_test)
stores <- stores[order(as.Date(stores$Date)),]
stores <- cbind(stores, store01$Footfall)
rm(store01_train, store01_test)

stores_e01 <- subset(stores, stores$Event_1 == "DSF")
stores_e02 <- subset(stores, stores$Event_1 == "Gitex")
stores_e03 <- subset(stores, stores$Event_1 != "DSF" & store01$Event_1 != "Gitex")

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
  if(stores_e01_01[i,9] == 0){
    stores_e01_01[i,9] <- round(mean(stores_e01_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_02)){
  if(stores_e01_02[i,9] == 0){
    stores_e01_02[i,9] <- round(mean(stores_e01_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_03)){
  if(stores_e01_03[i,9] == 0){
    stores_e01_03[i,9] <- round(mean(stores_e01_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_04)){
  if(stores_e01_04[i,9] == 0){
    stores_e01_04[i,9] <- round(mean(stores_e01_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_05)){
  if(stores_e01_05[i,9] == 0){
    stores_e01_05[i,9] <- round(mean(stores_e01_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_06)){
  if(stores_e01_06[i,9] == 0){
    stores_e01_06[i,9] <- round(mean(stores_e01_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e01_07)){
  if(stores_e01_07[i,9] == 0){
    stores_e01_07[i,9] <- round(mean(stores_e01_07[,9], na.rm = TRUE), 0)
  }
}


#####Daywise Separation#####
stores_e02_01 <- subset(stores_e02, stores_e02$Weekday == "Monday")
stores_e02_02 <- subset(stores_e02, stores_e02$Weekday == "Tuesday")
stores_e02_03 <- subset(stores_e02, stores_e02$Weekday == "Wednesday")
stores_e02_04 <- subset(stores_e02, stores_e02$Weekday == "Thursday")
stores_e02_05 <- subset(stores_e02, stores_e02$Weekday == "Friday")
stores_e02_06 <- subset(stores_e02, stores_e02$Weekday == "Saturday")
stores_e02_07 <- subset(stores_e02, stores_e02$Weekday == "Sunday")


#####Missing Data#####
for(i in 1:nrow(stores_e02_01)){
  if(stores_e02_01[i,9] == 0){
    stores_e02_01[i,9] <- round(mean(stores_e02_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e02_02)){
  if(stores_e02_02[i,9] == 0){
    stores_e02_02[i,9] <- round(mean(stores_e02_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e02_03)){
  if(stores_e02_03[i,9] == 0){
    stores_e02_03[i,9] <- round(mean(stores_e02_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e02_04)){
  if(stores_e02_04[i,9] == 0){
    stores_e02_04[i,9] <- round(mean(stores_e02_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e02_05)){
  if(stores_e02_05[i,9] == 0){
    stores_e02_05[i,9] <- round(mean(stores_e02_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e02_06)){
  if(stores_e02_06[i,9] == 0){
    stores_e02_06[i,9] <- round(mean(stores_e02_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e02_07)){
  if(stores_e02_07[i,9] == 0){
    stores_e02_07[i,9] <- round(mean(stores_e02_07[,9], na.rm = TRUE), 0)
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
  if(stores_e03_01[i,9] == 0){
    stores_e03_01[i,9] <- round(mean(stores_e03_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_02)){
  if(stores_e03_02[i,9] == 0){
    stores_e03_02[i,9] <- round(mean(stores_e03_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_03)){
  if(stores_e03_03[i,9] == 0){
    stores_e03_03[i,9] <- round(mean(stores_e03_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_04)){
  if(stores_e03_04[i,9] == 0){
    stores_e03_04[i,9] <- round(mean(stores_e03_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_05)){
  if(stores_e03_05[i,9] == 0){
    stores_e03_05[i,9] <- round(mean(stores_e03_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_06)){
  if(stores_e03_06[i,9] == 0){
    stores_e03_06[i,9] <- round(mean(stores_e03_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(stores_e03_07)){
  if(stores_e03_07[i,9] == 0){
    stores_e03_07[i,9] <- round(mean(stores_e03_07[,9], na.rm = TRUE), 0)
  }
}


#####Merge Data#####
rm(stores_e01)
stores_e01 <- rbind(stores_e01_01, stores_e01_02, stores_e01_03, stores_e01_04,
                    stores_e01_05, stores_e01_06, stores_e01_07)

rm(stores_e01_01, stores_e01_02, stores_e01_03, stores_e01_04,
   stores_e01_05, stores_e01_06, stores_e01_07)

rm(stores_e02)
stores_e02 <- rbind(stores_e02_01, stores_e02_02, stores_e02_03, stores_e02_04,
                    stores_e02_05, stores_e02_06, stores_e02_07)

rm(stores_e02_01, stores_e02_02, stores_e02_03, stores_e02_04,
   stores_e02_05, stores_e02_06, stores_e02_07)

rm(stores_e03)
stores_e03 <- rbind(stores_e03_01, stores_e03_02, stores_e03_03, stores_e03_04,
                    stores_e03_05, stores_e03_06, stores_e03_07)

rm(stores_e03_01, stores_e03_02, stores_e03_03, stores_e03_04,
   stores_e03_05, stores_e03_06, stores_e03_07)

rm(stores)
stores <- rbind(stores_e01, stores_e02, stores_e03)
rm(stores_e01, stores_e02, stores_e03)

err <- c()

for(i in 1:nrow(stores)){
  if(stores[i,9] != stores[i,10]){
    k <- stores[i,10] - stores[i,9]
    err <- c(err, k)
  }
}

err <- err ^ 2
mse <- mean(err)
mse <- sqrt(mse)
