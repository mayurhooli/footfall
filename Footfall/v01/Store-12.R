#####Store Data#####
store12 <- data.frame(event, stores$AM1)
plot(store12$stores.AM1, type = "l")
write.csv(store12, "./Data//Stores//Store-12.csv")

#####Exploration#####
store12_01 <- subset(store12, store12$Weekday == "Monday")
store12_02 <- subset(store12, store12$Weekday == "Tuesday")
store12_03 <- subset(store12, store12$Weekday == "Wednesday")
store12_04 <- subset(store12, store12$Weekday == "Thursday")
store12_05 <- subset(store12, store12$Weekday == "Friday")
store12_06 <- subset(store12, store12$Weekday == "Saturday")
store12_07 <- subset(store12, store12$Weekday == "Sunday")

summary(store12_01$stores.AM1)
summary(store12_02$stores.AM1)
summary(store12_03$stores.AM1)
summary(store12_04$stores.AM1)
summary(store12_05$stores.AM1)
summary(store12_06$stores.AM1)
summary(store12_07$stores.AM1)
