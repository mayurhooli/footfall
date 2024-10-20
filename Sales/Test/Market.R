sharaf <- read.csv("./Overall_Market.csv")

cooling <- subset(sharaf, Category == "Personal Care")
savg <- sum(cooling$SDG_Sales)/length(unique(cooling$Brand))
tavg <- sum(cooling$Market_Sales)/length(unique(cooling$Brand))
spavg <- sum(cooling$SDG_Total)/sum(cooling$SDG_Sales)
tpavg <- sum(cooling$Market_Total)/sum(cooling$Market_Sales)
share <- savg/tavg
reven <- spavg/tpavg
values <- c("Total", share, reven)

# for(i in 1:105){
#   val1 <- subset(cooling, Brand_Code == i)
#   Brand <- val1$Brand_Code[1]
#   if(nrow(val1) != 0){
#     s1 <- sum(val1$SDG_Sales)
#     t1 <- sum(val1$Market_Sales)
#     ind1 <- (s1/t1)/share
#     ind2 <- sum(val1$SDG_Total)/sum(val1$Market_Total)
#     val2 <- c(Brand, ind1,ind2)
#     values <- rbind(values,val2)
#   }
# }

write.csv(values, "./Personal Care.csv")
