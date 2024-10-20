#####Store Data#####
store08 <- data.frame(event, stores$B01)
plot(store08$stores.B01, type = "l")
write.csv(store08, "./Data//Stores//Store-08.csv")

#####Exploration#####
store08_01 <- subset(store08, store08$Weekday == "Monday")
store08_02 <- subset(store08, store08$Weekday == "Tuesday")
store08_03 <- subset(store08, store08$Weekday == "Wednesday")
store08_04 <- subset(store08, store08$Weekday == "Thursday")
store08_05 <- subset(store08, store08$Weekday == "Friday")
store08_06 <- subset(store08, store08$Weekday == "Saturday")
store08_07 <- subset(store08, store08$Weekday == "Sunday")

summary(store08_01$stores.B01)
summary(store08_02$stores.B01)
summary(store08_03$stores.B01)
summary(store08_04$stores.B01)
summary(store08_05$stores.B01)
summary(store08_06$stores.B01)
summary(store08_07$stores.B01)