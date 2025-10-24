# 🍕 Pizza Sales Analysis

This repository contains a comprehensive SQL-based analysis of pizza sales data. The project aims to derive key business insights by calculating important metrics, analyzing sales trends, and identifying top-performing and underperforming pizza varieties.

## 🎯 Project Overview

The primary goal of this analysis is to:

1.  **Calculate** key performance indicators (KPIs) such as total revenue, total orders, and average order value.
2.  **Analyze** sales trends over different time periods (weekly and monthly).
3.  **Determine** the distribution of sales across different pizza categories and sizes.
4.  **Identify** the top 5 and bottom 5 best-selling pizzas based on revenue, orders, and quantity sold.

   ![Pizza1_sales_Analysis](https://github.com/Megha-karn/Capstone_Pizza_Sales_Analysis/blob/main/images/pizza1.png) 
   

## 📊 Key Metrics & KPIs

The following core business metrics were calculated from the sales data:

| Metric | SQL Calculation |
| :--- | :--- |
| **Total Revenue** | `SUM(total_price)` |
| **Total Orders** | `COUNT(DISTINCT order_id)` |
| **Total Pizzas Sold** | `SUM(quantity)` |
| **Average Order Value (AOV)** | `SUM(total_price) / COUNT(DISTINCT order_id)` |
| **Average Pizzas Per Order** | `SUM(quantity) / COUNT(DISTINCT order_id)` |

## ⚙️ SQL Queries & Analysis

The `pizza_sales.sql` file contains all the queries used for the analysis, which are grouped by the insights they provide.

### 1. Key Performance Indicators (KPIs)

Queries to establish the foundational business numbers:

* `Total_Revenue`
* `Total_Order`
* `Total_pizzas_sold`
* `Average_Order_Value`
* `Avg_Pizzas_Per_order`

### 2. Time-Based Trend Analysis

Queries to identify sales patterns and seasonality:

* `Weekly Trend for total orders`: Analyzes order frequency by day of the week (`DATENAME(DW, order_date)`).
* `Monthly Trend for Total Orders`: Analyzes order frequency by month (`DATENAME(MONTH, order_id)`).

### 3. Sales Segmentation Analysis

Queries to understand which categories and sizes contribute most to sales:

* `% of Sales by Pizza category`: Calculates the percentage share of revenue for each pizza category.
* `% of Sales by pizza size`: Calculates the percentage share of revenue for each pizza size.
* `Total pizzas Sold by pizza category`: Sums the quantity sold per pizza category.

### 4. Best & Worst Sellers

Queries to identify top-performing and underperforming products:

| Metric | Analysis Type | Query Filtering |
| :--- | :--- | :--- |
| **Revenue** | Top 5 & Bottom 5 | `ORDER BY Total_revenue DESC/ASC` |
| **Total Orders** | Top 5 & Bottom 5 | `ORDER BY total_orders DESC/ASC` |
| **Total Quantity** | Top 5 & Bottom 5 | `ORDER BY total_quantity DESC/ASC` |

---

## 🛠 Database Structure

The analysis assumes a single table named `pizza_sales` within a database called `Pizza_db`.

### `pizza_sales` Table Schema (Inferred)

| Column Name | Data Type (Inferred) | Description |
| :--- | :--- | :--- |
| **pizza_id** | INT | Unique identifier for the pizza entry. |
| **order_id** | INT | Unique identifier for the customer order. |
| **pizza_name_id** | VARCHAR | ID for the specific pizza name. |
| **quantity** | INT | Number of pizzas of this type sold in the order. |
| **order_date** | DATE | The date the order was placed. |
| **order_time** | TIME | The time the order was placed. |
| **unit_price** | DECIMAL | Price of a single pizza. |
| **total_price** | DECIMAL | `quantity * unit_price` (Revenue). |
| **pizza_size** | VARCHAR | Size of the pizza (e.g., 'S', 'M', 'L'). |
| **pizza_category** | VARCHAR | Category of the pizza (e.g., 'Chicken', 'Classic'). |
| **pizza_name** | VARCHAR | Full name of the pizza. |

![best/worst_seller](images/pizza2.png)
## 🚀 Getting Started

To replicate this analysis, you will need a SQL database (e.g., SQL Server, MySQL, PostgreSQL) and a dataset matching the inferred schema above.

1.  **Create the Database:**
    ```sql
    CREATE DATABASE Pizza_db;
    USE Pizza_db;
    ```
2.  **Import Data:** Import your sales data into a table named `pizza_sales`.
3.  **Run Queries:** Execute the commands from the `pizza_sales.sql` file.

Feel free to connect or contribute if you have suggestions for further analysis!
