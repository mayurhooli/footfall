#####Store Data#####
store06 <- data.frame(event, stores$S01)
plot(store06$stores.S01, type = "l")
write.csv(store06, "./Data//Stores//Store-06.csv")

#####Exploration#####
store06_01 <- subset(store06, store06$Weekday == "Monday")
store06_02 <- subset(store06, store06$Weekday == "Tuesday")
store06_03 <- subset(store06, store06$Weekday == "Wednesday")
store06_04 <- subset(store06, store06$Weekday == "Thursday")
store06_05 <- subset(store06, store06$Weekday == "Friday")
store06_06 <- subset(store06, store06$Weekday == "Saturday")
store06_07 <- subset(store06, store06$Weekday == "Sunday")

summary(store06_01$stores.S01)
summary(store06_02$stores.S01)
summary(store06_03$stores.S01)
summary(store06_04$stores.S01)
summary(store06_05$stores.S01)
summary(store06_06$stores.S01)
summary(store06_07$stores.S01)
