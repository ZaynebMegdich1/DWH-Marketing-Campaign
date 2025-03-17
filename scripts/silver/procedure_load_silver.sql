--Inserting Clean data into the silver layer
-------------------------
--Customer
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
-------------------------
--Category
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
