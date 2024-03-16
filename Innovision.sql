 -- DROP EXISTING TABLES
DROP TABLE customers;
DROP TABLE orders;
DROP TABLE shippings;

/*Given a CSV file from the website, we can first import it a flat file into SQL server. Then we can define the column name, type and length, ensuring data will be reported #in the same format. THe SQL command can be seen below. 

#CREATE TEMPORARY TABLE cvstable

LOAD DATA INFILE 'PathToCSVFile'
INTO TABLE cvstable
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;*/

CREATE TABLE ORDERS
 ( OrderNumber CHAR(9),
  OrderDate DATE,
  CustomerID CHAR(9),
  Address VARCHAR(15) NOT NULL,
  University VARCHAR(15) NOT NULL,
  TotalPrice DECIMAL(5,2),
  PRIMARY KEY (OrderNumber),
  FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID));
 
CREATE TABLE CUSTOMERS
( CustomerID CHAR(9),
  CustomerName VARCHAR(15) NOT NULL,
 PRIMARY KEY (CustomerID));
  
CREATE TABLE ORDERITEMS
( CustomerID CHAR(9),
   OrderNumber CHAR(9),
   ItemName VARCHAR(15) NOT NULL,
  Price DECIMAL(5,2));


  --Insert data--
  
  INSERT into CUSTOMERS values("0001","James Montgomery"), 
  ("0002", "Molly Patterson"), 
  ("0003","Rory Alexander"), 
  ("0004","Freddie Hay"), 
  ("0005","Scarlett Johnson"), 
  ("0006","Quentin Conncannon");


  INSERT into ORDERS values 
  ("1", "2023-03-20", "0002", "10 Bread Street", "Bath University", 4.7),
  ("2", "2023-03-20", "0003", "10 Bread Street", "Bath University", 4.15),
  ("3", "2023-03-22", "0004", "1 Gibbet Hill Road", "Durham University", 3.05),
  ("4", "2023-03-22", "0006", "1 Gibbet Hill Road", "Durham University", 7.25),
  ("5", "2023-03-23", "0001", "23 Common Street", "University of Exeter", 6.30),
  ("6", "2023-03-23", "0005", "21 Common Street", "University of Exeter", 9.50);


  INSERT into ORDERITEMS values 
("0002", "1", "Blueberries (150g)", 1.80),
("0002", "1", "Lemon (Loose)", 0.30),
("0002", "1", "Lemon (Loose)", 0.30),
("0002", "1", "Tesco Finest All Butter Croissants (4 pack)", 2.30),

("0003", "2", "Large Pink Apple (Loose)", 0.65),
("0003", "2", "Large Pink Apple (Loose)", 0.65),
("0003", "2", "Large Pink Apple (Loose)", 0.65),
("0003", "2", "Tesco Finest All Butter Croissants (8 pack)", 2.20),

("0004", "3", "Lemon (Loose)", 0.30),
("0004", "3", "Savoy Cabbage (Each)", 0.75),
("0004", "3", "Savoy Cabbage (Each)", 0.75),
("0004", "3", "Large Pink Apple (Loose)", 0.65),
("0004", "3", "Lemon (Loose)", 0.30),
("0004", "3", "Lemon (Loose)", 0.30),


("0006", "4", "Tesco Finest All Butter Croissants (8 pack)", 2.20),
("0006", "4", "Tesco Finest All Butter Croissants (8 pack)", 2.20),
("0006", "4", "Tesco Finest All Butter Croissants (8 pack)", 2.20),
("0006", "4", "Lemons (Pack of 4)", 0.65),


("0001", "5", "Tesco Finest All Butter Croissants (4 pack)", 2.30),
("0001", "5", "Large Pink Apple (Loose)", 0.65),
("0001", "5", "Large Pink Apple (Loose)", 0.65),
("0001", "5", "Large Pink Apple (Loose)", 0.65),
("0001", "5", "Large Pink Apple (Loose)", 0.65),
("0001", "5", "Large Pink Apple (Loose)", 0.65),
("0001", "5", "Savoy Cabbage (Each)", 0.75),


("0005", "6", "Blueberry Muffins", 1.80),
("0005", "6", "Blueberry Muffins", 1.80),
("0005", "6", "Blueberry Muffins", 1.80),
("0005", "6", "Blueberry Muffins", 1.80),
("0005", "6", "Tesco Finest All Butter Croissants (4 pack)", 2.30);

SELECT ItemName, COUNT(*) AS OrderCount
FROM ORDERITEMS
GROUP BY ItemName
ORDER BY OrderCount DESC
LIMIT 1;

SELECT University, ItemName, COUNT(*) AS OrderCount
FROM ORDERS 
JOIN ORDERITEMS ON ORDERS.OrderNumber = ORDERITEMS.OrderNumber
GROUP BY University, ItemName
ORDER BY University, OrderCount DESC;