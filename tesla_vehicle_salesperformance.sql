
CREATE TABLE tesla_sales (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    year INT,
    region VARCHAR(100),
    country VARCHAR(100),
    vehicle_model VARCHAR(50),
    units_sold INT,
    average_vehicle_price_usd NUMERIC(12,2),
    discount_usd NUMERIC(12,2),
    net_revenue_usd NUMERIC(14,2),
    ending_inventory_units INT,
    average_delivery_days INT,
    customer_rating NUMERIC(3,2),
    return_rate NUMERIC(5,3)
);

--IMPORTING DATA


COPY tesla_sales(order_id, order_date, year, region, country, vehicle_model, units_sold, average_vehicle_price_usd, discount_usd, net_revenue_usd, ending_inventory_units, average_delivery_days, customer_rating, return_rate
) 
FROM 'D:\tesla_vehicle_sales_performance.csv' 
CSV HEADER;

select * from tesla_sales


			--BASIC BUSINESS QUESTIONS
		  

--Q1 What is total revenue?
SELECT ROUND(SUM(net_revenue_usd), 2) 
AS total_revenue
FROM tesla_sales;

--Q2 How many vehicles were sold?
SELECT SUM(units_sold) 
AS total_units_sold
FROM tesla_sales;

--Q3 What is the average vehicle price?
SELECT ROUND(AVG(average_vehicle_price_usd), 2) 
AS avg_vehicle_price
FROM tesla_sales;

--Q4 What is the average customer rating?
SELECT ROUND(AVG(customer_rating), 2) 
AS avg_customer_rating
FROM tesla_sales;


			--ANALYSE TESLA MODELS


--Q5 Which model sells the most?
SELECT vehicle_model,
    SUM(units_sold) AS total_units_sold
FROM tesla_sales
GROUP BY vehicle_model
ORDER BY total_units_sold DESC;

--Q6 Which model generates the most revenue?
SELECT vehicle_model,
    ROUND(SUM(net_revenue_usd), 2) AS total_revenue
FROM tesla_sales
GROUP BY vehicle_model
ORDER BY total_revenue DESC;

--Q7 Which model has the highest average selling price?
SELECT vehicle_model,
    ROUND(AVG(average_vehicle_price_usd), 2) AS avg_price
FROM tesla_sales
GROUP BY vehicle_model
ORDER BY avg_price DESC;

--Q8 Which model has the highest return rate?
SELECT vehicle_model,
    ROUND(AVG(return_rate) * 100, 2) AS avg_return_rate_percent
FROM tesla_sales
GROUP BY vehicle_model
ORDER BY avg_return_rate_percent DESC;


			--GEOGRAPHIC ANALYSIS 🌎


--Q9 Which region generates the most revenue?
SELECT region,
    ROUND(SUM(net_revenue_usd), 2) AS total_revenue
FROM tesla_sales
GROUP BY region
ORDER BY total_revenue DESC;

--Q10 Which countries sell the most vehicles?
SELECT country,
    SUM(units_sold) AS total_units_sold
FROM tesla_sales
GROUP BY country
ORDER BY total_units_sold DESC;

--Q11 Which country generates the most revenue?
SELECT country,
    ROUND(SUM(net_revenue_usd), 2) AS total_revenue
FROM tesla_sales
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;


			--TIME-SERIES ANALYSIS 📅


--Q12 Monthly revenue
SELECT DATE_TRUNC
('month', order_date) AS month,
    ROUND(SUM(net_revenue_usd), 2) AS monthly_revenue
FROM tesla_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


--Q13 Monthly units sold
SELECT DATE_TRUNC
('month', order_date) AS month,
    SUM(units_sold) AS units_sold
FROM tesla_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

--Q14 Yearly revenue
SELECT year,
    ROUND(SUM(net_revenue_usd), 2) AS total_revenue
FROM tesla_sales
GROUP BY year
ORDER BY year;


			--PRICING & DISCOUNT ANALYSIS 💰


--Q15 Which countries have the highest inventory?
SELECT country,
    SUM(ending_inventory_units) AS ending_inventory
FROM tesla_sales
GROUP BY country
ORDER BY ending_inventory DESC;

--Q16 Which models have the best customer ratings?
SELECT vehicle_model,
    ROUND(AVG(customer_rating), 2) AS avg_rating
FROM tesla_sales
GROUP BY vehicle_model
ORDER BY avg_rating DESC;

--Q17 Which countries have the longest delivery times?
SELECT country,
    ROUND(AVG(average_delivery_days), 2) AS avg_delivery_days
FROM tesla_sales
GROUP BY country
ORDER BY avg_delivery_days DESC;


			--ADVANCE ANALYSIS
			

--Q18 Find the top-performing model in each region:
SELECT *FROM (
    SELECT region,
        vehicle_model,
        SUM(units_sold) AS total_units,

        RANK() OVER (
            PARTITION BY region
            ORDER BY SUM(units_sold) DESC
        ) AS model_rank

    FROM tesla_sales

    GROUP BY
        region,
        vehicle_model
) ranked
WHERE model_rank = 1;

--Q19 Calculate month-over-month revenue:
WITH monthly_sales AS (

    SELECT
        DATE_TRUNC('month', order_date) AS month,
        SUM(net_revenue_usd) AS revenue

    FROM tesla_sales

    GROUP BY DATE_TRUNC('month', order_date)
)

SELECT
    month,
    ROUND(revenue, 2) AS revenue,

    ROUND(
        LAG(revenue) OVER (
            ORDER BY month
        ),
        2
    ) AS previous_month_revenue

FROM monthly_sales
ORDER BY month;