CREATE DATABASE InventoryManagementSystem;

USE InventoryManagementSystem;

CREATE TABLE Supplier (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Category VARCHAR(100),
    StockLevel INT DEFAULT 0,
    ReorderLevel INT DEFAULT 0,
    PricePerUnit DECIMAL(10, 2) NOT NULL
);

CREATE TABLE PurchaseOrder (
    PurchaseOrderID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT,
    Date DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE PurchaseOrderDetail (
    PurchaseOrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseOrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder(PurchaseOrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Sale (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    CustomerName VARCHAR(255),
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE SaleDetail (
    SaleDetailID INT AUTO_INCREMENT PRIMARY KEY,
    SaleID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SaleID) REFERENCES Sale(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
