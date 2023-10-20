# install packages
install.packages("sqldf")
# load the library
library("sqldf")
# read the csv file
Titanic_db <- read.csv("titanic.csv")

# view the dataset
# first few rows/observations of dataset
head(Titanic_db)
# last few rows/observations of dataset
tail(Titanic_db)

# using sqldf
# syntax: name <- sqldf("write a SQL query here")
query <- sqldf("select fare from Titanic_db")
head(query)

# connecting with SQL server management studio
# 1st step: install RODBC package for SQL connection
install.packages("RODBC")
# 2nd step: load the RODBC library
library(RODBC)

# 3rd step: list the connection
# syntax: 
#variable_name <- odbcConnect("connectionName",rows_at_time = 1)
db_conn <- odbcConnect("myDatabase", rows_at_time = 1)

# 4th step: write the query
# syntax: queryName <- "SQL Query goes here"
personQuery <- "select * from Person.Person"

# 5th step: execute the query
# syntax: name <- sqlQuery(connection, 
# query, stringAsFactors = FALSE)
personData <- sqlQuery(db_conn,
                       personQuery,
                       stringsAsFactors = FALSE)
# view the query result
head(personData)

# we can use SQL query result for data cleaning
# and data visualiztion
personData %>% 
  select(PersonType) %>% 
  ggplot(aes(PersonType)) +
  geom_bar()
  
# more queries
# Query 1: get firstname and lastname from person who received 0 email promotion (Person.Person)
# Query 2: What are the most popular products among customers? (will require JOIN) (Sales.SalesOrderDetail and Production.Product)
# Query 3: How many items with ListPrice more than $1000 have been sold? (Use JOIN) (sales.salesorderdetail and production.product)

# get the data for all person where person type is employee
# 6th step: close the connection
odbcClose(db_conn)