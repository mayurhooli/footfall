promos <- read.csv("./Promo_Index.csv")

for(i in 5:ncol(promos)){
  for(j in 1:nrow(promos)){
    a <- as.integer(as.Date(promos[j,i], format = "%m/%d/%Y"))
    b <- as.integer(as.Date(promos[j,2], format = "%m/%d/%Y"))
    c <- as.integer(as.Date(promos[j,3], format = "%m/%d/%Y"))
    if((a - b) >= 0){
      if((c - a) >= 0){
		    promos[j,i] <- (a - b + 1) / (promos[j,4]+1)
      }else{
		    promos[j,i] <- 0
	    }
    }else{
      promos[j,i] <- 0
    }
  }
}