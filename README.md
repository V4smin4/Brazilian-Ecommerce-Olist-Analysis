# Brazilian E-Commerce Olist Analysis

End-to-end database and data analysis project built on the Brazilian E-Commerce Public Dataset by Olist.

The project follows a complete workflow: raw CSV files are loaded and analyzed with Pandas, transformed into a relational Oracle database, queried with SQL, and re-analyzed and visualized with Python from the database.

## Dataset

~100,000 orders from the Brazilian e-commerce marketplace, 2016-2018, across 9 related CSV files covering customers, orders, products, sellers, payments, reviews, geolocation, order items, and product category translations.

Source: [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle)

## Technologies

Oracle Database, SQL Developer, SQL, Python, Pandas, Matplotlib, Jupyter Notebook

## Database

Nine tables built from the original datasets, with primary and foreign key constraints enforcing the relationships between entities. See the [ER diagram](database/SQL/Schema/ER_Diagram.png) for the full schema.

| Table | Rows |
|---|---:|
| CUSTOMERS | 99,441 |
| ORDERS | 99,441 |
| ORDER_ITEMS | 112,650 |
| ORDER_PAYMENTS | 103,886 |
| ORDER_REVIEWS | 82,023* |
| PRODUCTS | 32,951 |
| SELLERS | 3,095 |
| GEOLOCATION | 1,000,163 |
| CATEGORY_TRASLATION | 71 |

\* ~17% of review rows were excluded during import due to malformed multi-line comment fields incompatible with the import tool. Details in `docs/insights.md`.

Nine SQL views were built on top of these tables to answer the core business questions below.

```text
Raw CSV Files
      ↓
Database Design
      ↓
Oracle Database
      ↓
Data Validation
      ↓
SQL Analysis
      ↓
Oracle Views
      ↓
Python Analysis
      ↓
Visualizations
```

## Data Analysis

The analysis was performed in two stages, both in `notebook/Olist_Data_Analysis.ipynb`:

**1. Pandas, on the raw CSV files** — dataset structure, missing values, duplicates, order status, monthly order trends, review scores, delivery time, payment methods, and product category performance.

**2. SQL, via Oracle** — the same core questions answered by querying the database directly from Python using `oracledb`: monthly sales, top product categories, best sellers, delivery time, delivery delay vs. review score, sales by state, average order value, active customers, and payment methods.

## Key Finding

Orders delivered on time or early average a 4.31/5 review score, versus 2.28/5 for delayed orders. Delivery reliability is the strongest driver of customer satisfaction found in this dataset.

Full findings in [`docs/insights.md`](docs/insights.md).

## Project Structure

```text
Brazilian-Ecommerce-Olist-Analysis/
├── README.md
├── Database/
│   ├── SQL/
│   │   ├── 01_create_tables.sql
│   │   ├── 02_views.sql
│   │   ├── 03_analysis_queries.sql
│   │   └── 04_validation.sql
│   └── Schema/
│       └── ER_Diagram.png
├── notebook/
│   └── Olist_Data_Analysis.ipynb
├── screenshots/
│   ├── database/
│   └── analysis/
└── docs/
    └── insights.md
```

## Skills Demonstrated

Relational database design, Oracle, SQL (DDL, joins, aggregations, views), data validation and cleaning, exploratory data analysis, Python, Pandas, Matplotlib, data visualization, business analysis.

## Author

**Yasmina Ahmed Abdel Mohsen**
GitHub: [V4smin4](https://github.com/V4smin4)
