ha_sales <- read.csv("./HA_Sales.csv")


#####Store Variables#####
stored <- ha_sales[c(1,3)]
storemelt <- melt(stored, id = c("SI_DATE", "ï..LOC_CODE"))
storemelt$Value <- 1
storecast <- cast(storemelt, SI_DATE~ï..LOC_CODE)
storecast[is.na(storecast)] <- 0
rm(stored, storemelt)
storecast <- storecast[order(as.Date(storecast$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]


#####Promo or Not#####
nopromo <- subset(ha_sales, PROMO.CODE == "")
promo <- subset(ha_sales, PROMO.CODE != "")


#####Cooling#####
cooling_promo <- subset(promo, GROUP_DESC == "Cooling")
cooling_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR+PROMO.CODE, data = cooling_promo, FUN = sum))
cooling_promo <- cooling_promo[c(1,2,3,4,14,16)]
cooling_promo$PROMO.CODE <- 1
cooling_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = cooling_promo, FUN = sum))
cooling_promo <- cooling_promo[order(as.Date(cooling_promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]

cooling_np <- subset(nopromo, GROUP_DESC == "Cooling")
cooling_np <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = cooling_np, FUN = sum))
cooling_np <- cooling_np[c(1,2,3,13,15)]
cooling_np <- cooling_np[order(as.Date(cooling_np$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]


#####Dishwasher#####
dishwasher_promo <- subset(promo, GROUP_DESC == "Dishwasher")
dishwasher_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR+PROMO.CODE, data = dishwasher_promo, FUN = sum))
dishwasher_promo <- dishwasher_promo[c(1,2,3,4,14,16)]
dishwasher_promo$PROMO.CODE <- 1
dishwasher_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = dishwasher_promo, FUN = sum))
dishwasher_promo <- dishwasher_promo[order(as.Date(dishwasher_promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]

dishwasher_np <- subset(nopromo, GROUP_DESC == "Dishwasher")
dishwasher_np <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = dishwasher_np, FUN = sum))
dishwasher_np <- dishwasher_np[c(1,2,3,13,15)]
dishwasher_np <- dishwasher_np[order(as.Date(dishwasher_np$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]


#####Floor Care#####
floorcare_promo <- subset(promo, GROUP_DESC == "Floor Care")
floorcare_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR+PROMO.CODE, data = floorcare_promo, FUN = sum))
floorcare_promo <- floorcare_promo[c(1,2,3,4,14,16)]
floorcare_promo$PROMO.CODE <- 1
floorcare_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = floorcare_promo, FUN = sum))
floorcare_promo <- floorcare_promo[order(as.Date(floorcare_promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]

floorcare_np <- subset(nopromo, GROUP_DESC == "Floor Care")
floorcare_np <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = floorcare_np, FUN = sum))
floorcare_np <- floorcare_np[c(1,2,3,13,15)]
floorcare_np <- floorcare_np[order(as.Date(floorcare_np$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]


#####Home Comfort#####
homecomfort_promo <- subset(promo, GROUP_DESC == "Home Comfort")
homecomfort_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR+PROMO.CODE, data = homecomfort_promo, FUN = sum))
homecomfort_promo <- homecomfort_promo[c(1,2,3,4,14,16)]
homecomfort_promo$PROMO.CODE <- 1
homecomfort_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = homecomfort_promo, FUN = sum))
homecomfort_promo <- homecomfort_promo[order(as.Date(homecomfort_promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]

homecomfort_np <- subset(nopromo, GROUP_DESC == "Home Comfort")
homecomfort_np <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = homecomfort_np, FUN = sum))
homecomfort_np <- homecomfort_np[c(1,2,3,13,15)]
homecomfort_np <- homecomfort_np[order(as.Date(homecomfort_np$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]


#####Kitchen Appliances#####
kitchen_promo <- subset(promo, GROUP_DESC == "Kitchen Applicances")
kitchen_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR+PROMO.CODE, data = kitchen_promo, FUN = sum))
kitchen_promo <- kitchen_promo[c(1,2,3,4,14,16)]
kitchen_promo$PROMO.CODE <- 1
kitchen_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = kitchen_promo, FUN = sum))
kitchen_promo <- kitchen_promo[order(as.Date(kitchen_promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]

kitchen_np <- subset(nopromo, GROUP_DESC == "Kitchen Applicances")
kitchen_np <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = kitchen_np, FUN = sum))
kitchen_np <- kitchen_np[c(1,2,3,13,15)]
kitchen_np <- kitchen_np[order(as.Date(kitchen_np$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]


#####Laundry#####
laundry_promo <- subset(promo, GROUP_DESC == "Laundry")
laundry_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR+PROMO.CODE, data = laundry_promo, FUN = sum))
laundry_promo <- laundry_promo[c(1,2,3,4,14,16)]
laundry_promo$PROMO.CODE <- 1
laundry_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = laundry_promo, FUN = sum))
laundry_promo <- laundry_promo[order(as.Date(laundry_promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]

laundry_np <- subset(nopromo, GROUP_DESC == "Laundry")
laundry_np <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = laundry_np, FUN = sum))
laundry_np <- laundry_np[c(1,2,3,13,15)]
laundry_np <- laundry_np[order(as.Date(laundry_np$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]


#####Personal Care#####
personalcare_promo <- subset(promo, GROUP_DESC == "Personal Care")
personalcare_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR+PROMO.CODE, data = personalcare_promo, FUN = sum))
personalcare_promo <- personalcare_promo[c(1,2,3,4,14,16)]
personalcare_promo$PROMO.CODE <- 1
personalcare_promo <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = personalcare_promo, FUN = sum))
personalcare_promo <- personalcare_promo[order(as.Date(personalcare_promo$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]

personalcare_np <- subset(nopromo, GROUP_DESC == "Personal Care")
personalcare_np <- data.frame(aggregate(.~SI_DATE+WEEK+YEAR, data = personalcare_np, FUN = sum))
personalcare_np <- personalcare_np[c(1,2,3,13,15)]
personalcare_np <- personalcare_np[order(as.Date(personalcare_np$SI_DATE, format = "%d-%b-%y")),,drop = FALSE]
