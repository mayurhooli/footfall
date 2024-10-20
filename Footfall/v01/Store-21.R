#####Store Data#####
store21 <- data.frame(event, stores$KS1)
plot(store21$stores.KS1, type = "l")

write.csv(store21, "./Data//Stores//Store-02.csv")

#####Exploration#####
store21_01 <- subset(store21, store21$Weekday == "Monday")
store21_02 <- subset(store21, store21$Weekday == "Tuesday")
store21_03 <- subset(store21, store21$Weekday == "Wednesday")
store21_04 <- subset(store21, store21$Weekday == "Thursday")
store21_05 <- subset(store21, store21$Weekday == "Friday")
store21_06 <- subset(store21, store21$Weekday == "Saturday")
store21_07 <- subset(store21, store21$Weekday == "Sunday")

summary(store21_01$stores.KS1)
summary(store21_02$stores.KS1)
summary(store21_03$stores.KS1)
summary(store21_04$stores.KS1)
summary(store21_05$stores.KS1)
summary(store21_06$stores.KS1)
summary(store21_07$stores.KS1)
