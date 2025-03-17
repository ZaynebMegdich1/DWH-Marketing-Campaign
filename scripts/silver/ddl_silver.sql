--Creating Silver Layer
-----------------------------
CREATE OR ALTER PROCEDURE silver.silver_create 
AS
BEGIN
    SET NOCOUNT ON;

    ----------------------------------
    PRINT '>> Dropping and Creating Table: silver.mms_campaign';
    IF OBJECT_ID('silver.mms_campaign', 'U') IS NOT NULL
        DROP TABLE silver.mms_campaign;
    CREATE TABLE silver.mms_campaign(
        campaign_id VARCHAR(10),
        campaign_name VARCHAR(100),
        start_date DATE,
        end_date DATE,
        duration_days INT,
        budget INT
    );

    ----------------------------------
    PRINT '>> Dropping and Creating Table: silver.erp_product';
    IF OBJECT_ID('silver.erp_product', 'U') IS NOT NULL
        DROP TABLE silver.erp_product;
    CREATE TABLE silver.erp_product(
        product_id VARCHAR(10),
        product_name VARCHAR(100),
        price INT,
        inventory INT,
        launch_date DATE,
        description TEXT
    );

    ----------------------------------
    PRINT '>> Dropping and Creating Table: silver.erp_category';
    IF OBJECT_ID('silver.erp_category', 'U') IS NOT NULL
        DROP TABLE silver.erp_category;
    CREATE TABLE silver.erp_category(
        cat_id VARCHAR(10),
        product_key VARCHAR(10), 
        category VARCHAR(50),
        subcategory VARCHAR(50)
    );

    ----------------------------------
    PRINT '>> Dropping and Creating Table: silver.mms_media_spend';
    IF OBJECT_ID('silver.mms_media_spend', 'U') IS NOT NULL
        DROP TABLE silver.mms_media_spend;
    CREATE TABLE silver.mms_media_spend(
        media_spend_id VARCHAR(10),
        campaign_id VARCHAR(10), 
        product_id VARCHAR(10),  
        customer_id VARCHAR(10),  
        spend_amount INT,
        impressions INT,
        clicks INT,
        conversions INT,
        cost_per_conversion DECIMAL(18,2)
    );

    ----------------------------------
    PRINT '>> Dropping and Creating Table: silver.mms_channel';
    IF OBJECT_ID('silver.mms_channel', 'U') IS NOT NULL
        DROP TABLE silver.mms_channel;
    CREATE TABLE silver.mms_channel(
        channel_type VARCHAR(50),
        campaign_id VARCHAR(10)  
    );

    ----------------------------------
    PRINT '>> Dropping and Creating Table: silver.crm_customer';
    IF OBJECT_ID('silver.crm_customer', 'U') IS NOT NULL
        DROP TABLE silver.crm_customer;
    CREATE TABLE silver.crm_customer(
        customer_id VARCHAR(10),
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        join_date DATE,
        city VARCHAR(50),
        age INT,
        gender VARCHAR(5)
    );

    PRINT '>> Silver Layer Tables Created Successfully!';
END;
--Execute create procedure
EXEC silver.silver_create
