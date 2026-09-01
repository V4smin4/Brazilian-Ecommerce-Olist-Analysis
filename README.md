# Brazilian-Ecommerce-Olist-Analysis

End-to-End Brazilian E-Commerce Data Analysis using Oracle Database, SQL, Python, Pandas, and Matplotlib.

## 📌 Project Overview

This project is an end-to-end Data Analytics and Database project based on the Brazilian E-Commerce Public Dataset by Olist.

The project follows a complete analytical workflow, starting from raw e-commerce CSV files, transforming the data into a relational Oracle database, performing SQL-based analysis, and finally analyzing and visualizing the data using Python, Pandas, and Matplotlib.

The project combines:

- Database Design and Management
- Oracle Database
- SQL
- Data Validation
- Data Analysis
- Python
- Pandas
- Matplotlib
- Data Visualization
- Business Insights

The main goal is to transform real-world e-commerce data into meaningful analytical insights through a structured database and data analysis workflow.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Design and organize a relational e-commerce database.
- Store and manage real-world e-commerce data.
- Apply SQL queries for data exploration and analysis.
- Perform data validation and data quality checks.
- Analyze order and customer behavior.
- Identify sales trends over time.
- Analyze product categories and sellers.
- Analyze delivery performance and customer reviews.
- Analyze payment methods.
- Create meaningful data visualizations.
- Extract business insights from the data.
- Document the complete analytical workflow.

---

## 📊 Dataset

The project uses the Brazilian E-Commerce Public Dataset by Olist.

The dataset contains approximately 100,000 orders from the Brazilian e-commerce marketplace between 2016 and 2018.

The original dataset consists of nine related CSV files covering customers, orders, products, sellers, payments, reviews, geolocation, order items, and product category translations.

### Data Source

[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 🛠️ Technologies and Tools

- Oracle Database
- SQL Developer
- SQL
- Python
- Pandas
- Matplotlib
- Jupyter Notebook
- GitHub

---

## 🗄️ Database

The database component was implemented using Oracle Database.

The project contains nine tables based on the original Olist datasets:

| Table | Rows |
|---|---:|
| CUSTOMERS | 99,441 |
| ORDERS | 99,441 |
| ORDER_ITEMS | 112,650 |
| ORDER_PAYMENTS | 103,886 |
| ORDER_REVIEWS | 99,224* |
| PRODUCTS | 32,951 |
| SELLERS | 3,095 |
| GEOLOCATION | 1,000,163 |
| CATEGORY_TRASLATION | 71 |

\* The row count reflects the dataset loaded during the analysis stage. Database validation scripts are included in the project.

The database design includes primary keys and foreign key relationships between the main entities.

### Database Workflow

```text
Raw CSV Files
      ↓
Data Understanding
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
      ↓
Business Insight
```
ذ`


Insights
🔍 Data Analysis

The analysis was performed in two stages.

1. Analysis using Pandas

The original CSV files were loaded and analyzed using Python and Pandas.

The analysis included:

Dataset structure and dimensions
Missing values
Duplicate records
Data types
Date conversion
Order status analysis
Monthly order trends
Review score analysis
Review score distribution
Delivery-related analysis
Payment analysis
Sales analysis
Customer and product analysis
2. Analysis using Oracle Database

The same data was then analyzed through the Oracle database using SQL and Python.

Python was connected to Oracle using the oracledb library.

SQL views were created to support analytical questions such as:

Monthly sales
Top product categories
Best sellers
Delivery time
Delivery delay versus review score
Sales by customer state
Average order value
Active customers
Payment methods
📈 Visualizations

The project includes multiple visualizations created using Python and Matplotlib.

Examples include:

Order Status Distribution
Monthly Order Trend
Review Score Distribution
Sales Trends
Top Product Categories
Top Sellers
Delivery Time Distribution
Delivery Delay vs Review Score
Sales by State
Payment Methods Distribution

The generated visualizations are available in:

Data_Analysis/Visualizations/
💡 Key Insights

The analysis produced several business insights related to:

Order growth over time
Order status distribution
Customer review behavior
Delivery performance
Product category performance
Seller performance
Regional sales
Payment method usage
Average order value

One of the main findings from the analysis was the relationship between delivery performance and customer satisfaction.

Orders delivered on time or earlier achieved a higher average review score than delayed orders, indicating that delivery reliability has a strong relationship with customer satisfaction.

Detailed findings are documented in:

Documentation/Insights.md
🧪 Data Validation

Data quality checks were performed during the project, including:

Row counts
Column counts
Missing values
Duplicate records
Data types
Foreign key relationships
Database table validation

The validation SQL scripts are available in:

Database/SQL/03_Validation.sql
📁 Project Structure
Brazilian-Ecommerce-Olist-Analysis/
│
├── README.md
│
├── Database/
│   ├── SQL/
│   │   ├── 01_Create_Tables.sql
│   │   ├── 02_Insert_Data.sql
│   │   ├── 03_Validation.sql
│   │   ├── 04_Analysis_Queries.sql
│   │   └── 05_Views.sql
│   │
│   ├── Schema/
│   │   └── ER_Diagram.png
│   │
│   └── Documentation/
│       └── Database_Design.md
│
├── Data_Analysis/
│   ├── Notebook/
│   │   └── Olist_Data_Analysis.ipynb
│   │
│   ├── Python/
│   │
│   └── Visualizations/
│
├── Documentation/
│   ├── Project_Overview.md
│   ├── Data_Analysis.md
│   └── Insights.md
│
└── Screenshots/
    ├── Oracle/
    ├── SQL/
    └── Jupyter/
🚀 Project Workflow

The complete project workflow was:

1. Collect the original Olist datasets
2. Load and inspect the CSV files
3. Perform data quality checks
4. Clean and prepare the data
5. Design the relational database
6. Create Oracle tables
7. Load the data into Oracle
8. Validate the database
9. Create SQL analytical queries
10. Create analytical views
11. Connect Python to Oracle
12. Perform data analysis
13. Create visualizations
14. Extract business insights
15. Document the project
📚 Skills Demonstrated

This project demonstrates practical skills in:

Relational Database Design
Oracle Database
SQL
DDL and DML
Primary and Foreign Keys
Joins
Aggregations
SQL Views
Data Validation
Data Cleaning
Exploratory Data Analysis
Python
Pandas
Matplotlib
Data Visualization
Business Analysis
Technical Documentation
## 👩‍💻 Author

**Yasmina Ahmed Abdel Mohsen**

GitHub: [V4smin4](https://github.com/V4smin4)


