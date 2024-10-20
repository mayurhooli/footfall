#####Store Data#####
store05 <- data.frame(event, stores$M01)
plot(store05$stores.M01, type = "l")
write.csv(store05, "./Data//Stores//Store-05.csv")

#####Exploration#####
store05_01 <- subset(store05, store05$Weekday == "Monday")
store05_02 <- subset(store05, store05$Weekday == "Tuesday")
store05_03 <- subset(store05, store05$Weekday == "Wednesday")
store05_04 <- subset(store05, store05$Weekday == "Thursday")
store05_05 <- subset(store05, store05$Weekday == "Friday")
store05_06 <- subset(store05, store05$Weekday == "Saturday")
store05_07 <- subset(store05, store05$Weekday == "Sunday")

summary(store05_01$stores.M01)
summary(store05_02$stores.M01)
summary(store05_03$stores.M01)
summary(store05_04$stores.M01)
summary(store05_05$stores.M01)
summary(store05_06$stores.M01)
summary(store05_07$stores.M01)
