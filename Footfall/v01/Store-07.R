#####Store Data#####
store07 <- data.frame(event, stores$AD123)
plot(store07$stores.AD123, type = "l")
write.csv(store07, "./Data//Stores//Store-07.csv")

#####Exploration#####
store07_01 <- subset(store07, store07$Weekday == "Monday")
store07_02 <- subset(store07, store07$Weekday == "Tuesday")
store07_03 <- subset(store07, store07$Weekday == "Wednesday")
store07_04 <- subset(store07, store07$Weekday == "Thursday")
store07_05 <- subset(store07, store07$Weekday == "Friday")
store07_06 <- subset(store07, store07$Weekday == "Saturday")
store07_07 <- subset(store07, store07$Weekday == "Sunday")

summary(store07_01$stores.AD123)
summary(store07_02$stores.AD123)
summary(store07_03$stores.AD123)
summary(store07_04$stores.AD123)
summary(store07_05$stores.AD123)
summary(store07_06$stores.AD123)
summary(store07_07$stores.AD123)
