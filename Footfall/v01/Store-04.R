#####Store Data#####
store04 <- data.frame(event, stores$DM1)
plot(store04$stores.DM1, type = "l")
write.csv(store04, "./Data//Stores//Store-04.csv")


#####Exploration#####
store04_01 <- subset(store04, store04$Weekday == "Monday")
store04_02 <- subset(store04, store04$Weekday == "Tuesday")
store04_03 <- subset(store04, store04$Weekday == "Wednesday")
store04_04 <- subset(store04, store04$Weekday == "Thursday")
store04_05 <- subset(store04, store04$Weekday == "Friday")
store04_06 <- subset(store04, store04$Weekday == "Saturday")
store04_07 <- subset(store04, store04$Weekday == "Sunday")

summary(store04_01$stores.DM1)
summary(store04_02$stores.DM1)
summary(store04_03$stores.DM1)
summary(store04_04$stores.DM1)
summary(store04_05$stores.DM1)
summary(store04_06$stores.DM1)
summary(store04_07$stores.DM1)
