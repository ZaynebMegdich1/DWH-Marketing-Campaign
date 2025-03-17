--Inserting Clean data into the silver layer
----------------------------
--Customer
----------------------------
INSERT INTO silver.crm_customer(
customer_id,
first_name,
last_name,
join_date,
city,
age,
gender)
SELECT 
    customer_id, 
    first_name, 
    last_name, 
	join_date,
    UPPER(LEFT(city, 1)) + LOWER(SUBSTRING(city, 2, LEN(city))) AS city, 
    age, 
	UPPER(trim(gender)) AS gender
FROM bronze.crm_customer;
----------------------------
--Category
-----------------------------
INSERT INTO silver.erp_category(
cat_id,
product_key,
category,
subcategory)
SELECT
cat_id,
'P00'+product_key as product_key,
category,
subcategory
FROM bronze.erp_category
-------------------------------
--Product
-------------------------------
INSERT INTO silver.erp_product(
product_id,
product_name,
price,inventory,
launch_date,
description
)
select
product_id,
product_name,
abs(price) as price, 
abs(inventory) as inventory,
CASE 
     WHEN launch_date > '2023-12-31' 
     THEN DATEFROMPARTS(2023, MONTH(launch_date), DAY(launch_date))
     ELSE launch_date
END AS launch_date,
description
FROM bronze.erp_product;
SELECT * FROM silver.erp_product;
