#####Store Data#####
store17 <- data.frame(event, stores$UB1)
plot(store17$stores.UB1, type = "l")

write.csv(store17, "./Data//Stores//Store-02.csv")

#####Exploration#####
store17_01 <- subset(store17, store17$Weekday == "Monday")
store17_02 <- subset(store17, store17$Weekday == "Tuesday")
store17_03 <- subset(store17, store17$Weekday == "Wednesday")
store17_04 <- subset(store17, store17$Weekday == "Thursday")
store17_05 <- subset(store17, store17$Weekday == "Friday")
store17_06 <- subset(store17, store17$Weekday == "Saturday")
store17_07 <- subset(store17, store17$Weekday == "Sunday")

summary(store17_01$stores.UB1)
summary(store17_02$stores.UB1)
summary(store17_03$stores.UB1)
summary(store17_04$stores.UB1)
summary(store17_05$stores.UB1)
summary(store17_06$stores.UB1)
summary(store17_07$stores.UB1)
