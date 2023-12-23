# Proceso ETL incremental: Northwind DW
El presente proyecto tiene como objetivo crear e implementar un ETL incremental a partir de la base de datos pública [Northwind](https://gist.github.com/jmalarcon/e98d20735d17b3160766c041060d1902).

### Tecnologías y herramientas empleadas
#### Oracle VirtualBox:

<p align="center">
  <img src="https://th.bing.com/th/id/R.da15db6964f3d9d342d2640409acb815?rik=q%2bOWhHwrjenwfQ&pid=ImgRaw&r=0&sres=1&sresct=1"/>
</p>

#### SQL Server:
<p align="center">
  <img src="https://th.bing.com/th/id/R.252ac075800539c58927f7533b646dd5?rik=Z2FURiI4PzA9zw&pid=ImgRaw&r=0">
</p>

#### SQL Server Integration Services
<p align="center">
  <img src="https://cdn0.capterra-static.com/screenshots/2095137/64232.png">
</p>


## Implementación del ETL incremental
#### Flujo de control:
 
 #### Flujo de tareas:
 - ETL FactOrders

  ![INSERT_UPDATE FACT_ORDERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/39c51689-ea3e-4249-a1fc-43ffa810db38)
  ![DELETE FACT_ORDERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/4c599672-15fd-4c3b-bc77-6bf036b7566e)

 
 - ETL DimEmployees
 
 -  ETL DimCustomers
 
 - ETL DimProducts
 
 - ETL DimSuppliers
 
 - ETL DimShippers
 
 - ETL DimCategories
 
 - ETL DimTerritoriesRegions
 
 - ETL DimEmployeeTerritories
