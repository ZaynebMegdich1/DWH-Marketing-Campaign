------------Gold Layer
------------------------

----Creating Product Dim
------------------------
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
CREATE VIEW gold.dim_customer AS 
SELECT * 
FROM silver.crm_customer;

----------------------------------------
--Fact Table
----------------------------------------
CREATE VIEW gold.fact AS 
SELECT * 
FROM silver.mms_media_spend;
