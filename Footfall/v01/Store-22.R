#####Store Data#####
store22 <- data.frame(event, stores$DS1)
plot(store22$stores.DS1, type = "l")

write.csv(store22, "./Data//Stores//Store-02.csv")

#####Exploration#####
store22_01 <- subset(store22, store22$Weekday == "Monday")
store22_02 <- subset(store22, store22$Weekday == "Tuesday")
store22_03 <- subset(store22, store22$Weekday == "Wednesday")
store22_04 <- subset(store22, store22$Weekday == "Thursday")
store22_05 <- subset(store22, store22$Weekday == "Friday")
store22_06 <- subset(store22, store22$Weekday == "Saturday")
store22_07 <- subset(store22, store22$Weekday == "Sunday")

summary(store22_01$stores.DS1)
summary(store22_02$stores.DS1)
summary(store22_03$stores.DS1)
summary(store22_04$stores.DS1)
summary(store22_05$stores.DS1)
summary(store22_06$stores.DS1)
summary(store22_07$stores.DS1)

