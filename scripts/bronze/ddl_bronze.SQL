-----------------------------
--Creating Bronze Layer
-----------------------------
-- Create Campaign Table
IF OBJECT_ID('bronze.mms_campaign', 'U') IS NOT NULL
DROP TABLE bronze.mms_campaign;
CREATE TABLE bronze.mms_campaign(
    campaign_id VARCHAR(10),
    campaign_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget INT
);
SELECT * FROM bronze.mms_campaign;

-- Create Product Table
IF OBJECT_ID('bronze.erp_product', 'U') IS NOT NULL
DROP TABLE bronze.erp_product;
CREATE TABLE bronze.erp_product(
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    price INT,
    inventory INT,
    launch_date DATE,
    description TEXT
);
SELECT * FROM bronze.erp_product;

-- Create Category Table (Mapping Products to Categories)
IF OBJECT_ID('bronze.erp_category', 'U') IS NOT NULL
DROP TABLE bronze.erp_category;
CREATE TABLE bronze.erp_category(
    cat_id VARCHAR(10),
    product_key VARCHAR(10), 
    category VARCHAR(50),
    subcategory VARCHAR(50)
);
SELECT * FROM bronze.erp_category;

-- Create Media Spend Table (Fact Table)
IF OBJECT_ID('bronze.mms_media_spend', 'U') IS NOT NULL
DROP TABLE bronze.mms_media_spend;
CREATE TABLE bronze.mms_media_spend(
    media_spend_id VARCHAR (10),
    campaign_id VARCHAR(10), 
    product_id VARCHAR(10),  
    customer_id VARCHAR(10),  
    spend_amount INT,
    impressions INT,
    clicks INT,
    conversions INT,
    cost_per_conversion DECIMAL(10, 2)
);
SELECT * FROM bronze.mms_media_spend;

-- Create Channel Table
IF OBJECT_ID('bronze.mms_channel', 'U') IS NOT NULL
DROP TABLE bronze.mms_channel;
CREATE TABLE bronze.mms_channel(
    channel_id INT,
    channel_type VARCHAR(50),
    campaign_id VARCHAR(10)  
);
SELECT * FROM bronze.mms_channel;

-- Create Customer Table
IF OBJECT_ID('bronze.crm_customer', 'U') IS NOT NULL
DROP TABLE bronze.crm_customer;
CREATE TABLE bronze.crm_customer (
    customer_id VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    join_date DATE,
    city VARCHAR(50),
    country VARCHAR(50),
    age INT,
    gender VARCHAR(5)
);
