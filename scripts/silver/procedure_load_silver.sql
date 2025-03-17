-- Inserting Clean Data
-------------------------

-- Customer
INSERT INTO silver.crm_customer (
    customer_id,
    first_name,
    last_name,
    join_date,
    city,
    age,
    gender
)
SELECT 
    customer_id, 
    first_name, 
    last_name, 
    join_date,
    UPPER(LEFT(city, 1)) + LOWER(SUBSTRING(city, 2, LEN(city))) AS city, 
    age, 
    UPPER(TRIM(gender)) AS gender
FROM bronze.crm_customer;

-------------------------

-- Category
INSERT INTO silver.erp_category (
    cat_id,
    product_key,
    category,
    subcategory
)
SELECT
    cat_id,
    'P00' + product_key AS product_key,
    category,
    subcategory
FROM bronze.erp_category;

-------------------------

-- Product
INSERT INTO silver.erp_product (
    product_id,
    product_name,
    price,
    inventory,
    launch_date,
    description
)
SELECT
    product_id,
    product_name,
    ABS(price) AS price, 
    ABS(inventory) AS inventory,
    CASE 
        WHEN launch_date > '2023-12-31' 
        THEN DATEFROMPARTS(2023, MONTH(launch_date), DAY(launch_date))
        ELSE launch_date
    END AS launch_date,
    description
FROM bronze.erp_product;

-------------------------

-- Campaign
INSERT INTO silver.mms_campaign (
    campaign_id,
    campaign_name,
    start_date,
    end_date,
    duration_days,
    budget
)
SELECT 
    SUBSTRING(campaign_id, 4, LEN(campaign_id)) AS campaign_id,
    campaign_name,
    start_date,
    end_date,
    DATEDIFF(DAY, start_date, end_date) AS duration_days,
    budget
FROM bronze.mms_campaign;

-------------------------

-- Channel
INSERT INTO silver.mms_channel (
    channel_type,
    campaign_id
)
SELECT 
    UPPER(LEFT(channel_type, 1)) + SUBSTRING(channel_type, 2, LEN(channel_type)) AS channel_type,
    campaign_id
FROM bronze.mms_channel;

-------------------------

-- Media Spend
INSERT INTO silver.mms_media_spend (
    media_spend_id,
    campaign_id,
    product_id,
    customer_id,
    spend_amount,
    impressions,
    clicks,
    conversions,
    cost_per_conversion
)
SELECT 
    media_spend_id,
    campaign_id,
    product_id,
    customer_id,
    spend_amount,
    impressions,
    clicks,
    conversions,
    ROUND(CAST(spend_amount AS DECIMAL(10,2)) / NULLIF(conversions, 0), 2) AS cost_per_conversion
FROM bronze.mms_media_spend;
