#####Store Data#####
store16 <- data.frame(event, stores$US1)
plot(store16$stores.US1, type = "l")

write.csv(store16, "./Data//Stores//Store-02.csv")

#####Exploration#####
store16_01 <- subset(store16, store16$Weekday == "Monday")
store16_02 <- subset(store16, store16$Weekday == "Tuesday")
store16_03 <- subset(store16, store16$Weekday == "Wednesday")
store16_04 <- subset(store16, store16$Weekday == "Thursday")
store16_05 <- subset(store16, store16$Weekday == "Friday")
store16_06 <- subset(store16, store16$Weekday == "Saturday")
store16_07 <- subset(store16, store16$Weekday == "Sunday")

summary(store16_01$stores.US1)
summary(store16_02$stores.US1)
summary(store16_03$stores.US1)
summary(store16_04$stores.US1)
summary(store16_05$stores.US1)
summary(store16_06$stores.US1)
summary(store16_07$stores.US1)
