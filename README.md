# Marketing Campaign Data Warehouse
**📌 Project Overview**
This project focuses on building a data warehouse for marketing campaign performance analysis using SQL and the Medallion Architecture (Bronze, Silver, and Gold layers). The data is sourced from multiple systems, including ERP, CRM, and MMS, and is initially uncleaned, requiring extensive data transformation and optimization. The final structured dataset will be used for a Power BI dashboard to analyze key marketing metrics.

**📊 Specifications**

📂 Data Sources
_ERP:
sales_transactions: Contains details of purchases, revenue, and customer spending.
_CRM:
customers: Stores customer information such as demographics, locations, and preferences.
_MMS (Marketing Management System):
campaigns: Includes marketing campaign details such as campaign name, type, and budget.
channels: Lists marketing channels (email, social media, TV, etc.) used for campaigns.
campaign_performance: Tracks key performance metrics like impressions, clicks, and conversions

**📉 Data Quality**

Unclean Data: Includes duplicates, missing values, inconsistent formats, incorrect data types, and spaces in key fields.
Transformation Needs: Requires standardization, deduplication, column derivations, and data integrity checks before structuring into fact and dimension tables.

**🎯 Objectives**

✔️ Extract raw data from multiple sources (ERP, CRM, MMS).
✔️ Clean and transform data using SQL to remove inconsistencies.
✔️ Design an optimized data warehouse using the Medallion Architecture:

Bronze Layer: Stores raw, unprocessed data.
Silver Layer: Cleansed and standardized data.
Gold Layer: Final business-ready tables (fact & dimension tables).
✔️ Build a Power BI dashboard to visualize marketing campaign performance.
✔️ Improve SQL skills by handling real-world messy data and optimizing queries.
