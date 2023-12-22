/*
	Autor: RenzoZ
	Objetivo: Realizar los filtros respectivos para diseñar e implementar el proceso de ETL incremental en el snowflake model propuesto
*/


USE Northwind
GO


-- CANTIDAD DE REGISTROS DEL JOIN ENTRE ORDERS DETAILS Y ORDERS
SELECT COUNT(*)
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
GO


-- CANTIDAD DE REGISTROS DEL JOIN ENTRE ORDERS DETAILS Y ORDERS FILTRADO SIN VALORES NULOS EN EL CAMPO SHIP_REGION
SELECT COUNT(*)
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.ShipRegion IS NULL
GO


-- CANTIDAD DE REGISTROS SIN VALORES NULOS ENTRE ORDERS DETAILS Y ORDERS FILTRADO
SELECT
COUNT(*) - 
(SELECT COUNT(*)
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.ShipRegion IS NULL)
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
GO


-- NUMERO DE REGISTROS POR CADA TABLA DE LA DB NORTHWIND
SELECT COUNT(*) AS NUM_FILAS FROM CustomerCustomerDemo
GO

SELECT COUNT(*) AS NUM_FILAS FROM CustomerDemographics
GO

SELECT COUNT(*) AS NUM_FILAS FROM Categories
GO

SELECT COUNT(*) AS NUM_FILAS FROM EmployeeTerritories
GO

SELECT COUNT(*) AS NUM_FILAS FROM Territories
GO

SELECT COUNT(*) AS NUM_FILAS FROM Region
GO

SELECT COUNT(*) AS NUM_FILAS FROM Shippers
GO

SELECT COUNT(*) AS NUM_FILAS FROM Suppliers
GO

SELECT COUNT(*) AS NUM_FILAS FROM [Order Details]
GO

SELECT COUNT(*) AS NUM_FILAS FROM [Orders]
GO




-- FILTRO FINAL TABLA FACT_ORDERS
SELECT
	  od.[OrderID],
	  o.[CustomerID],
	  o.[EmployeeID],
	  c.[CategoryID],
	  s.[SupplierID],
	  o.[OrderDate],
	  o.[RequiredDate],
	  o.[ShippedDate],
	  o.[ShipVia],
	  o.[Freight],
	  o.[ShipName],
	  o.[ShipAddress],
	  o.[ShipCity],
	  o.[ShipRegion],
	  o.[ShipPostalCode],
	  o.[ShipCountry],
	  od.[ProductID],
	  od.[UnitPrice],
	  od.[Quantity],
	  od.[Discount]
FROM [Northwind].[dbo].[Order Details] od
INNER JOIN [Northwind].[dbo].[Orders] o ON od.[OrderID] = o.[OrderID]
INNER JOIN [Northwind].[dbo].[Products] p ON od.[ProductID] = p.[ProductID]
INNER JOIN [Northwind].[dbo].[Categories] c ON p.[CategoryID] = c.[CategoryID]
INNER JOIN [Northwind].[dbo].[Suppliers] s ON p.[SupplierID] = s.[SupplierID]
ORDER BY od.[OrderID], od.[ProductID]
GO




-- FILTRO FINAL TABLA DIM_EMPLOYEES
SELECT [EmployeeID]
      ,[LastName]
      ,[FirstName]
      ,[Title]
      ,[TitleOfCourtesy]
      ,[BirthDate]
      ,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      ,[Extension]
      ,[Photo]
      ,[Notes]
      ,[ReportsTo]
      ,[PhotoPath]
FROM [Northwind].[dbo].[Employees]
GO




-- FILTRO FINAL TABLA DIM_EMPLOYEETERRITORIES
SELECT [EmployeeID], [TerritoryID]
FROM [Northwind].[dbo].[EmployeeTerritories]
GO




-- FILTRO FINAL TABLA DIM_TERRITORIESREGION
SELECT 
	  t.[TerritoryID],
      t.[TerritoryDescription],
      r.[RegionDescription]
FROM [Northwind].[dbo].[Territories] t
INNER JOIN [Northwind].[dbo].[Region] r ON t.[RegionID] = r.[RegionID]
GO





-- FILTRO FINAL TABLA DIM_CUSTOMERS
SELECT [CustomerID]
      ,[CompanyName]
      ,[ContactName]
      ,[ContactTitle]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[Phone]
      ,[Fax]
FROM [Northwind].[dbo].[Customers]
GO




-- FILTRO FINAL TABLA DIM_SHIPPERS
SELECT [ShipperID]
      ,[CompanyName]
      ,[Phone]
FROM [Northwind].[dbo].[Shippers]
GO




-- FILTRO FINAL TABLA DIM_PRODUCTS
SELECT [ProductID]
      ,[ProductName]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
FROM [Northwind].[dbo].[Products]
GO




-- FILTRO FINAL TABLA DIM_CATEGORIES
SELECT [CategoryID]
      ,[CategoryName]
      ,[Description]
      ,[Picture]
FROM [Northwind].[dbo].[Categories]
GO




-- FILTRO FINAL TABLA DIM_SUPPLIERS
SELECT [SupplierID]
      ,[CompanyName]
      ,[ContactName]
      ,[ContactTitle]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[Phone]
      ,[Fax]
      ,[HomePage]
FROM [Northwind].[dbo].[Suppliers]
GO




-- FILTROS PARCIALES PARA OBTENER EL FILTRO FACT_ORDERS
-- FILTRO DIM_SUPPLIERS
SELECT
	  od.OrderID,
	  od.ProductID,
	  s.SupplierID
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY 1, 2 ASC
GO




-- FILTRO DIM_CATEGORIA
SELECT
      od.OrderID,
	  od.ProductID,
	  c.CategoryID
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY 1,2 ASC
GO




-- FILTRO DIM_EMPLOYEETERRITORIES
SELECT
      od.OrderID,
	  o.EmployeeID,
	  t.TerritoryID
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
INNER JOIN EmployeeTerritories et ON e.EmployeeID = et.EmployeeID
INNER JOIN Territories t ON et.TerritoryID = t.TerritoryID
INNER JOIN Region r ON t.RegionID = r.RegionID
ORDER BY 1 ASC
GO
