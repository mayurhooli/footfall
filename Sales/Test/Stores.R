#####Read Data#####
store01 <- read.xlsx("./Data/Store_v06/Store01_I01.xlsx", 1)
store02 <- read.xlsx("./Data/Store_v06/Store02_D01.xlsx", 1)
store03 <- read.xlsx("./Data/Store_v06/Store03_T01.xlsx", 1)
store04 <- read.xlsx("./Data/Store_v06/Store04_DM1.xlsx", 1)
store05 <- read.xlsx("./Data/Store_v06/Store05_M01.xlsx", 1)
store06 <- read.xlsx("./Data/Store_v06/Store06_S01.xlsx", 1)
store07 <- read.xlsx("./Data/Store_v06/Store07_AD123.xlsx", 1)
store08 <- read.xlsx("./Data/Store_v06/Store08_B01.xlsx", 1)
store09 <- read.xlsx("./Data/Store_v06/Store09_IB1.xlsx", 1)
store10 <- read.xlsx("./Data/Store_v06/Store10_MC1.xlsx", 1)


#####Outlier Analysis#####
outer <- function(x){
  FootSum <- summary(x$I01_Footfall)
  out1 <- as.numeric(FootSum[2] - 1.5 * (FootSum[5] - FootSum[2]))
  out2 <- as.numeric(FootSum[5] + 1.5 * (FootSum[5] - FootSum[2]))
  for(i in 1:nrow(x)){
    if(x$I01_Footfall[i] > out2)
      x$I01_Footfall[i] <- out2
    if(x$I01_Footfall[i] < out1)
      x$I01_Footfall[i] <- out1
  }
  return(x)
}


#####Histogram#####
par(mfrow = c(2,2))
hist(store01$I01_Footfall)
hist(store02$I01_Footfall)
hist(store03$I01_Footfall)
hist(store04$I01_Footfall)

par(mfrow = c(1,2))
plot(store01$I01_Footfall, type = "l")
plot(store04$I01_Footfall, type = "l")