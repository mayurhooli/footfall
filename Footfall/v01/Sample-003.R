install.packages("reshape2")
library(reshape2)

mydata <- data.frame (id=1:4, time=c(1,2,1,2), x1=c(5,3,6,2), x2=c(6,5,1,4))
newdata <- data.frame(id=c(1,1,2,2,1,1,2,2), time=c(1,2,1,2,1,2,1,2),
                      variable=c("x1","x1","x1","x1","x2","x2","x2","x2"), 
                      value=c(5,3,6,2,6,5,1,4))

mdata <- melt(mydata, id = c("id", "time"))
subjmeans <- cast(mdata, id~variable, mean)
timemeans <- cast(mdata, time~variable, mean)
time2means <- dcast(mdata, time~variable, function(x) 1, fill = 0)

library(ade4)
time3 <- acm.disjonctif(timemeans)