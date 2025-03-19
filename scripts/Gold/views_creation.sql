------------Gold Layer
------------------------

----Creating Product Dim
------------------------
IF OBJECT_ID('gold.dim_product', 'V') IS NOT NULL
    DROP VIEW gold.dim_product;
GO
CREATE VIEW gold.dim_product AS 
SELECT
    product_id,
    product_name,
    category,
    subcategory,
    price,
    inventory,
    launch_date,
    description
FROM silver.erp_product pr
LEFT JOIN silver.erp_category cat
    ON pr.product_id = cat.product_key;

----------------------------
----Creating Campaign DIM
----------------------------
IF OBJECT_ID('gold.dim_campaign', 'V') IS NOT NULL
    DROP VIEW gold.dim_campaign;
GO
CREATE VIEW gold.dim_campaign AS 
SELECT 
    camp.campaign_id,
    campaign_name,
    chan.channel_type,
    start_date,
    end_date,
    duration_days,
    budget
FROM silver.mms_campaign camp
LEFT JOIN silver.mms_channel chan
    ON camp.campaign_id = TRIM(chan.campaign_id);

----------------------------------------
--Dim customer
----------------------------------------
IF OBJECT_ID('gold.dim_customer', 'V') IS NOT NULL
    DROP VIEW gold.dim_customer;
GO
CREATE VIEW gold.dim_customer AS 
SELECT * 
FROM silver.crm_customer;

----------------------------------------
--Fact Table
----------------------------------------
IF OBJECT_ID('gold.fact', 'V') IS NOT NULL
    DROP VIEW gold.fact;
GO
CREATE VIEW gold.fact AS 
SELECT * 
FROM silver.mms_media_spend;
