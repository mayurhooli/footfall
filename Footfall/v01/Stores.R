event <- read.csv("./Analysis//Event.csv")
stores <- read.csv("./Analysis//Stores.csv")

storedg <- stores
storedg[is.na(storedg)] <- 0


#####Store Data#####
stores <- data.frame(event, storedg)
rm(event, storedg)


#####Event Based Separation#####
stores_e01 <- subset(stores, stores$Event_1 == "DSF")
stores_e02 <- subset(stores, stores$Event_1 == "Gitex")
stores_e03 <- subset(stores, stores$Event_1 != "DSF" & stores$Event_1 != "Gitex")


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
rm(stores_e03)
stores_e03 <- rbind(stores_e03_01, stores_e03_02, stores_e03_03, stores_e03_04,
                     stores_e03_05, stores_e03_06, stores_e03_07)

rm(stores_e03_01, stores_e03_02, stores_e03_03, stores_e03_04,
   stores_e03_05, stores_e03_06, stores_e03_07)

rm(stores)
stores <- rbind(stores_e01, stores_e02, stores_e03)
rm(stores_e01, stores_e02, stores_e03)

stores$ï..Store <- as.Date(stores$ï..Store, format = "%d-%B-%y")
stores <- stores[order(stores$ï..Store),]


#####Plot#####
plot(stores$stores.I01, type = "l")
write.csv(stores, "./Data//Stores//Store-01.csv", row.names = FALSE)