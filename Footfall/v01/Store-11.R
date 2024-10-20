#####Store Data#####
store11 <- data.frame(event, stores$UM1)
plot(store11$stores.UM1, type = "l")
write.csv(store11, "./Data//Stores//Store-11.csv")

#####Exploration#####
store11_01 <- subset(store11, store11$Weekday == "Monday")
store11_02 <- subset(store11, store11$Weekday == "Tuesday")
store11_03 <- subset(store11, store11$Weekday == "Wednesday")
store11_04 <- subset(store11, store11$Weekday == "Thursday")
store11_05 <- subset(store11, store11$Weekday == "Friday")
store11_06 <- subset(store11, store11$Weekday == "Saturday")
store11_07 <- subset(store11, store11$Weekday == "Sunday")

summary(store11_01$stores.UM1)
summary(store11_02$stores.UM1)
summary(store11_03$stores.UM1)
summary(store11_04$stores.UM1)
summary(store11_05$stores.UM1)
summary(store11_06$stores.UM1)
summary(store11_07$stores.UM1)
