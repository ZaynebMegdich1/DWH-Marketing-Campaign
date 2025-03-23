# ***Marketing Campaign Data Warehouse***

### 📌 **Project Overview**  
This project focuses on building a data warehouse for marketing campaign performance analysis using SQL and the Medallion Architecture (Bronze, Silver, and Gold layers). The data is sourced from multiple systems, including ERP, CRM, and MMS, and is initially uncleaned, requiring extensive data transformation and optimization.


### 📊 **Specifications**
---

#### 📂 ***Data Sources***

🔹 **ERP**  
- ***Product Data (product_data.csv)*** – Contains details on products marketed, including name, category, and inventory

🔹 **CRM**  
- ***Customer Data (customer_data.csv)*** – Stores customer details such as name, location, age, join date, and gender.

🔹 **MMS**  
- ***Campaign Data (campaign_data.csv)*** – Includes marketing campaign details such as campaign name, budget, and start and end dates.  
- ***Channel Data (channel_data.csv)*** – Includes channels type  
- ***Media Spend Data (media_spend_data.csv)*** – Tracks media spend per channel and campaign, including impressions, clicks, and conversions.



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
