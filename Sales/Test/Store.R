stores <- read.xlsx("./Analysis//Stores.xlsx", 1)

filer <- data.frame()
df <- (summary(stores[i]))
df <- data.frame(df)
filer <- rbind.fill(filer,df)
filer <- data.frame(t(filer[,-c(1,2)]))

for(i in 4:ncol(stores)){
  df <- (summary(stores[i]))
  df <- data.frame(df)
  filer <- rbind.fill(filer,df)
  filer <- filer[,-c(1,2)]
}