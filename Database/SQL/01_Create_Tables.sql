-- ============================================================
-- Brazilian E-Commerce Olist Analysis
-- Database Schema - Oracle SQL
-- File: 01_Create_Tables.sql
-- ============================================================

-- ============================================================
-- 1. CUSTOMERS
-- ============================================================

CREATE TABLE CUSTOMERS (
    CUSTOMER_ID              VARCHAR2(4000) PRIMARY KEY,
    CUSTOMER_UNIQUE_ID       VARCHAR2(4000),
    CUSTOMER_ZIP_CODE_PREFIX NUMBER,
    CUSTOMER_CITY            VARCHAR2(4000),
    CUSTOMER_STATE           VARCHAR2(4000)
);


-- ============================================================
-- 2. SELLERS
-- ============================================================

CREATE TABLE SELLERS (
    SELLER_ID              VARCHAR2(4000) PRIMARY KEY,
    SELLER_ZIP_CODE_PREFIX NUMBER,
    SELLER_CITY            VARCHAR2(4000),
    SELLER_STATE           VARCHAR2(4000)
);


-- ============================================================
-- 3. PRODUCTS
-- ============================================================

CREATE TABLE PRODUCTS (
    PRODUCT_ID                    VARCHAR2(4000) PRIMARY KEY,
    PRODUCT_CATEGORY_NAME         VARCHAR2(4000),
    PRODUCT_NAME_LANGTH           NUMBER,
    PRODUCT_DESCRIPTION_LANGTH    NUMBER,
    PRODUCT_PHOTOS_QTY            NUMBER,
    PRODUCT_WEIGHT_G              NUMBER,
    PRODUCT_LENGHT_CM             NUMBER,
    PRODUCT_HEIGHT_CM             NUMBER,
    PRODUCT_WIDTH_CM              NUMBER
);


-- ============================================================
-- 4. CATEGORY_TRASLATION
-- ============================================================

CREATE TABLE CATEGORY_TRASLATION (
    PRODUCT_CATEGORY_NAME         VARCHAR2(4000) PRIMARY KEY,
    PRODUCT_CATEGORY_NAME_ENGLISH VARCHAR2(4000)
);


-- ============================================================
-- 5. ORDERS
-- ============================================================

CREATE TABLE ORDERS (
    ORDER_ID                         VARCHAR2(4000) PRIMARY KEY,
    CUSTOMER_ID                      VARCHAR2(4000),
    ORDER_STATUS                     VARCHAR2(4000),
    ORDER_PURCHASE_TIMESTAMP         TIMESTAMP(6),
    ORDER_APPROVED_AT                TIMESTAMP(6),
    ORDER_DELIVERED_CARRIER_DATE     TIMESTAMP(6),
    ORDER_DELIVERED_CUSTOMER_DATE    TIMESTAMP(6),
    ORDER_ESTIMATED_DELIVERY_DATE    TIMESTAMP(6),

    CONSTRAINT FK_ORDER_CUSTOMER
        FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMERS(CUSTOMER_ID)
);


-- ============================================================
-- 6. ORDER_ITEMS
-- ============================================================

CREATE TABLE ORDER_ITEMS (
    ORDER_ID              VARCHAR2(4000),
    ORDER_ITEM_ID         NUMBER,
    PRODUCT_ID            VARCHAR2(4000),
    SELLER_ID             VARCHAR2(4000),
    SHIPPING_LIMIT_DATE   TIMESTAMP(6),
    PRICE                 NUMBER,
    FREIGHT_VALUE         NUMBER,

    CONSTRAINT PK_ORDER_ITEMS
        PRIMARY KEY (ORDER_ID, ORDER_ITEM_ID),

    CONSTRAINT FK_OI_ORDER
        FOREIGN KEY (ORDER_ID)
        REFERENCES ORDERS(ORDER_ID),

    CONSTRAINT FK_OI_PRODUCT
        FOREIGN KEY (PRODUCT_ID)
        REFERENCES PRODUCTS(PRODUCT_ID),

    CONSTRAINT FK_OI_SELLER
        FOREIGN KEY (SELLER_ID)
        REFERENCES SELLERS(SELLER_ID)
);


-- ============================================================
-- 7. ORDER_PAYMENTS
-- ============================================================

CREATE TABLE ORDER_PAYMENTS (
    ORDER_ID              VARCHAR2(4000),
    PAYMENT_SEQUENTIAL    NUMBER,
    PAYMENT_TYPE          VARCHAR2(4000),
    PAYMENT_INSTALLMENTS  NUMBER,
    PAYMENT_VALUE         NUMBER,

    CONSTRAINT PK_ORDER_PAYMENTS
        PRIMARY KEY (ORDER_ID, PAYMENT_SEQUENTIAL),

    CONSTRAINT FK_OP_ORDER
        FOREIGN KEY (ORDER_ID)
        REFERENCES ORDERS(ORDER_ID)
);


-- ============================================================
-- 8. ORDER_REVIEWS
-- ============================================================

CREATE TABLE ORDER_REVIEWS (
    REVIEW_ID                 VARCHAR2(4000) PRIMARY KEY,
    ORDER_ID                  VARCHAR2(4000),
    REVIEW_SCORE              NUMBER,
    REVIEW_COMMENT_TITLE      VARCHAR2(4000),
    REVIEW_COMMENT_MESSAGE    VARCHAR2(4000),
    REVIEW_CREATION_DATE      TIMESTAMP(6),
    REVIEW_ANSWER_TIMESTAMP   TIMESTAMP(6),

    CONSTRAINT FK_OR_ORDER
        FOREIGN KEY (ORDER_ID)
        REFERENCES ORDERS(ORDER_ID)
);


-- ============================================================
-- 9. GEOLOCATION
-- ============================================================

CREATE TABLE GEOLOCATION (
    GEOLOCATION_ZIP_CODE_PREFIX NUMBER,
    GEOLOCATION_LAT              NUMBER,
    GEOLOCATION_LNG              NUMBER,
    GEOLOCATION_CITY             VARCHAR2(4000),
    GEOLOCATION_STATE            VARCHAR2(4000)
);


-- ============================================================
-- END OF DATABASE SCHEMA
-- ============================================================
