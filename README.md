#  Pizza-Sales-Analysis (SQL Project)

# Project overview:
This project analyzes pizza sales data using SQL to uncover key business insights such as revenue trends, top-selling pizzas, and customer preferences. The goal is to demonstrate SQL skills in data extraction, transformation, and analysis to support data-driven decision-making.

# Tools & Tech:
DataBase - MySQL
Language - SQL

# Dataset: 
The dataset contains information about pizza types, size, price, orders and order details.
source - kaggel.com [ https://github.com/Kneha256/SQL-Pizza-Sales-Analysis/tree/main/Dataset ]
Key Table:
  1. orders - order_date, order_time and order_id
  2. order_details - quantity and pizza_id
  3. pizzas - pizza_id, price and pizza_type_id
  4. pizza_types - category and ingredients

# UseCases:
Basic:
Retrieve the total number of orders placed.
Calculate the total revenue generated from pizza sales.
Identify the highest-priced pizza.
Identify the most common pizza size ordered.
List the top 5 most ordered pizza types along with their quantities.
find the top 3 pizza sizes that generated the highest revenue.

Intermediate:
Join the necessary tables to find the total quantity of each pizza category ordered.
Determine the distribution of orders by hour of the day.
Join relevant tables to find the category-wise distribution of pizzas.
Group the orders by date and calculate the average number of pizzas ordered per day.
Determine the top 3 most ordered pizza types based on revenue.

Advanced:
Calculate the percentage contribution of each pizza type to total revenue.
Analyze the cumulative revenue generated over time.
Determine the top 3 most ordered pizza types based on revenue for each pizza category.

