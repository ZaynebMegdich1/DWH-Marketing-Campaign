--Inserting Clean data
CREATE OR ALTER PROCEDURE silver.silver_load 
AS
BEGIN
    SET NOCOUNT ON;

    ----------------------------------
    PRINT '>> Truncating Table: silver.crm_customer';
    TRUNCATE TABLE silver.crm_customer;
    PRINT '>> Inserting Data Into: silver.crm_customer';
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
        UPPER(TRIM(REPLACE(gender, CHAR(13), ''))) AS gender
    FROM bronze.crm_customer;

    ----------------------------------
    PRINT '>> Truncating Table: silver.erp_category';
    TRUNCATE TABLE silver.erp_category;
    PRINT '>> Inserting Data Into: silver.erp_category';
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

    ----------------------------------
    PRINT '>> Truncating Table: silver.erp_product';
    TRUNCATE TABLE silver.erp_product;
    PRINT '>> Inserting Data Into: silver.erp_product';
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

    ----------------------------------
    PRINT '>> Truncating Table: silver.mms_campaign';
    TRUNCATE TABLE silver.mms_campaign;
    PRINT '>> Inserting Data Into: silver.mms_campaign';
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

    ----------------------------------
    PRINT '>> Truncating Table: silver.mms_channel';
    TRUNCATE TABLE silver.mms_channel;
    PRINT '>> Inserting Data Into: silver.mms_channel';
    INSERT INTO silver.mms_channel (
        channel_type,
        campaign_id
    )
    SELECT 
        UPPER(LEFT(channel_type, 1)) + SUBSTRING(channel_type, 2, LEN(channel_type)) AS channel_type,
        REPLACE(campaign_id, CHAR(13), '') AS campaign_id
    FROM bronze.mms_channel;

    ----------------------------------
    PRINT '>> Truncating Table: silver.mms_media_spend';
    TRUNCATE TABLE silver.mms_media_spend;
    PRINT '>> Inserting Data Into: silver.mms_media_spend';
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

END;
--Execute the procedure
EXEC silver.silver_load;
