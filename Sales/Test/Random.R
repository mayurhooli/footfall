library(plyr)

# whys <- read.csv("./Secondary.csv")
# 
# beerus <- data.frame(aggregate(.~ï..S_ITEM_CODE+ITEM_NAME+COUNT,data = whys, FUN = mean))
# son_goku <- data.frame(aggregate(.~ï..S_ITEM_CODE+ITEM_NAME+COUNT,data = whys, FUN = max))
# vegeta <- data.frame(aggregate(.~ï..S_ITEM_CODE+ITEM_NAME+COUNT,data = whys, FUN = min))
# 
# write.csv(beerus, "./Mean.csv")
# write.csv(son_goku, "./Max.csv")
# write.csv(vegeta, "./Min.csv")



#####Store Data#####
store <- read.csv("./Analysis/HA_Sales.csv")
store01 <- subset(store, LOC_CODE == "BC1")
storer <- count(store01, c('Year','Week'))
storer <- data.frame(storer, NP = 0, P = 0)
store01np <- subset(store01, PROMO.CODE == "")
storernp <- count(store01np, c('Year','Week'))
j <- 1
for(i in 1:nrow(storer)){
  if(storer$Year[i]==storernp$Year[j] & storer$Week[i]==storernp$Week[j]){
    storer$NP[i] <- storernp$freq[j]
    j <- j+1
  }
}
store01p <- subset(store01, PROMO.CODE != "")
storerp <- count(store01p, c('Year','Week'))
j <- 1
for(i in 1:nrow(storer)){
  if(storer$Year[i]==storerp$Year[j] & storer$Week[i]==storerp$Week[j]){
    storer$P[i] <- storerp$freq[j]
    j <- j+1
  }
}
write.csv(storer, "./Stores.csv")



#####Store Data#####
storey <- data.frame()
store <- read.csv("./Analysis/HA_Sales.csv")
stored <- (1:nrow(store))
store <- cbind(stored, store)
storer <- subset(store, GROUP_DESC != "Floor Care" & GROUP_DESC != "Personal Care" & GROUP_DESC != "Laundry" & GROUP_DESC != "Kitchen Appliances" & GROUP_DESC != "Dishwasher"
                 & GROUP_DESC != "Clothes Care" & GROUP_DESC != "Cooking" & GROUP_DESC != "Cooking Built-In" & GROUP_DESC != "Cooling" & GROUP_DESC != "Cooling Built-In"
                 & GROUP_DESC != "Diswasher Built-In" & GROUP_DESC != "Home Comfort" & GROUP_DESC != "Laundry Built-In" & GROUP_DESC != "Kitchen Applicances")
storer$GROUP_DESC <- "Other"
storey <- rbind.fill(storey, storer)
storey <- read.csv("./HA_Sales.csv")
storey <- storey[order(storey$stored),]
storey <- storey[-1]
write.csv(storey, "./HA_Sales.csv", row.names = FALSE)
