--  Sales Store Ordering System

-- Table to store product information
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL DEFAULT 0
);

-- Table to store customer information
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20)
);

-- Table to store order information
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table to store individual items within an order
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    UnitPrice DECIMAL(10, 2) NOT NULL, -- Price of the product at the time of order
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductName, Price, StockQuantity) VALUES
('Laptop', 1200.50, 10),
('Mouse', 25.99, 50),
('Keyboard', 75.00, 30),
('Smartphone', 800.75, 20);

INSERT INTO Customers (CustomerName, ContactNumber) VALUES
('Gideon Kipngeno', '0712345678'),
('Brayan Cheruiyot', '0798765432');

INSERT INTO Orders (CustomerID) VALUES
(1), -- Order for Gideon Kipngeno
(2); -- Order for Brayan Cheruiyot

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1200.50), --Gideon ordered 1 Laptop
(2, 3, 1, 75.00),   -- Brayan ordered 1 Keyboard
