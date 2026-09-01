# Brazilian-Ecommerce-Olist-Analysis
End-to-End Brazilian E-Commerce Data Analysis using Oracle Database, SQL, Python, Pandas, and Matplotlib.

## 📌 Project Overview

This project is an end-to-end Data Analytics and Database project based on the Brazilian E-Commerce Public Dataset by Olist.

The project combines:

- Database Design and Management
- SQL
- Oracle Database
- Data Analysis
- Python
- Pandas
- Matplotlib
- Data Visualization
- Business Insights

The goal is to transform raw e-commerce data into meaningful analytical insights using a structured database and Python-based data analysis.
# Brazilian E-Commerce Olist Analysis

End-to-end database and data analysis project built on the Brazilian E-Commerce Public Dataset by Olist (Kaggle, ~100K orders, 2016-2018).

## Overview

This project takes raw e-commerce data through a full analytical pipeline: relational database design in Oracle, SQL-based business analysis, and Python/Pandas exploration and visualization of the same data.

## Stack

- Oracle Database (SQL Developer)
- SQL (DDL, joins, aggregations, views)
- Python, Pandas, Matplotlib
- Jupyter Notebook

## Database

9 tables built from the original Olist CSV files, with primary and foreign key constraints enforcing the relationships between customers, orders, order items, products, sellers, payments, reviews, and geolocation data.

- `customers` — 99,441 rows
- `orders` — 99,441 rows
- `order_items` — 112,650 rows
- `order_payments` — 103,886 rows
- `order_reviews` — 82,023 rows (see note below)
- `products` — 32,951 rows
- `sellers` — 3,095 rows
- `geolocation` — 1,000,163 rows
- `category_traslation` — 71 rows

9 SQL views were built on top of these tables to answer specific business questions (monthly sales, top categories, best sellers, delivery time, delivery delay vs review score, sales by state, average order value, active customers, payment methods).

See `Database/SQL/` for the schema, views, and analysis queries, and `docs/insights.md` for the business findings.

## Data Analysis

The Jupyter notebook (`notebook/Olist_Data_Analysis.ipynb`) covers two passes over the data:

1. Analysis directly on the raw CSV files using Pandas
2. The same core questions answered by querying the Oracle database from Python via `oracledb`

## Key Finding

Orders delivered on time or early average a 4.31/5 review score, versus 2.28/5 for delayed orders — delivery reliability is the strongest driver of customer satisfaction found in this dataset.

Full findings in `docs/insights.md`.

## Project Structure

## Data Source

[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) on Kaggle.


---

## 🎯 Project Objectives

The main objectives of this project are to:

- Design and organize an e-commerce database.
- Store and manage real-world e-commerce data.
- Apply SQL queries for data exploration and analysis.
- Perform data validation and data quality checks.
- Analyze sales and customer behavior.
- Identify sales trends over time.
- Create meaningful data visualizations.
- Extract business insights from the data.
- Document the complete analytical workflow.

---

## 🗄️ Database

The database component of the project is implemented using Oracle Database.

It covers:

- Database structure
- Tables
- Primary Keys
- Foreign Keys
- Data validation
- SQL queries
- Views
- Analytical queries
- Database documentation

### Database Workflow

```text
Raw Data
   ↓
Database Design
   ↓
Oracle Database
   ↓
Data Validation
   ↓
SQL Analysis
   ↓
Analytical Results
