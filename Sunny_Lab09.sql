REM   Script: Lab09
REM   Sara Sunny

CREATE TABLE Customers  
(  
    CustomerID int PRIMARY KEY,  
    Customername varchar2(255),  
    Address varchar2(255),  
    City varchar2(255),  
    PostalCode varchar2(255),  
    Country varchar2(255)  
);

CREATE TABLE Employees  
(  
    EmployeeID int PRIMARY KEY,  
    LastName varchar2(255),  
    FirstName varchar2(255),  
    BirthDate DATE  
);

CREATE TABLE Categories  
(  
    CategoryID int PRIMARY KEY,  
    CategoryName varchar2(255),  
    Description varchar2(1255)  
);

CREATE TABLE Products  
(  
    ProductID int PRIMARY KEY,  
    ProductName varchar2(255),  
    CategoryID int,  
    Unit varchar2 (255),  
    Price int  
);

CREATE TABLE Orders  
(  
    OrderID int PRIMARY KEY,  
    CustomerID int,  
    EmployeeID int,  
    OrderDate Date  
);

CREATE TABLE OrderDetails  
(  
    OrderID int,  
    ProductID int,  
    Quantity int  
);

INSERT INTO CUSTOMERS   
VALUES (1, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', '12209', 'Germany');

INSERT INTO CUSTOMERS   
VALUES (2, 'Ana Trujillo Emparedados', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico');

INSERT INTO CUSTOMERS   
VALUES (3, 'Antonio Moreno Taqueria', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico');

INSERT INTO EMPLOYEES   
VALUES (1, 'Davolio', 'Nancy', '08-DEC-1968');

INSERT INTO EMPLOYEES   
VALUES (2, 'Fuller', 'Andrew', '19-FEB-1952');

INSERT INTO CATEGORIES   
VALUES (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales');

INSERT INTO CATEGORIES   
VALUES (2, 'Condiments', 'Sweet and savory sauces');

INSERT INTO CATEGORIES   
VALUES (3, 'Confections', 'Desserts, candies, and sweet breads');

INSERT INTO PRODUCTS   
VALUES (1, 'Chais', 1, '10 boxes x 20 bags', 18);

INSERT INTO PRODUCTS   
VALUES (2, 'Chang', 1, '24 - 12 oz bottles', 19);

INSERT INTO PRODUCTS   
VALUES (3, 'Aniseed Syrup',	2, '12 - 550 ml bottles', 10);

INSERT INTO ORDERS  
VALUES (10248, 90, 5, '04-JUL-1996');

INSERT INTO ORDERS  
VALUES (10249, 81, 6, '05-JUL-1996');

INSERT INTO ORDERS  
VALUES (10250, 34, 4, '08-JUL-1996');

INSERT INTO ORDERDETAILS  
VALUES (10248, 11, 12);

INSERT INTO ORDERDETAILS  
VALUES (10248, 42, 10);

INSERT INTO ORDERDETAILS  
VALUES (10248, 72, 5);

INSERT INTO ORDERDETAILS  
VALUES (10249, 14, 9);

INSERT INTO ORDERDETAILS  
VALUES (10249, 51, 40);

INSERT INTO ORDERDETAILS  
VALUES (10250, 41, 10);

UPDATE ORDERS  
SET CustomerID = 1, EmployeeID = 1   
WHERE OrderID = 10248;

UPDATE ORDERS  
SET CustomerID = 1, EmployeeID = 2   
WHERE OrderID = 10249;

UPDATE ORDERS  
SET CustomerID = 2, EmployeeID = 2   
WHERE OrderID = 10250;

UPDATE ORDERDETAILS  
SET ProductID = 1  
WHERE OrderID = 10248 AND Quantity = 12;

UPDATE ORDERDETAILS  
SET ProductID = 2  
WHERE OrderID = 10248 AND Quantity = 10;

UPDATE ORDERDETAILS  
SET ProductID = 3  
WHERE OrderID = 10248 AND Quantity = 5;

UPDATE ORDERDETAILS  
SET ProductID = 1  
WHERE OrderID = 10249 AND Quantity = 9;

UPDATE ORDERDETAILS  
SET ProductID = 2  
WHERE OrderID = 10249 AND Quantity = 40;

UPDATE ORDERDETAILS  
SET ProductID = 1  
WHERE OrderID = 10250 AND Quantity = 10;

ALTER TABLE Products  
ADD CONSTRAINT c1   
	FOREIGN KEY (CategoryID)  
	REFERENCES Categories (CategoryID);

ALTER TABLE Orders  
ADD CONSTRAINT c2  
	FOREIGN KEY (CustomerID)  
	REFERENCES Customers(CustomerID);

ALTER TABLE Orders  
ADD CONSTRAINT c3  
	FOREIGN KEY (EmployeeID)  
	REFERENCES Employees(EmployeeID);

ALTER TABLE OrderDetails  
ADD CONSTRAINT c4  
	FOREIGN KEY (OrderID)  
	REFERENCES Orders(OrderID);

ALTER TABLE OrderDetails  
ADD CONSTRAINT c5  
	FOREIGN KEY (ProductID)  
	REFERENCES Products(ProductID);

ALTER TABLE OrderDetails  
ADD CONSTRAINT c6  
    PRIMARY KEY (OrderID, ProductID);

SELECT * FROM Products;

SELECT * FROM OrderDetails  
    WHERE Quantity > 10;

SELECT ProductID, ProductName 
    FROM Products 
    WHERE Price > 15  
    AND CategoryID = 1;

SELECT * FROM Customers 
    CROSS JOIN Employees;

SELECT * FROM OrderDetails 
	NATURAL JOIN Orders;

SELECT * FROM Products 
	INNER JOIN Categories 
	ON Products.CategoryID = Categories.CategoryID;

SELECT * FROM Products 
	LEFT JOIN Categories 
	ON Products.CategoryID = Categories.CategoryID;

SELECT * FROM Products 
	RIGHT JOIN Categories 
	ON Products.CategoryID = Categories.CategoryID;

