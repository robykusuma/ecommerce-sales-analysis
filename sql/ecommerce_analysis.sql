-- E-COMMERCE SALES ANALYSIS
-- PostgreSQL | Table: ecommerce_sales

-- 1. DATA OVERVIEW
SELECT COUNT(*) AS total_rows
FROM ecommerce_sales;

SELECT *
FROM ecommerce_sales
LIMIT 10;


-- 2. DATA QUALITY CHECKS
SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS non_null_order_ids,
    COUNT(order_date) AS non_null_order_dates,
    COUNT(customer_id) AS non_null_customer_ids,
    COUNT(revenue) AS non_null_revenues
FROM ecommerce_sales;

SELECT
    COUNT(*) - COUNT(DISTINCT order_id) AS duplicate_orders
FROM ecommerce_sales;

-- Revenue validation: quantity * unit_price * (1 - discount).
-- Tolerance of 0.02 allows for minor rounding differences.
SELECT COUNT(*) AS mismatched_revenue
FROM ecommerce_sales
WHERE ABS(revenue - quantity * unit_price * (1 - discount)) > 0.02;

SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM ecommerce_sales;


-- 3. OVERALL SALES PERFORMANCE
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_order_revenue,
    ROUND(AVG(customer_rating), 2) AS average_customer_rating,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM ecommerce_sales;


-- 4. REVENUE BY PRODUCT CATEGORY
SELECT
    product_category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (), 2) AS revenue_percentage
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

SELECT
    product_category,
    COUNT(*) AS total_orders,
    ROUND(AVG(revenue), 2) AS average_order_revenue,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_order_revenue DESC;


-- 5. REVENUE TREND OVER TIME
SELECT
    DATE_TRUNC('month', order_date)::DATE AS month,
    COUNT(*) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY month
ORDER BY month;

SELECT
    DATE_TRUNC('month', order_date)::DATE AS month,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY month
ORDER BY total_revenue DESC
LIMIT 1;


-- 6. REGIONAL PERFORMANCE
SELECT
    region,
    COUNT(*) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC;

SELECT
    region,
    product_category,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY region, product_category
ORDER BY region, total_revenue DESC;


-- 7. PAYMENT METHOD ANALYSIS
SELECT
    payment_method,
    COUNT(*) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_order_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_revenue DESC;


-- 8. DISCOUNT ANALYSIS
SELECT
    CASE
        WHEN discount < 0.10 THEN 'Low (<10%)'
        WHEN discount < 0.20 THEN 'Medium (10-19%)'
        ELSE 'High (20%+)'
    END AS discount_group,
    COUNT(*) AS total_orders,
    ROUND(AVG(revenue), 2) AS average_order_revenue,
    ROUND(AVG(customer_rating), 2) AS average_customer_rating
FROM ecommerce_sales
GROUP BY discount_group
ORDER BY average_order_revenue DESC;


-- 9. CUSTOMER ANALYSIS
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_spending
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 10;

SELECT
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE order_count > 1) AS repeat_customers,
    ROUND(COUNT(*) FILTER (WHERE order_count > 1) * 100.0 / COUNT(*), 2) AS repeat_customer_percentage
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM ecommerce_sales
    GROUP BY customer_id
) AS customer_orders;


-- 10. DELIVERY AND CUSTOMER SATISFACTION
SELECT
    delivery_days,
    ROUND(AVG(customer_rating), 2) AS average_customer_rating,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY delivery_days
ORDER BY delivery_days;

SELECT
    delivery_days,
    COUNT(*) FILTER (WHERE customer_rating <= 2) AS low_rating_orders,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) FILTER (WHERE customer_rating <= 2) * 100.0 / COUNT(*),
        2
    ) AS low_rating_percentage
FROM ecommerce_sales
GROUP BY delivery_days
ORDER BY delivery_days;
