values <- read.csv("./Item_Predictioner.csv")

values <- values[-c(1,2,3,5)]
values <- t(values)
values <- data.frame(values)

values <- values[-1,]

val <- values[-1]
val <- data.frame(aggregate(.~X2, data = val, FUN = sum))
write.csv(val, "./1234.csv")
