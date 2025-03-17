-- Creating Procedure to Insert Data into Tables
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    
    PRINT '>> Truncating Table: bronze.crm_customer';
    TRUNCATE TABLE bronze.crm_customer;
    PRINT '>> Inserting Data Into: bronze.crm_customer';
    BULK INSERT bronze.crm_customer
    FROM 'C:\customer_data.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a', 
        TABLOCK
    );
    ----------------------------------
    PRINT '>> Truncating Table: bronze.mms_campaign';
    TRUNCATE TABLE bronze.mms_campaign;
    PRINT '>> Inserting Data Into: bronze.mms_campaign';
    BULK INSERT bronze.mms_campaign
    FROM 'C:\campaign_data.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a', 
        TABLOCK
    );
    ----------------------------------
    PRINT '>> Truncating Table: bronze.mms_channel';
    TRUNCATE TABLE bronze.mms_channel;
    PRINT '>> Inserting Data Into: bronze.mms_channel';
    BULK INSERT bronze.mms_channel
    FROM 'C:\channel_data.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a', 
        TABLOCK
    );
    ----------------------------------
    PRINT '>> Truncating Table: bronze.mms_media_spend';
    TRUNCATE TABLE bronze.mms_media_spend;
    PRINT '>> Inserting Data Into: bronze.mms_media_spend';
    BULK INSERT bronze.mms_media_spend
    FROM 'C:\media_spend_data.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a', 
        TABLOCK
    );
    ----------------------------------
    PRINT '>> Truncating Table: bronze.erp_product';
    TRUNCATE TABLE bronze.erp_product;
    PRINT '>> Inserting Data Into: bronze.erp_product';
    BULK INSERT bronze.erp_product
    FROM 'C:\product_data.csv'
    WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a', 
        TABLOCK
    );
END

-- Executing the procedure
EXEC bronze.load_bronze;
