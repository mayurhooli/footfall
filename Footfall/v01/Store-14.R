#####Store Data#####
store14 <- data.frame(event, stores$AA1)
plot(store14$stores.AA1, type = "l")

write.csv(store14, "./Data//Stores//Store-02.csv")

#####Exploration#####
store14_01 <- subset(store14, store14$Weekday == "Monday")
store14_02 <- subset(store14, store14$Weekday == "Tuesday")
store14_03 <- subset(store14, store14$Weekday == "Wednesday")
store14_04 <- subset(store14, store14$Weekday == "Thursday")
store14_05 <- subset(store14, store14$Weekday == "Friday")
store14_06 <- subset(store14, store14$Weekday == "Saturday")
store14_07 <- subset(store14, store14$Weekday == "Sunday")

summary(store14_01$stores.AA1)
summary(store14_02$stores.AA1)
summary(store14_03$stores.AA1)
summary(store14_04$stores.AA1)
summary(store14_05$stores.AA1)
summary(store14_06$stores.AA1)
summary(store14_07$stores.AA1)

