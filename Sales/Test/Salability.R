promo <- read.csv("./Data/Sales_v03/Cooling_v03.csv")


#####Promo or Not#####
# nopromo <- subset(cooling, PROMO.CODE == "")
# promo <- subset(cooling, PROMO.CODE != "")


#####Salability#####
SALE <- promo$INDEX * promo$SII_QUANTITY
MKI <- promo$MARKET * promo$SII_QUANTITY
promo <- cbind(promo, SALE, MKI)
promo <- data.frame(aggregate(.~SI_DATE, data = promo, FUN = sum))
promo <- promo[-c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20)]
promo$SALE <- promo$SALE/promo$SII_QUANTITY
promo$MKI <- promo$MKI/promo$SII_QUANTITY
promo <- promo[order(as.Date(promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]
write.csv(promo, "./1234.csv")
