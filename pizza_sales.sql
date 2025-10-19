CREATE DATABASE Pizza_db;
USE Pizza_db;

SELECT * FROM pizza_sales;

-- Total revenue
SELECT
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM pizza_sales;

-- total orders
SELECT
	COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales;

-- Total Pizzas Sold 
SELECT 
	SUM(quantity) as Total_pizzas_sold
FROM pizza_sales;


-- Average Order value
SELECT
	CAST(SUM(total_price) / (SELECT COUNT(DISTINCT order_id) FROM pizza_sales) AS DECIMAL (10,2)) AS Average_Order_Value
FROM pizza_sales

-- Average Pizzas Per Order 
SELECT  
	CAST(CAST(SUM(quantity) AS DECIMAL (10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_order
FROM pizza_sales

-- Weekly Trend for total orders
SELECT 
	 DATENAME(DW, order_date) AS order_day,
	 COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY total_order;

-- Monthly Trend for Total Orders
SELECT
	DATENAME(MONTH, order_id) AS Order_Month,
	COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_id)
ORDER BY total_order DESC;


-- % of Sales by Pizza category
SELECT
	pizza_category,
	CAST(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) *100 AS DECIMAL (10,2))as Sales_PCT
FROM pizza_sales
GROUP BY pizza_category;

-- % of Sales by pizza size
SELECT
	pizza_size,
	CAST(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) *100 AS DECIMAL (10,2))as Sales_PCT
FROM pizza_sales
GROUP BY pizza_size;

-- Total pizzas Sold by pizza category
SELECT
	pizza_category,
	SUM(quantity) as Total_quantity
FROM pizza_sales
GROUP BY pizza_category;

-- Top 5 best sellers by total revenue
SELECT TOP 5
pizza_name,
SUM(total_price) as Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC;

-- Top 5 Best seller by total orders
SELECT
TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC;

-- top 5 best seller by total quantity
SELECT
TOP 5
pizza_name,
SUM(quantity) as total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC;

-- Bottom 5 worst sellers by total Revenue
SELECT TOP 5
pizza_name,
CAST(SUM(total_price) AS DECIMAL (10,2))as Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue ASC;

-- Bottom 5 Best seller by total orders
SELECT
TOP 5
	pizza_name,
	COUNT(DISTINCT order_id) total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC;

-- top 5 best seller by total quantity
SELECT
TOP 5
pizza_name,
SUM(quantity) as total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC;
