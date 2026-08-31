-- ============================================================
-- Brazilian E-Commerce Olist Analysis
-- Business Analysis Queries (Oracle SQL)
-- 9 core business questions answered directly from the tables
-- ============================================================

-- ============================================================
-- 1. Monthly Sales Trend
-- How do sales change from month to month?
-- ============================================================
SELECT 
    TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM ORDERS o
JOIN ORDER_ITEMS oi ON o.order_id = oi.order_id
WHERE o.order_status <> 'canceled'
GROUP BY TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM')
ORDER BY order_month;


-- ============================================================
-- 2. Top Product Categories
-- Which product categories generate the highest revenue?
-- ============================================================
SELECT 
    ct.product_category_name_english,
    COUNT(oi.order_item_id) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM ORDER_ITEMS oi
JOIN PRODUCTS p ON oi.product_id = p.product_id
JOIN CATEGORY_TRASLATION ct ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY total_revenue DESC
FETCH FIRST 10 ROWS ONLY;


-- ============================================================
-- 3. Best Sellers
-- Which sellers generate the highest revenue?
-- ============================================================
SELECT 
    s.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(oi.order_item_id) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM ORDER_ITEMS oi
JOIN SELLERS s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_city, s.seller_state
ORDER BY total_revenue DESC
FETCH FIRST 10 ROWS ONLY;


-- ============================================================
-- 4. Average Delivery Time
-- How long does delivery take on average?
-- ============================================================
SELECT 
    ROUND(AVG(TRUNC(order_delivered_customer_date) - TRUNC(order_purchase_timestamp)), 1) AS avg_delivery_days,
    MIN(TRUNC(order_delivered_customer_date) - TRUNC(order_purchase_timestamp)) AS min_delivery_days,
    MAX(TRUNC(order_delivered_customer_date) - TRUNC(order_purchase_timestamp)) AS max_delivery_days
FROM ORDERS
WHERE order_delivered_customer_date IS NOT NULL;


-- ============================================================
-- 5. Delivery Delay vs Review Score
-- Does a late delivery affect customer satisfaction?
-- ============================================================
SELECT 
    CASE 
        WHEN TRUNC(o.order_delivered_customer_date) > TRUNC(o.order_estimated_delivery_date) THEN 'Delayed'
        ELSE 'On Time / Early'
    END AS delivery_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM ORDERS o
JOIN ORDER_REVIEWS r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY CASE 
        WHEN TRUNC(o.order_delivered_customer_date) > TRUNC(o.order_estimated_delivery_date) THEN 'Delayed'
        ELSE 'On Time / Early'
    END;


-- ============================================================
-- 6. Sales by Customer State
-- Which states generate the highest revenue?
-- ============================================================
SELECT 
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM ORDERS o
JOIN CUSTOMERS c ON o.customer_id = c.customer_id
JOIN ORDER_ITEMS oi ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_orders DESC
FETCH FIRST 10 ROWS ONLY;


-- ============================================================
-- 7. Average Order Value (AOV)
-- What is the average value of an order (items + freight)?
-- ============================================================
SELECT 
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT o.order_id, SUM(oi.price + oi.freight_value) AS order_total
    FROM ORDERS o
    JOIN ORDER_ITEMS oi ON o.order_id = oi.order_id
    GROUP BY o.order_id
);


-- ============================================================
-- 8. Most Active Customers
-- Which customers placed the most orders?
-- Note: customer_unique_id is used because Olist assigns a new
-- customer_id per order for privacy reasons.
-- ============================================================
SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_spent
FROM ORDERS o
JOIN CUSTOMERS c ON o.customer_id = c.customer_id
JOIN ORDER_ITEMS oi ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
FETCH FIRST 10 ROWS ONLY;


-- ============================================================
-- 9. Payment Methods
-- Which payment methods are most commonly used?
-- ============================================================
SELECT 
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value), 2) AS total_value,
    ROUND(AVG(payment_value), 2) AS avg_payment_value
FROM ORDER_PAYMENTS
GROUP BY payment_type
ORDER BY total_transactions DESC;
