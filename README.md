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
<br></br>
  ![DELETE FACT_ORDERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/4c599672-15fd-4c3b-bc77-6bf036b7566e)

 - ETL DimEmployees

  ![INSERT_UPDATE DIM_EMPLOYEES](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/e6ce6624-bf04-4017-9e24-0117ba8f8e14)
  ![DELETE DIM_EMPLOYEES](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/51b2b5c4-4781-4d29-a6cf-3d867aad7be1)

 -  ETL DimCustomers

  ![INSERT_UPDATE DIM_CUSTOMERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/67a11b3d-95f9-47c3-88e8-1283ff830c56)
  ![DELETE DIM_CUSTOMERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/c35752d9-36e3-448c-a64f-b7bd1b17be37)

 - ETL DimProducts

  ![INSERT_UPDATE DIM_PRODUCTS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/9379333b-230f-474f-a04f-1ff0aefa5fa4)
  ![DELETE DIM_PRODUCTS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/9892032e-4663-4138-a669-61ef1c400127)
   
 - ETL DimSuppliers

   ![INSERT_UPDATE DIM_SUPPLIERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/9b893a1d-bb9d-4bee-9488-53238d8f2118)
  ![DELETE DIM_SUPPLIERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/9b8c5bcc-acea-421a-ae97-627ecbdb0887)

 - ETL DimShippers

  ![INSERT_UPDATE DIM_SHIPPERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/829b56f4-b059-4bd9-8866-7f8e7e52caf5)
  ![DELETE DIM_SHIPPERS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/85327772-4b5d-499e-9c96-72b64fb67e96)

 - ETL DimCategories

  ![INSERT_UPDATE DIM_CATEGORIES](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/1db65897-10bf-4207-934c-b186984aedb8)
  ![DELETE DIM_CATEGORIES](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/0849d956-554c-4844-9af8-cea3d7c5152d)

 - ETL DimTerritoriesRegions

  ![INSERT_UPDATE DIM_TERRITORIES_REGIONS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/35f1595e-edd6-4cc9-8913-6c8fe074345a)
  ![DELETE_DIM_TERRITORIES_REGIONS](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/e3a5b208-7a51-4dd3-a4f4-400a427b98fa)

 - ETL DimEmployeeTerritories
   
  ![INSERT_UPDATE DIM_EMPLOYEE_TERRITORIES](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/cf487142-98ef-46a0-98a6-f5ad051b5442)
  ![DELETE DIM_EMPLOYEE_TERRITORIES](https://github.com/Renzo1818/ETL-NORTHWIND/assets/93232895/46ec874e-bace-41b4-ad8f-2f437200be09)

   
