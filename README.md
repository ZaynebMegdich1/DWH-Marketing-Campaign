# ***Marketing Campaign Data Warehouse***

### 📌 **Project Overview**  
This project focuses on building a data warehouse for marketing campaign performance analysis using SQL and the Medallion Architecture (Bronze, Silver, and Gold layers). The data is sourced from multiple systems, including ERP, CRM, and MMS, and is initially uncleaned, requiring extensive data transformation and optimization.


### 📊 **Specifications**

#### 📂 ***Data Sources***

🔹 **ERP**  
- ***Product Data (product_data.csv)*** – Contains details on products marketed, including category, pricing, inventory, and launch dates.

🔹 **CRM**  
- ***Customer Data (customer_data.csv)*** – Stores customer details such as name, contact information, location, age, gender, loyalty status, and purchase history.

🔹 **MMS**  
- ***Campaign Data (campaign_data.csv)*** – Includes marketing campaign details such as budget, start and end dates, target region, and campaign status.  
- ***Channel Data (channel_data.csv)*** – Provides details on marketing channels (Facebook, Google Ads, LinkedIn, etc.), audience segmentation, and campaign links.  
- ***Media Spend Data (media_spend_data.csv)*** – Tracks media spend per channel and campaign, including impressions, clicks, conversions, and cost per conversion.



#### 📉 **Data Quality**

- ***Unclean Data:*** Includes duplicates, missing values, inconsistent formats, incorrect data types, and spaces in key fields.  
- ***Transformation Needs:*** Requires standardization, deduplication, column derivations, and data integrity checks before structuring into fact and dimension tables.



### 🎯 **Objectives**  

✔Extract raw data from multiple sources (ERP, CRM, MMS).  
✔Clean and transform data using SQL to remove inconsistencies.  
✔Design an optimized data warehouse using the Medallion Architecture:  
  - ***Bronze Layer:*** Stores raw, unprocessed data.  
  - ***Silver Layer:*** Cleansed and standardized data.  
  - ***Gold Layer:*** Final business-ready tables (fact & dimension tables).  

--- 
