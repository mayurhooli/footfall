#####Store Data#####
store09 <- data.frame(event, stores$IB1)
plot(store09$stores.IB1, type = "l")


#####Event Based Separation#####
store09_e01 <- subset(store09, store09$Event_1 == "DSF")
store09_e02 <- subset(store09, store09$Event_1 == "Gitex")
store09_e03 <- subset(store09, store09$Event_1 != "DSF" & store09$Event_1 != "Gitex")


#####Daywise Separation#####
store09_e02_01 <- subset(store09_e02, store09_e02$Weekday == "Monday")
store09_e02_02 <- subset(store09_e02, store09_e02$Weekday == "Tuesday")
store09_e02_03 <- subset(store09_e02, store09_e02$Weekday == "Wednesday")
store09_e02_04 <- subset(store09_e02, store09_e02$Weekday == "Thursday")
store09_e02_05 <- subset(store09_e02, store09_e02$Weekday == "Friday")
store09_e02_06 <- subset(store09_e02, store09_e02$Weekday == "Saturday")
store09_e02_07 <- subset(store09_e02, store09_e02$Weekday == "Sunday")


#####Missing Data#####
for(i in 1:nrow(store09_e02_01)){
  if(is.na(store09_e02_01[i,9]) == TRUE | store09_e02_01[i,9] == 0){
    store09_e02_01[i,9] <- round(mean(store09_e02_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e02_02)){
  if(is.na(store09_e02_02[i,9]) == TRUE | store09_e02_02[i,9] == 0){
    store09_e02_02[i,9] <- round(mean(store09_e02_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e02_03)){
  if(is.na(store09_e02_03[i,9]) == TRUE | store09_e02_03[i,9] == 0){
    store09_e02_03[i,9] <- round(mean(store09_e02_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e02_04)){
  if(is.na(store09_e02_04[i,9]) == TRUE | store09_e02_04[i,9] == 0){
    store09_e02_04[i,9] <- round(mean(store09_e02_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e02_05)){
  if(is.na(store09_e02_05[i,9]) == TRUE | store09_e02_05[i,9] == 0){
    store09_e02_05[i,9] <- round(mean(store09_e02_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e02_06)){
  if(is.na(store09_e02_06[i,9]) == TRUE | store09_e02_06[i,9] == 0){
    store09_e02_06[i,9] <- round(mean(store09_e02_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e02_07)){
  if(is.na(store09_e02_07[i,9]) == TRUE | store09_e02_07[i,9] == 0){
    store09_e02_07[i,9] <- round(mean(store09_e02_07[,9], na.rm = TRUE), 0)
  }
}


#####Daywise Separation#####
store09_e03_01 <- subset(store09_e03, store09_e03$Weekday == "Monday")
store09_e03_02 <- subset(store09_e03, store09_e03$Weekday == "Tuesday")
store09_e03_03 <- subset(store09_e03, store09_e03$Weekday == "Wednesday")
store09_e03_04 <- subset(store09_e03, store09_e03$Weekday == "Thursday")
store09_e03_05 <- subset(store09_e03, store09_e03$Weekday == "Friday")
store09_e03_06 <- subset(store09_e03, store09_e03$Weekday == "Saturday")
store09_e03_07 <- subset(store09_e03, store09_e03$Weekday == "Sunday")


#####Missing Data#####
for(i in 1:nrow(store09_e03_01)){
  if(is.na(store09_e03_01[i,9]) == TRUE | store09_e03_01[i,9] == 0){
    store09_e03_01[i,9] <- round(mean(store09_e03_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e03_02)){
  if(is.na(store09_e03_02[i,9]) == TRUE | store09_e03_02[i,9] == 0){
    store09_e03_02[i,9] <- round(mean(store09_e03_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e03_03)){
  if(is.na(store09_e03_03[i,9]) == TRUE | store09_e03_03[i,9] == 0){
    store09_e03_03[i,9] <- round(mean(store09_e03_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e03_04)){
  if(is.na(store09_e03_04[i,9]) == TRUE | store09_e03_04[i,9] == 0){
    store09_e03_04[i,9] <- round(mean(store09_e03_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e03_05)){
  if(is.na(store09_e03_05[i,9]) == TRUE | store09_e03_05[i,9] == 0){
    store09_e03_05[i,9] <- round(mean(store09_e03_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e03_06)){
  if(is.na(store09_e03_06[i,9]) == TRUE | store09_e03_06[i,9] == 0){
    store09_e03_06[i,9] <- round(mean(store09_e03_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store09_e03_07)){
  if(is.na(store09_e03_07[i,9]) == TRUE | store09_e03_07[i,9] == 0){
    store09_e03_07[i,9] <- round(mean(store09_e03_07[,9], na.rm = TRUE), 0)
  }
}


#####Merge Data#####
rm(store09_e02)
store09_e02 <- rbind(store09_e02_01, store09_e02_02, store09_e02_03, store09_e02_04,
                     store09_e02_05, store09_e02_06, store09_e02_07)

rm(store09_e02_01, store09_e02_02, store09_e02_03, store09_e02_04,
   store09_e02_05, store09_e02_06, store09_e02_07)


rm(store09_e03)
store09_e03 <- rbind(store09_e03_01, store09_e03_02, store09_e03_03, store09_e03_04,
                     store09_e03_05, store09_e03_06, store09_e03_07)

rm(store09_e03_01, store09_e03_02, store09_e03_03, store09_e03_04,
   store09_e03_05, store09_e03_06, store09_e03_07)

rm(store09)
store09 <- rbind(store09_e01, store09_e02, store09_e03)
rm(store09_e01, store09_e02, store09_e03)

store09$ï..Store <- as.Date(store09$ï..Store, format = "%d-%B-%y")
store09 <- store09[order(store09$ï..Store),]


#####Plot#####
plot(store09$stores.IB1, type = "l")
write.csv(store09, "./Data//Stores//Store-09.csv")

#####Exploration#####
store09_01 <- subset(store09, store09$Weekday == "Monday")
store09_02 <- subset(store09, store09$Weekday == "Tuesday")
store09_03 <- subset(store09, store09$Weekday == "Wednesday")
store09_04 <- subset(store09, store09$Weekday == "Thursday")
store09_05 <- subset(store09, store09$Weekday == "Friday")
store09_06 <- subset(store09, store09$Weekday == "Saturday")
store09_07 <- subset(store09, store09$Weekday == "Sunday")

summary(store09_01$stores.IB1)
summary(store09_02$stores.IB1)
summary(store09_03$stores.IB1)
summary(store09_04$stores.IB1)
summary(store09_05$stores.IB1)
summary(store09_06$stores.IB1)
summary(store09_07$stores.IB1)
