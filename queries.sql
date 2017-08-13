--SECTION 2 USER MANUAL SQL QUERIES


#find all the titles of all books by Pratchett that cost less than $10

SELECT Title
FROM BOOKS, AUTHOR, WRITES
WHERE price < 10 AND Last_Name='Pratchett' AND ISBN=Book_ID AND Auth_Id=Author_ID;


#Give all the titles and their dates of purchase made by a single customer whose Customer ID is 100

SELECT purchase_date, Title
FROM BOOKS, IS_ORDERED, PURCHASE, CUSTOMER
WHERE ISBN=BookID AND Purchase_ID=PurchaseID AND Cust_ID=Customer_ID AND Customer_ID=100;
	

#Find the titles and ISBNs for all books with less than 5 copies in stock

SELECT Title, ISBN
FROM BOOKS
WHERE Inventory < 5;


#Give all the customers who purchase a book by Pratchett and the titles of Pratchett books they purchased

SELECT Title, c_last_name, c_first_name
FROM AUTHOR, WRITES, BOOKS, IS_ORDERED, PURCHASE, CUSTOMER
WHERE Author_ID=Auth_ID AND ISBN=Book_Id AND Last_Name='Pratchett' AND BookID=ISBN AND PurchaseID=Purchase_ID AND Customer_ID=Cust_ID;


#Find the total number of books purchased by a single customer whose Customer ID is 100

SELECT Quantity_Purchased
FROM CUSTOMER
WHERE Customer_ID = 100;


#Find the customer who purchased the most books and the total number of books they have purchased

SELECT Quantity_Purchased, C_Last_Name, C_First_Name
FROM CUSTOMER                                                              
WHERE Quantity_Purchased= (SELECT MAX(Quantity_Purchased) from Customer);
	

#Find the title and year of all the five star rated books

SELECT Title, Year
FROM BOOKS
WHERE Rating = 5;


#Find the title of all books published by Perennial

SELECT Title
FROM BOOKS, PUBLISHER
WHERE CompanyName='Perennial' AND Pub_ISBN=ISBN;


#Find all the genres each author writes for

SELECT First_Name, Last_Name, Category
FROM AUTHOR, WRITES, BOOKS
WHERE Author_ID=Auth_ID AND ISBN=Book_ID
GROUP BY First_Name;


#Provide a list of customer names, along with the total dollar amount each customer has spent

SELECT C_First_Name, C_Last_Name, SUM(Cost)
FROM CUSTOMER, PURCHASE
WHERE Customer_ID = Cust_ID 
group by Customer_ID;  


#Provide a list the customer names and their email address for who those who spent more than the average customer

SELECT c_first_name, c_last_name, email
FROM CUSTOMER, (
SELECT AVG(money_spent) as avg_spent
FROM CUSTOMER)
WHERE money_spent > avg_spent;


#Provide a list of the titles in the database and the associated total copies sold to customers, sorted from the title that has sold the most individual copies to the title that has sold the least

SELECT Title, sum(Quantity) 
FROM BOOKS, IS_ORDERED, PURCHASE
WHERE ISBN=BookID AND PurchaseID=Purchase_ID
Group by ISBN 
order by sum(Quantity) desc;


#Provide a list of the titles in the database and the associated total copies sold to customers, sorted from the title that has sold the highest dollar amount to the title that has sold the smallest

SELECT Title, sum(Cost)
FROM BOOKS, IS_ORDERED, PURCHASE
WHERE ISBN=BookID AND PurchaseID= Purchase_ID
GROUP BY ISBN
ORDER BY sum(Cost) desc;


#Find the most popular author in the database (i.e. the one who has sold the most books)

SELECT Last_Name, First_Name, Sum(Quantity)
FROM AUTHOR, WRITES, BOOKS, IS_ORDERED, PURCHASE
WHERE Author_ID = Auth_ID AND Book_ID= ISBN AND ISBN=BookID AND PurchaseID=Purchase_ID
GROUP BY ISBN
ORDER BY Sum(Quantity) desc
LIMIT 1;


#Provide the most profitable author in the database for this store (i.e. the one who has brought in the most money)

SELECT Last_Name, First_Name, Sum(Cost)
FROM AUTHOR, WRITES, BOOKS, IS_ORDERED, PURCHASE
WHERE Author_ID = Auth_ID AND Book_ID= ISBN AND ISBN=BookID AND PurchaseID=Purchase_ID
GROUP BY Author_ID
ORDER BY Sum(Cost) desc
LIMIT 1;


#Provide a list of customer information for customers who purchased anything written by the most profitable author in the database

SELECT C_Last_Name, C_First_Name, Title
FROM CUSTOMER, PURCHASE, IS_ORDERED, BOOKS, WRITES, (
SELECT Author_ID, Sum(Cost)
FROM AUTHOR, WRITES, BOOKS, IS_ORDERED, PURCHASE
WHERE Author_ID = Auth_ID AND Book_ID= ISBN AND ISBN=BookID AND PurchaseID=Purchase_ID
GROUP BY Author_ID
ORDER BY Sum(Cost) desc
LIMIT 1)
WHERE ISBN=BookID AND PurchaseID= Purchase_ID AND Customer_ID=Cust_ID AND Author_ID = Auth_ID AND Book_ID= ISBN;


#Provide the list of authors who wrote the books purchased by the customers who have spent more than the average customer

SELECT last_name, first_name
FROM AUTHOR, WRITES, BOOKS, IS_ORDERED, PURCHASE, (
SELECT Customer_ID
FROM CUSTOMER, (
SELECT AVG(money_spent) as avg_spent
FROM CUSTOMER)
WHERE money_spent > avg_spent)
WHERE Author_ID = Auth_ID AND Book_ID= ISBN AND ISBN=BookID AND PurchaseID=Purchase_ID AND Cust_ID=Customer_ID;