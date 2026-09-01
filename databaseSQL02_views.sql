-- ============================================================
-- Brazilian E-Commerce Olist Analysis
-- Analytical Views (Oracle)
-- Extracted via DBMS_METADATA.GET_DDL from PROJECT_USER
-- ============================================================

-- 1. Monthly Sales
CREATE OR REPLACE VIEW VW_MONTHLY_SALES AS
SELECT 
    TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_sales
FROM ORDERS o
JOIN ORDER_ITEMS oi ON o.order_id = oi.order_id
WHERE o.order_status <> 'canceled'
GROUP BY TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM');

-- 2. Top Product Categories
CREATE OR REPLACE VIEW VW_TOP_CATEGORIES AS
SELECT 
    ct.product_category_name_english,
    COUNT(oi.order_item_id) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM ORDER_ITEMS oi
JOIN PRODUCTS p ON oi.product_id = p.product_id
JOIN CATEGORY_TRASLATION ct ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english;

-- 3. Best Sellers
CREATE OR REPLACE VIEW VW_BEST_SELLERS AS
SELECT 
    s.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(oi.order_item_id) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM ORDER_ITEMS oi
JOIN SELLERS s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_city, s.seller_state;

-- 4. Delivery Time
CREATE OR REPLACE VIEW VW_DELIVERY_TIME AS
SELECT 
    o.order_id,
    TRUNC(o.order_delivered_customer_date) - TRUNC(o.order_purchase_timestamp) AS delivery_days
FROM ORDERS o
WHERE o.order_delivered_customer_date IS NOT NULL;

-- 5. Delivery Delay vs Review Score
CREATE OR REPLACE VIEW VW_DELAY_VS_REVIEW AS
SELECT 
    CASE 
        WHEN TRUNC(o.order_delivered_customer_date) > TRUNC(o.order_estimated_delivery_date) THEN 'Delayed'
        ELSE 'On Time / Early'
    END AS delivery_status,
    o.order_id,
    r.review_score
FROM ORDERS o
JOIN ORDER_REVIEWS r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL;

-- 6. Sales by State
CREATE OR REPLACE VIEW VW_SALES_BY_STATE AS
SELECT 
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM ORDERS o
JOIN CUSTOMERS c ON o.customer_id = c.customer_id
JOIN ORDER_ITEMS oi ON o.order_id = oi.order_id
GROUP BY c.customer_state;

-- 7. Order Value (per order)
CREATE OR REPLACE VIEW VW_ORDER_VALUE AS
SELECT 
    o.order_id,
    SUM(oi.price + oi.freight_value) AS order_total
FROM ORDERS o
JOIN ORDER_ITEMS oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- 8. Active Customers
CREATE OR REPLACE VIEW VW_ACTIVE_CUSTOMERS AS
SELECT DISTINCT customer_id
FROM ORDERS
WHERE order_status = 'delivered';

-- 9. Payment Methods
CREATE OR REPLACE VIEW VW_PAYMENT_METHODS AS
SELECT 
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value), 2) AS total_value,
    ROUND(AVG(payment_value), 2) AS avg_payment_value
FROM ORDER_PAYMENTS
GROUP BY payment_type;
