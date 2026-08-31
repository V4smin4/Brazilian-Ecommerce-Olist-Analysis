
# Business Insights

Key findings from the analysis of the Olist e-commerce dataset (99,441 orders, 2016–2018).

## Sales Trend

Monthly sales grew steadily from late 2016 through 2017, peaking in November 2017 (R$1,003,862) — likely driven by Black Friday. Revenue stayed in a similar high range through mid-2018 before the dataset cuts off in September 2018.

## Product Categories

`health_beauty` and `watches_gifts` generated the highest revenue despite `bed_bath_table` having more items sold, indicating a higher average item price in the top categories.

## Sellers and Geography

All 10 top sellers by revenue are based in São Paulo (SP). SP also leads by a wide margin in customer count and total revenue among Brazilian states, consistent with it being the country's main economic hub.

## Delivery Performance

Average delivery time is 12.5 days (0 to 210 days range).

## Delivery Delay vs Customer Satisfaction

This is the strongest relationship found in the dataset. Orders delivered on time or early average a **4.31/5** review score, while delayed orders drop to **2.28/5**. Delivery reliability is the single biggest driver of customer satisfaction identified in this analysis.

## Average Order Value

R$160.58 per order (items + freight).

## Payment Methods

Credit card is the dominant payment method (76,795 of 103,886 transactions, 73.9%), followed by boleto (19%). Voucher payments have the lowest average value (R$65.70), consistent with their use as partial discounts rather than a primary payment method.

## Data Quality Note

During import, ~17% of `order_reviews` rows (17,201 of 99,224) were excluded due to malformed multi-line text fields in customer comments that were incompatible with the import tool used. This does not affect the integrity of the remaining 82,023 records or any other table in the database.
