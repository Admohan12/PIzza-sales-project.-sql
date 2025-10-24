🍕 Pizza Sales Analysis (PostgreSQL)

This SQL project analyzes pizza sales data by category and calculates each category’s contribution to total revenue.
The query filters records for January orders and summarizes total sales and their percentage share.

Key Highlights:

Extracts the month from order_date using EXTRACT(MONTH FROM order_date).

Aggregates sales with SUM(total_price).

Calculates category-wise sales percentage of total revenue.

Uses ROUND(..., 2) for a clean, two-decimal percentage output.

Output Columns:

pizza_category → Type of pizza (e.g., Classic, Supreme, Veggie).

total_sales → Total sales amount for the category.

percentage → Category’s revenue share in total sales (%).

Tech Stack: PostgreSQL
