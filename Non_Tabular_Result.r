### Connect to Database ###

conn <- dbConnect(RSQLite::SQLite(),"CarsDB.db")

### write mtcars data in the table ###

dbWriteTable(conn, "cars_table", mtcars)

### list all the tables available in the database ###

dbListTables(conn)

### Quick access functions ###

dbListFields(conn, "cars_table")
dbReadTable(conn, "cars_table")

dbReadTable(conn, "cars_table")

rdd <- dbReadTable(conn, "cars_table")

dbDisconnect(conn)

### how to query data by using SQL ###

dbGetQuery(conn,"select * from cars_table limit 10")

dbGetQuery(conn,"select car_names, hp, cyl from cars_table where 
           car_names like 'M%' and cyl in (6,8)")

dbGetQuery(conn,"select car_names as 'car h', hp, cyl from cars_table where 
           car_names like 'M%' and cyl in (6,8)")

###==============Non Tabular Result==========================================###

###See table by this query ###
dbGetQuery(conn,"select * from cars_table limit 10")

###delete 1 record using dbexecute function ### 
dbExecute(conn,"delete from cars_table where car_names = 'Mazda RX4'")

### insert 1 record using this dbexecute function ###
dbExecute(conn, "INSERT INTO cars_table VALUES 
(21.0,6,160.0,110,3.90,2.620,16.46,0,1,4,4,'Mazda RX4')")

### now we check inserted record by query ###
dbGetQuery(conn,"select * from cars_table")

dbGetQuery(conn,"select * from cars_table where car_names = 'Mazda RX4' ")

### SQLite other functions ###

### you can fetch all results ###
dbSendQuery(conn,"select * from cars_table where cyl = 6")
res <- dbSendQuery(conn,"select * from cars_table where cyl = 6")
dbFetch(res)

dbClearResult(res)


res <- dbSendQuery(conn,"select * from cars_table where cyl = 6")
while (!dbHasCompleted(res)) {
     chunk <- dbFetch(res, n = 5)
     print(nrow(chunk))
}

res     

dbClearResult(res)

res <- dbSendQuery(conn,"select * from cars_table where cyl = 8")
while (!dbHasCompleted(res)) {
     chunk <- dbFetch(res, n = 5)
     print(nrow(chunk))
}

res     

dbClearResult(res)

dbDisconnect(conn)

