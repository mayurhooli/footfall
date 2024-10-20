#####Store Data#####
store03 <- data.frame(event, stores$T01)
plot(store03$stores.T01, type = "l")


#####Event Based Separation#####
store03_e01 <- subset(store03, store03$Event_1 == "DSF")
store03_e02 <- subset(store03, store03$Event_1 == "Gitex")
store03_e03 <- subset(store03, store03$Event_1 != "DSF" & store03$Event_1 != "Gitex")


#####Daywise Separation#####
store03_e03_01 <- subset(store03_e03, store03_e03$Weekday == "Monday")
store03_e03_02 <- subset(store03_e03, store03_e03$Weekday == "Tuesday")
store03_e03_03 <- subset(store03_e03, store03_e03$Weekday == "Wednesday")
store03_e03_04 <- subset(store03_e03, store03_e03$Weekday == "Thursday")
store03_e03_05 <- subset(store03_e03, store03_e03$Weekday == "Friday")
store03_e03_06 <- subset(store03_e03, store03_e03$Weekday == "Saturday")
store03_e03_07 <- subset(store03_e03, store03_e03$Weekday == "Sunday")


#####Missing Data#####
for(i in 1:nrow(store03_e03_01)){
  if(is.na(store03_e03_01[i,9]) == TRUE){
    store03_e03_01[i,9] <- round(mean(store03_e03_01[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store03_e03_02)){
  if(is.na(store03_e03_02[i,9]) == TRUE){
    store03_e03_02[i,9] <- round(mean(store03_e03_02[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store03_e03_03)){
  if(is.na(store03_e03_03[i,9]) == TRUE){
    store03_e03_03[i,9] <- round(mean(store03_e03_03[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store03_e03_04)){
  if(is.na(store03_e03_04[i,9]) == TRUE){
    store03_e03_04[i,9] <- round(mean(store03_e03_04[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store03_e03_05)){
  if(is.na(store03_e03_05[i,9]) == TRUE){
    store03_e03_05[i,9] <- round(mean(store03_e03_05[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store03_e03_06)){
  if(is.na(store03_e03_06[i,9]) == TRUE){
    store03_e03_06[i,9] <- round(mean(store03_e03_06[,9], na.rm = TRUE), 0)
  }
}

for(i in 1:nrow(store03_e03_07)){
  if(is.na(store03_e03_07[i,9]) == TRUE){
    store03_e03_07[i,9] <- round(mean(store03_e03_07[,9], na.rm = TRUE), 0)
  }
}


#####Merge Data#####
rm(store03_e03)
store03_e03 <- rbind(store03_e03_01, store03_e03_02, store03_e03_03, store03_e03_04,
                     store03_e03_05, store03_e03_06, store03_e03_07)

rm(store03_e03_01, store03_e03_02, store03_e03_03, store03_e03_04,
   store03_e03_05, store03_e03_06, store03_e03_07)

rm(store03)
store03 <- rbind(store03_e01, store03_e02, store03_e03)
rm(store03_e01, store03_e02, store03_e03)

store03$ï..Store <- as.Date(store03$ï..Store, format = "%d-%B-%y")
store03 <- store03[order(store03$ï..Store),]


#####Plot#####
plot(store03$stores.T01, type = "l")
write.csv(store03, "./Data//Stores//Store-03.csv")

#####Exploration#####
store03_01 <- subset(store03, store03$Weekday == "Monday")
store03_02 <- subset(store03, store03$Weekday == "Tuesday")
store03_03 <- subset(store03, store03$Weekday == "Wednesday")
store03_04 <- subset(store03, store03$Weekday == "Thursday")
store03_05 <- subset(store03, store03$Weekday == "Friday")
store03_06 <- subset(store03, store03$Weekday == "Saturday")
store03_07 <- subset(store03, store03$Weekday == "Sunday")

summary(store03_01$stores.T01)
summary(store03_02$stores.T01)
summary(store03_03$stores.T01)
summary(store03_04$stores.T01)
summary(store03_05$stores.T01)
summary(store03_06$stores.T01)
summary(store03_07$stores.T01)
