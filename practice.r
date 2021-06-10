getwd()


fileurl <- "https://opendata.arcgis.com/api/v3/datasets/7055dbb02f0c4f14ab7ea3eb5ebfda42_0/downloads/data?format=csv&spatialRefId=4326"

download.file(fileurl, destfile = "cameras.csv", method = "curl")

list.files("./data")

dateDownload <- date()
dateDownload

str("cameras.csv")


cameraData <- read.table("cameras.csv", sep = ",", header = TRUE)
head(cameraData)

cdata <- read.csv("cameras.csv")


library(data.table)
data = fread("cameras.csv")

help("fread")

?fread

install.packages("xlsx")

library('xlsx')

cameraData1 <- read.xlsx("cameras.xlsx", sheetIndex = 1, header = TRUE)
head(cameraData1)

colIndex <- 2:3
rowIndex <- 1:5

cameraDataSubset <- read.xlsx("cameras.xlsx", sheetIndex = 1, header = TRUE, colIndex = colIndex, rowIndex = rowIndex)
cameraDataSubset

install.packages("readxl")
library('readxl')
readxl_example()

cameraData2 <- read_excel('cameras.xlsx')
head(cameraData2)

readxl_example("datasets.xlsx")
xlsx_example <- readxl_example("datasets.xlsx")

read_excel(xlsx_example)
dirs <- read_excel(xlsx_example)


install.packages("writexl")
library(writexl)

write_xlsx(cameraDataSubset, "cameras2.xlsx")


install.packages('openxlsx')
library(openxlsx)

###=========================WEB SCRAPPING====================================###

library(rvest)


theurl <- "https://en.wikipedia.org/wiki/Brazil_national_football_team"
file <- read_html(theurl)
tables <- html_nodes(file, "table")
table <- html_table(tables[4], fill = TRUE)

View(table)
print(table)

###=========================Reading Data From Databases======================###

install.packages("RSQLite")
library(RSQLite)
data("mtcars")
mtcars$car_names <- rownames(mtcars)
rownames(mtcars) <- c()
head(mtcars)
getwd()


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
