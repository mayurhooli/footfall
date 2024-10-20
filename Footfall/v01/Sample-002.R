library(RJDBC)

rm(list = ls())
driver <- JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver","E:\\Current Projects\\Sharaf DG\\sqljdbc4-2.0.jar")
connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")

sqlText1 <- paste("select * from [qSmDEkwNCqERyAa].[sh_footfall]")
footfall <- dbGetQuery(connection, sqlText1)
write.xlsx(footfall, "./Data//Platform2//Footfall.xlsx", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText2 <- paste("select * from [qSmDEkwNCqERyAa].[sh_location]")
location <- dbGetQuery(connection, sqlText2)
write.xlsx(location, "./Data//Platform2//Location.xlsx", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText3 <- paste("select * from [qSmDEkwNCqERyAa].[sh_mobile]")
mobile <- dbGetQuery(connection, sqlText3)
write.xlsx(mobile, "./Data//Platform2//Mobile.xlsx", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText4 <- paste("select * from [qSmDEkwNCqERyAa].[sh_nrs]")
nrs <- dbGetQuery(connection, sqlText4)
write.xlsx(nrs, "./Data//Platform2//NRS.xlsx", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText5 <- paste("select * from [qSmDEkwNCqERyAa].[sh_om_sales]")
sales <- dbGetQuery(connection, sqlText5)
write.csv(sales, "./Data//Platform2//Sales.csv", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText6 <- paste("select * from [qSmDEkwNCqERyAa].[sh_product]")
product <- dbGetQuery(connection, sqlText6)
write.xlsx(product, "./Data//Platform2//Product.xlsx", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText7 <- paste("select * from [qSmDEkwNCqERyAa].[sh_promo]")
promo <- dbGetQuery(connection, sqlText7)
write.csv(promo, "./Data//Platform2//Promo.csv", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText8 <- paste("select * from [qSmDEkwNCqERyAa].[sh_sales]")
sale <- dbGetQuery(connection, sqlText8)
write.csv(sale, "./Data//Platform2//Sale.csv", row.names = FALSE)

connection <- dbConnect(driver, "jdbc:sqlserver://tatdemo.cloudapp.net:57784;databaseName=TENANTDB", "hhMvrFrEgzpmhnf", "brSbXXbCngdymqCz5oA123")
sqlText9 <- paste("select * from [qSmDEkwNCqERyAa].[sh_website]")
website <- dbGetQuery(connection, sqlText9)
write.xlsx(website, "./Data//Platform2//Website.xlsx", row.names = FALSE)
