# E-Commerce Sales Analysis

## 1. Project Overview

This project is a personal data analysis portfolio project focused on exploring e-commerce sales performance using SQL and Power BI.

The objective is to demonstrate practical skills in data cleaning and validation, SQL querying, exploratory data analysis, and data visualization.

**Project Type:** Personal Portfolio Project  
**Industry:** E-Commerce  
**Tools:** PostgreSQL, pgAdmin 4, Power BI

This is a self-initiated learning project using a publicly available sample dataset from Kaggle. It does not use real company or client data.

## 2. Business Questions

This analysis explores the following questions:

1. What is the overall sales performance?
2. Which product categories generate the most revenue?
3. Which regions contribute the most revenue?
4. How does revenue change over time?
5. Which payment methods generate the most revenue?
6. Is there an observable relationship between delivery time and customer ratings?
7. How does average order revenue differ across discount levels?

## 3. Dataset

**Source:** [E-Commerce Sales Dataset – Kaggle](https://www.kaggle.com/datasets/abbas829/ecommerce-sales-dataset)

The dataset contains 5,000 order records and includes information such as:

- Order ID
- Order Date
- Customer ID
- Product Category
- Region
- Quantity
- Unit Price
- Discount
- Revenue
- Payment Method
- Delivery Days
- Customer Rating

## 4. Tools and Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Data querying and analysis |
| pgAdmin 4 | Database management |
| Power BI | Data visualization and dashboard development |

## 5. Project Workflow

1. **Data Import:** Imported the Kaggle dataset into PostgreSQL.
2. **Data Validation:** Checked missing values, duplicate order IDs, and revenue calculation consistency.
3. **SQL Analysis:** Used SQL queries to explore sales performance, product categories, regions, payment methods, discounts, and customer behavior.
4. **Data Visualization:** Developed an interactive Power BI dashboard to present the analysis.

## 6. Key Findings

### Overall Performance

| Metric | Result |
|---|---:|
| Total Revenue | 5,109,775.74 |
| Total Orders | 5,000 |
| Unique Customers | 989 |
| Average Order Revenue | 1,021.96 |
| Average Customer Rating | 2.97 |

### Revenue by Product Category

- Electronics generated the highest revenue, contributing approximately 35.81% of total revenue.
- Clothing contributed approximately 29.98%.
- Home contributed approximately 19.22%.
- Beauty contributed approximately 14.99%.

### Regional Performance

- The West region recorded the highest revenue.
- The North region ranked second.
- The South and East regions followed.

### Payment Methods

- Card payments generated the highest revenue among the three payment methods.
- Cash on Delivery (COD) ranked second.
- Wallet payments ranked third.

### Discount Analysis

- Orders with discounts below 10% had the highest average order revenue.
- Orders with discounts of 20% or more had the lowest average order revenue.

These results describe an observed association and do not establish that higher discounts cause lower revenue.

## 7. Power BI Dashboard

The interactive dashboard includes:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Revenue
- Average Customer Rating
- Revenue by Product Category
- Revenue by Region
- Revenue Trend Over Time
- Revenue by Payment Method
- Customer Rating by Delivery Time
- Average Order Revenue by Discount Level

Dashboard preview:

<!-- Add your dashboard screenshot here -->

## 8. Repository Structure

```text
ecommerce-sales-analysis/
│
├── README.md
├── dashboard/
│   └── ecommerce_sales_dashboard.pbix
├── sql/
│   └── ecommerce_analysis.sql
├── images/
│   └── dashboard_preview.png
└── data/
    └── README.md
```

## 9. Limitations

- The dataset is publicly available sample data and is not verified company transaction data.
- The dataset contains dates ranging from 2022 to 2035. This unusual date range should be considered when interpreting time-based results.
- The analysis is descriptive and does not establish causal relationships.
- Findings should be interpreted within the limitations of the dataset.

## 10. Author

Personal data analysis portfolio project.
