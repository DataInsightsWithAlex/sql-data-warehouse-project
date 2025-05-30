# Data Dictionary for Gold Layer

## Overview
---
The Gold layer is the business-level data represantation, structured to support analytical and reporting use cases. It consists of **dimension tables** and **fact table**s for specifc business metrics.

## 1. gold.dim_customers

- **Purpose:** Stores customer details enriched with demographic and geographic data.
- **Columns:**

| Column Name | Data Type | Description |
| --- | --- | --- |
| customer_key | INT | Surrogate key uniquely identifying each customer record in the dimension table. |
| customer_id | INT | Unique numerical identifier assigned to each customer. |
| customer_number | NVARCHAR(50) | Alphanumerical identifier representing the customer, used for tracking and referencing. |
| first_name | NVARCHAR(50) | The customer’s first name, as recorded in the system. |
| last_name | NVARCHAR(50) | The customer’s last name or family name. |
| country | NVARCHAR(50) | The country of residence for the customer (e.g., ‘Australia’). |
| marital_status | NVARCHAR(50) | The marital status of the customer ( e.g., ‘Married’, ‘Single’). |
| gender | NVARCHAR(50) | The genderof the customer (e.g., ‘Male’,  ‘Female’, ’n/a’). |
| birthdate | DATE | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., 1971-10-06). |
| create_date | DATE | The date and time when the customer record was created in the system |

## 2. gold.dim_products
.... as this is just a project I didn't want to waste more time on it
