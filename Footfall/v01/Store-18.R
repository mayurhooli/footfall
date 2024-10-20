#####Store Data#####
store18 <- data.frame(event, stores$MG1)
plot(store18$stores.MG1, type = "l")

write.csv(store18, "./Data//Stores//Store-02.csv")

#####Exploration#####
store18_01 <- subset(store18, store18$Weekday == "Monday")
store18_02 <- subset(store18, store18$Weekday == "Tuesday")
store18_03 <- subset(store18, store18$Weekday == "Wednesday")
store18_04 <- subset(store18, store18$Weekday == "Thursday")
store18_05 <- subset(store18, store18$Weekday == "Friday")
store18_06 <- subset(store18, store18$Weekday == "Saturday")
store18_07 <- subset(store18, store18$Weekday == "Sunday")

summary(store18_01$stores.UB1)
summary(store18_02$stores.UB1)
summary(store18_03$stores.UB1)
summary(store18_04$stores.UB1)
summary(store18_05$stores.UB1)
summary(store18_06$stores.UB1)
summary(store18_07$stores.UB1)
