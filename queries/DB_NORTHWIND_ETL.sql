/*
	Autor: RenzoZ
	Objetivo: Crear las respectivas tablas del snowflake model propuesto para la recibir los datos del ETL incremental implementado
*/


CREATE DATABASE NORTHWIND_ETL
GO

USE NORTHWIND_ETL
GO

-- TABLA DIMSUPPLIERS
CREATE TABLE DimSuppliers
(
	SupplierID int IDENTITY(1,1) NOT NULL,
	CompanyName nvarchar(40) NOT NULL,
	ContactName nvarchar(30) NULL,
	ContactTitle nvarchar(30) NULL,
	Address nvarchar(60) NULL,
	City nvarchar(15) NULL,
	Region nvarchar(15) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(15) NULL,
	Phone nvarchar(24) NULL,
	Fax nvarchar(24) NULL,
	HomePage nvarchar(max) NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Suppliers
ALTER TABLE DimSuppliers
ADD CONSTRAINT PK_Suppliers PRIMARY KEY CLUSTERED (SupplierID)
GO




-- TABLA DIMCATEGORIES
CREATE TABLE DimCategories
(
	CategoryID int IDENTITY(1,1) NOT NULL,
	CategoryName nvarchar(15) NOT NULL,
	Description nvarchar(max) NULL,
	Picture image NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Categories
ALTER TABLE DimCategories
ADD CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (CategoryID)
GO




-- TABLA DIMPRODUCTS
CREATE TABLE DimProducts
(
	ProductID int IDENTITY(1,1) NOT NULL,
	ProductName nvarchar(40) NOT NULL,
	QuantityPerUnit nvarchar(20) NULL,
	UnitPrice money NULL,
	UnitsInStock smallint NULL,
	UnitsOnOrder smallint NULL,
	ReorderLevel smallint NULL,
	Discontinued bit NOT NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Products
ALTER TABLE DimProducts
ADD CONSTRAINT PK_Products PRIMARY KEY CLUSTERED (ProductID)
GO




-- TABLA DIMSHIPPERS
CREATE TABLE DimShippers
(
	ShipperID int IDENTITY(1,1) NOT NULL,
	CompanyName nvarchar(40) NOT NULL,
	Phone nvarchar(24) NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Shippers
ALTER TABLE DimShippers
ADD CONSTRAINT PK_Shippers PRIMARY KEY CLUSTERED (ShipperID)
GO




-- TABLA DIMCUSTOMERS
CREATE TABLE DimCustomers
(
	CustomerID nchar(5) NOT NULL,
	CompanyName nvarchar(40) NOT NULL,
	ContactName nvarchar(30) NULL,
	ContactTitle nvarchar(30) NULL,
	Address nvarchar(60) NULL,
	City nvarchar(15) NULL,
	Region nvarchar(15) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(15) NULL,
	Phone nvarchar(24) NULL,
	Fax nvarchar(24) NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Customers
ALTER TABLE DimCustomers
ADD CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED (CustomerID)
GO




-- TABLA DIMTERRITORIESREGIONS
CREATE TABLE DimTerritoriesRegions
(
	TerritoryID nvarchar(20) NOT NULL,
	TerritoryDescription nchar(50) NOT NULL,
	RegionDescription nchar(50) NOT NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Territories
ALTER TABLE DimTerritoriesRegions
ADD CONSTRAINT PK_Territories PRIMARY KEY CLUSTERED (TerritoryID)
GO




-- TABLA DIMEMPLOYEES
CREATE TABLE DimEmployees
(
	EmployeeID int IDENTITY(1,1) NOT NULL,
	LastName nvarchar(20) NOT NULL,
	FirstName nvarchar(10) NOT NULL,
	Title nvarchar(30) NULL,
	TitleOfCourtesy nvarchar(25) NULL,
	BirthDate datetime NULL,
	HireDate datetime NULL,
	Address nvarchar(60) NULL,
	City nvarchar(15) NULL,
	Region nvarchar(15) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(15) NULL,
	HomePhone nvarchar(24) NULL,
	Extension nvarchar(4) NULL,
	Photo image NULL,
	Notes nvarchar(max) NULL,
	ReportsTo int NULL,
	PhotoPath nvarchar(255) NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Employees
ALTER TABLE DimEmployees
ADD CONSTRAINT PK_Employees PRIMARY KEY CLUSTERED (EmployeeID)
GO




-- TABLA DIMEMPLOYEETERRITORIES
CREATE TABLE DimEmployeeTerritories
(
	EmployeeID int NOT NULL,
	TerritoryID nvarchar(20) NOT NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_EmployeeTerritories
ALTER TABLE DimEmployeeTerritories
ADD CONSTRAINT PK_EmployeeTerritories PRIMARY KEY CLUSTERED (EmployeeID, TerritoryID)
GO

-- CONSTRAINT FOREIGN KEY FK_EmployeeTerritories_Employees
ALTER TABLE DimEmployeeTerritories
ADD CONSTRAINT FK_EmployeeTerritories_Employees
FOREIGN KEY (EmployeeID) REFERENCES DimEmployees(EmployeeID)
GO

-- CONSTRAINT FOREIGN KEY FK_EmployeeTerritories_Territories
ALTER TABLE DimEmployeeTerritories
ADD CONSTRAINT FK_EmployeeTerritories_Territories
FOREIGN KEY (TerritoryID) REFERENCES DimTerritoriesRegions(TerritoryID)
GO




-- TABLA FACORDERS
CREATE TABLE FactOrders
(
	OrderID int NOT NULL,
	CustomerID nchar(5) NULL,
	EmployeeID int NULL,
	CategoryID int NOT NULL,
	SupplierID int NOT NULL,
	OrderDate datetime NULL,
	RequiredDate datetime NULL,
	ShippedDate datetime NULL,
	ShipVia int NULL,
	Freight money NULL,
	ShipName nvarchar(40) NULL,
	ShipAddress nvarchar(60) NULL,
	ShipCity nvarchar(15) NULL,
	ShipRegion nvarchar(15) NULL,
	ShipPostalCode nvarchar(10) NULL,
	ShipCountry nvarchar(15) NULL,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL,
	Discount real NOT NULL
)
GO

-- CONSTRAINT PRIMARY KEY PK_Orders
ALTER TABLE FactOrders
ADD CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (OrderID, ProductID)
GO

-- CONSTRAINT FOREIGN KEY FK_Orders_Products
ALTER TABLE FactOrders
ADD CONSTRAINT FK_Orders_Products
FOREIGN KEY (ProductID) REFERENCES DimProducts(ProductID)
GO

-- CONSTRAINT FOREIGN KEY FK_Orders_Customers
ALTER TABLE FactOrders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID) REFERENCES DimCustomers(CustomerID)
GO

-- CONSTRAINT FOREIGN KEY FK_Orders_Employees
ALTER TABLE FactOrders
ADD CONSTRAINT FK_Orders_Employees
FOREIGN KEY (EmployeeID) REFERENCES DimEmployees(EmployeeID)
GO

-- CONSTRAINT FOREIGN KEY FK_Orders_Shippers
ALTER TABLE FactOrders
ADD CONSTRAINT FK_Orders_Shippers
FOREIGN KEY (ShipVia) REFERENCES DimShippers(ShipperID)
GO

-- CONSTRAINT FOREIGN KEY FK_Orders_Categories
ALTER TABLE FactOrders
ADD CONSTRAINT FK_Orders_Categories
FOREIGN KEY (CategoryID) REFERENCES DimCategories(CategoryID)
GO

-- CONSTRAINT FOREIGN KEY FK_Orders_Suppliers
ALTER TABLE FactOrders
ADD CONSTRAINT FK_Orders_Suppliers
FOREIGN KEY (SupplierID) REFERENCES DimSuppliers(SupplierID)
GO




-- INSERT, UPDATE Y DELETE DE LAS DIMENSIONES Y HECHOS PARA LOS COMANDOS OLE DB
-- UPDATE TABLA DIMCATEGORIES
UPDATE [dbo].[DimCategories]
SET
CategoryName = ?,
Description = ?,
Picture = ?
WHERE CategoryID = ?*
GO


-- DELETE TABLA DIMCATEGORIES
DELETE [dbo].[DimCategories]
WHERE CategoryID = ?
GO




--UPDATE TABLA DIMSUPPLIERS
UPDATE [dbo].[DimSuppliers]
SET
CompanyName = ?,
ContactName = ?,
ContactTitle = ?,
Address = ?,
City = ?,
Region = ?,
PostalCode = ?,
Country = ?,
Phone = ?,
Fax = ?,
HomePage = ?
WHERE SupplierID = ?
GO


--DELETE TABLA DIMSUPPLIERS
DELETE FROM [dbo].[DimSuppliers]
WHERE SupplierID = ?
GO




-- UPDATE TABLA DIMPRODUCTS
UPDATE [dbo].[DimProducts]
SET
ProductName = ?,
QuantityPerUnit = ?,
UnitPrice = ?,
UnitsInStock = ?,
UnitsOnOrder = ?,
ReorderLevel = ?,
Discontinued = ?
WHERE ProductID = ?
GO


-- DELETE TABLA DIMPRODUCTS
DELETE FROM [dbo].[DimProducts]
WHERE ProductID = ?
GO




-- UPDATE TABLA DIMSHIPPERS
UPDATE [dbo].[DimShippers]
SET
CompanyName = ?,
Phone = ?
WHERE ShipperID = ?
GO


-- DELETE TABLA DIMSHIPPERS
DELETE FROM [dbo].[DimShippers]
WHERE ShipperID = ?
GO




--UPDATE TABLA DIMCUSTOMERS
UPDATE [dbo].[DimCustomers]
SET
CompanyName = ?,
ContactName = ?,
ContactTitle = ?,
Address = ?,
City = ?,
Region = ?,
PostalCode = ?,
Country = ?,
Phone = ?,
Fax = ?
WHERE CustomerID = ?
GO


-- DELETE TABLA DIMCUSTOMERS
DELETE FROM [dbo].[DimCustomers]
WHERE CustomerID = ?
GO




--UPDATE TABLA DIMTERRITORIESREGIONS
UPDATE [dbo].[DimTerritoriesRegions]
SET
TerritoryDescription = ?,
RegionDescription = ?
WHERE TerritoryID = ?
GO


--DELETE TABLA DIMTERRITORIESREGIONS
DELETE FROM [dbo].[DimTerritoriesRegions]
WHERE TerritoryID = ?
GO




-- UPDATE TABLA DIMEMPLOYEES
UPDATE [dbo].[DimEmployees]
SET
LastName = ?,
FirstName = ?,
Title = ?,
TitleOfCourtesy = ?,
BirthDate = ?,
HireDate = ?,
Address = ?,
City = ?,
Region = ?,
PostalCode = ?,
Country = ?,
HomePhone = ?,
Extension = ?,
Photo = ?,
Notes = ?,
ReportsTo = ?,
PhotoPath = ?
WHERE EmployeeID = ?
GO


-- DELETE TABLE DIMEMPLOYEES
DELETE FROM [dbo].[DimEmployees]
WHERE EmployeeID = ?
GO




-- UPDATE TABLE DIMEMPLOYEETERRITORIES
UPDATE [dbo].[DimEmployeeTerritories]
SET
TerritoryID = ?
WHERE EmployeeID = ? AND TerritoryID = ?
GO


-- DELETE TABLE DIMEMPLOYEETERRITORIES
DELETE FROM [dbo].[DimEmployeeTerritories]
WHERE EmployeeID = ? AND TerritoryID = ?
GO




-- UPDATE TABLE FACTORDERS
UPDATE [dbo].[FactOrders]
SET
OrderDate = ?,
RequiredDate = ?,
ShippedDate = ?,
Freight = ?,
ShipName = ?,
ShipAddress = ?,
ShipCity = ?,
ShipRegion = ?,
ShipPostalCode = ?,
ShipCountry = ?,
UnitPrice = ?,
Quantity = ?,
Discount = ?
WHERE OrderID = ? AND ProductID = ?
GO


-- DELETE TABLE FACTORDERS
DELETE FROM [dbo].[FactOrders]
WHERE OrderID = ? AND ProductID = ?
GO