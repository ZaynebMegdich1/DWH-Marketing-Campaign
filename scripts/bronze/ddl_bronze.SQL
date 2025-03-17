-- Creating Bronze Layer Tables
---------------------------------------------

-- Create Campaign Table
IF OBJECT_ID('bronze.mms_campaign', 'U') IS NOT NULL
    DROP TABLE bronze.mms_campaign;

CREATE TABLE bronze.mms_campaign (
    campaign_id     VARCHAR(10),
    campaign_name   VARCHAR(100),
    start_date      DATE,
    end_date        DATE,
    budget         TEXT,
    status         VARCHAR(20),
    target_region  VARCHAR(50)
);

---------------------------------------------

-- Create Product Table
IF OBJECT_ID('bronze.erp_product', 'U') IS NOT NULL
    DROP TABLE bronze.erp_product;

CREATE TABLE bronze.erp_product (
    product_id    VARCHAR(10),
    product_name  VARCHAR(100),
    category      VARCHAR(50),
    price         TEXT,
    inventory     TEXT,
    launch_date   TEXT,
    description   TEXT
);

SELECT * FROM bronze.erp_product;

---------------------------------------------

-- Create Media Spend Table
IF OBJECT_ID('bronze.mms_media_spend', 'U') IS NOT NULL
    DROP TABLE bronze.mms_media_spend;

CREATE TABLE bronze.mms_media_spend (
    media_spend_id       INT,
    channel_id           INT,
    campaign_id          VARCHAR(10),
    spend_date           DATE,
    spend_amount         INT,
    impressions          INT,
    clicks              INT,
    conversions         INT,
    cost_per_conversion  DECIMAL(10,2)
);

SELECT * FROM bronze.mms_media_spend;

---------------------------------------------

-- Create Channel Table
IF OBJECT_ID('bronze.mms_channel', 'U') IS NOT NULL
    DROP TABLE bronze.mms_channel;

CREATE TABLE bronze.mms_channel (
    channel_id       INT,
    channel_name     VARCHAR(50),
    channel_type     VARCHAR(50),
    target_audience  VARCHAR(100),
    budget          INT,
    start_date      DATE,
    end_date        DATE,
    campaign_ids    VARCHAR(10)
);

SELECT * FROM bronze.mms_channel;

---------------------------------------------

-- Create Customer Table
IF OBJECT_ID('bronze.crm_customer', 'U') IS NOT NULL
    DROP TABLE bronze.crm_customer;

CREATE TABLE bronze.crm_customer (
    customer_id        VARCHAR(10),
    first_name         VARCHAR(50),
    last_name          VARCHAR(50),
    email             VARCHAR(100),
    phone_number      VARCHAR(15),
    join_date         DATE,
    city             VARCHAR(50),
    country          VARCHAR(50),
    age              INT,
    gender           VARCHAR(5),
    loyalty_status   VARCHAR(20),
    birth_date       DATE,
    purchase_history TEXT
);
