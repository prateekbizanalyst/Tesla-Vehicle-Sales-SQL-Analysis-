# Tesla-Vehicle-Sales-SQL-Analysis-
SQL data analysis project exploring Tesla vehicle sales, revenue, inventory, customer satisfaction, delivery performance, and regional trends using PostgreSQL.
🚗 Tesla Vehicle Sales & Performance Analysis

An SQL-based data analysis project using PostgreSQL to analyze Tesla vehicle sales, revenue, regional performance, inventory, delivery efficiency, customer satisfaction, and return rates.

📌 Project Overview

This project analyzes Tesla vehicle sales data to identify important business trends and performance patterns across different regions, countries, and vehicle models.

The dataset was downloaded from Kaggle in CSV format, imported into PostgreSQL using pgAdmin 4, and analyzed using SQL.

The project focuses on transforming raw sales data into meaningful business insights using both fundamental and advanced SQL techniques.

🎯 Business Objective

The main objective of this project is to analyze Tesla's sales and operational performance and answer key business questions related to:

Sales and revenue performance
Vehicle model performance
Regional and country-level sales
Pricing and discount trends
Inventory levels
Delivery performance
Customer satisfaction
Return rates
Yearly and monthly sales trends

The analysis aims to identify high-performing markets and vehicle models, understand operational challenges, and highlight areas that may require further business attention.

📊 Dataset

Source: Kaggle

Dataset: Tesla Vehicle Sales Performance

The dataset was downloaded from Kaggle as a CSV file and imported into PostgreSQL for analysis.

Dataset Columns
Column	Description
order_id	Unique identifier for each order
order_date	Date of the order
year	Year of the order
region	Sales region
country	Country associated with the sale
vehicle_model	Tesla vehicle model
units_sold	Number of vehicles sold
average_vehicle_price_usd	Average vehicle price in USD
discount_usd	Discount provided in USD
net_revenue_usd	Net revenue generated in USD
ending_inventory_units	Units remaining in inventory
average_delivery_days	Average delivery time in days
customer_rating	Customer rating
return_rate	Product return rate

📚 Key Learning Outcomes

Through this project, I developed practical experience in:

Importing CSV data into PostgreSQL
Designing and working with SQL tables
Performing data-quality checks
Writing SQL queries for business problems
Aggregating large datasets
Analyzing sales and revenue
Performing geographic analysis

💡 Business Insights

The analysis is designed to identify insights related to:

Top-performing Tesla models
Highest-revenue markets
Sales growth trends
Pricing and discount behavior
Inventory performance
Delivery efficiency
Customer satisfaction
Return-rate patterns

Note: Specific numerical findings will be added here based on the final validated SQL results.

📂 Project Structure
Tesla-Vehicle-Sales-SQL-Analysis/
│
├── README.md
│
└── SQL/
    └── Tesla_Vehicle_Sales_Analysis.sql
