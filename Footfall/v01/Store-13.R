#####Store Data#####
store13 <- data.frame(event, stores$MU1)
plot(store13$stores.MU1, type = "l")
write.csv(store13, "./Data//Stores//Store-13.csv")

#####Exploration#####
store13_01 <- subset(store13, store13$Weekday == "Monday")
store13_02 <- subset(store13, store13$Weekday == "Tuesday")
store13_03 <- subset(store13, store13$Weekday == "Wednesday")
store13_04 <- subset(store13, store13$Weekday == "Thursday")
store13_05 <- subset(store13, store13$Weekday == "Friday")
store13_06 <- subset(store13, store13$Weekday == "Saturday")
store13_07 <- subset(store13, store13$Weekday == "Sunday")

summary(store13_01$stores.MU1)
summary(store13_02$stores.MU1)
summary(store13_03$stores.MU1)
summary(store13_04$stores.MU1)
summary(store13_05$stores.MU1)
summary(store13_06$stores.MU1)
summary(store13_07$stores.MU1)
