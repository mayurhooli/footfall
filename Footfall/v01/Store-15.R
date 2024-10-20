#####Store Data#####
store15 <- data.frame(event, stores$CM1)
plot(store15$stores.CM1, type = "l")

write.csv(store15, "./Data//Stores//Store-02.csv")

#####Exploration#####
store15_01 <- subset(store15, store15$Weekday == "Monday")
store15_02 <- subset(store15, store15$Weekday == "Tuesday")
store15_03 <- subset(store15, store15$Weekday == "Wednesday")
store15_04 <- subset(store15, store15$Weekday == "Thursday")
store15_05 <- subset(store15, store15$Weekday == "Friday")
store15_06 <- subset(store15, store15$Weekday == "Saturday")
store15_07 <- subset(store15, store15$Weekday == "Sunday")

summary(store15_01$stores.CM1)
summary(store15_02$stores.CM1)
summary(store15_03$stores.CM1)
summary(store15_04$stores.CM1)
summary(store15_05$stores.CM1)
summary(store15_06$stores.CM1)
summary(store15_07$stores.CM1)
