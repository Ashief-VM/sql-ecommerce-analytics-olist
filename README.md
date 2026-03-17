# SQL E-Commerce Analytics — Olist Brazilian Dataset

Practical SQL analytics queries written against the
[Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
— a real-world dataset containing 100,000+ orders from a Brazilian marketplace.

## Dataset Overview

The Olist dataset contains interconnected tables covering:
- Orders and order items
- Customers and sellers
- Products and categories
- Payments and reviews
- Delivery timestamps and geolocation

## Queries

### 1. Top 10 Product Categories by Revenue
Calculates total revenue (price + freight) per product category.
Joins order items, products, and category translation tables.
Uses GROUP BY and aggregate functions to rank categories by commercial value.

### 2. Customers Who Never Left a Review
Identifies customers who placed orders but submitted no review.
Uses a LEFT JOIN with NULL check to find the gap between order and review tables.
Useful for targeting re-engagement or feedback campaigns.

### 3. High-Performing Sellers by Delivered Orders
Finds sellers with a strong delivery track record.
Filters by order status and applies HAVING clause to enforce a minimum threshold.
Useful for seller quality analysis and partnership decisions.

### 4. Monthly Payment Breakdown by Type
Classifies payments into buckets (card, voucher, other) using CASE WHEN logic.
Aggregates order count and total payment value per bucket per month.
Useful for understanding payment trends and channel performance over time.

### 5. Average Delivery Delay by State
Calculates average delay between estimated and actual delivery per customer state.
Uses DATEDIFF and filters to surface only states with above-average delays.
Useful for identifying logistics performance gaps by region.

### 6. Monthly Orders and Revenue Trend
Aggregates total orders and revenue per month using DATE_FORMAT.
Essential time-series query — the most common opening question in any analytics challenge.
Demonstrates GROUP BY on a derived date column with dual aggregations.

### 7. High Volume Low Satisfaction Categories
Identifies product categories with high order volume but poor review scores.
Uses HAVING with two conditions to surface categories needing product team attention.
Directly applicable to e-commerce product strategy decisions.

### 8. Seller Performance Scorecard
Builds a complete seller quality profile — revenue, order count, 1-star and 5-star review
counts, and 5-star percentage.
Uses CASE WHEN inside SUM to pivot review scores into columns.
Useful for marketplace seller ranking and quality management.

### 9. Customers Above Average Spend
Identifies high-value customers who spend more than the global average.
Uses a CTE combined with a window function (AVG OVER) and a subquery filter.
Demonstrates multi-layer SQL thinking with CTEs and window functions.

### 10. Top 3 Sellers Per State — Regional Leaderboard
Ranks sellers by total revenue within each state and returns the top 3 per state.
Uses two chained CTEs — one to aggregate revenue, one to apply RANK() with PARTITION BY.
Common pattern in real dashboards for regional performance leaderboards.

### 11. First Order Per Customer — Deduplication Pattern
Retrieves the first order for each unique customer based on purchase timestamp.
Uses RANK() partitioned by customer to identify the earliest transaction per person.
A fundamental deduplication pattern used constantly in data cleaning and pipeline work.

## Tools Used
- MySQL 8.0
- MySQL Workbench
- Dataset loaded via Python (Pandas + mysql-connector-python)

## Skills Demonstrated
- Multi-table JOINs (INNER, LEFT)
- Aggregate functions (SUM, COUNT, AVG, ROUND)
- GROUP BY and HAVING
- CASE WHEN classification
- Date functions (DATE_FORMAT, DATEDIFF)
- Query filtering and ordering
- CTE (Common Table Expressions) — WITH clause
- Chained CTEs — multiple CTEs in one query
- Window functions — RANK(), AVG OVER(), PARTITION BY
- Deduplication patterns

## Status
Active — 11 queries completed and growing.
Next: cohort retention analysis, LAG for month-over-month growth, and funnel analysis.
