#####Store Data#####
store10 <- data.frame(event, stores$MC1)
plot(store10$stores.MC1, type = "l")
write.csv(store10, "./Data//Stores//Store-10.csv")

#####Exploration#####
store10_01 <- subset(store10, store10$Weekday == "Monday")
store10_02 <- subset(store10, store10$Weekday == "Tuesday")
store10_03 <- subset(store10, store10$Weekday == "Wednesday")
store10_04 <- subset(store10, store10$Weekday == "Thursday")
store10_05 <- subset(store10, store10$Weekday == "Friday")
store10_06 <- subset(store10, store10$Weekday == "Saturday")
store10_07 <- subset(store10, store10$Weekday == "Sunday")

summary(store10_01$stores.MC1)
summary(store10_02$stores.MC1)
summary(store10_03$stores.MC1)
summary(store10_04$stores.MC1)
summary(store10_05$stores.MC1)
summary(store10_06$stores.MC1)
summary(store10_07$stores.MC1)
