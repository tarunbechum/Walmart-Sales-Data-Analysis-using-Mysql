# Walmart Sales Data Analysis using Mysql 


This project analyzes Walmart sales data from Kaggle, covering three branches in Mandalay, Yangon, and Naypyitaw. It explores product details, sales transactions, customer info, and payment methods. The goal is to identify key factors influencing sales, highlight top products and branches, and suggest strategies for optimization.



## SQL CODE and KAGGLE DATABASE 

[ SQL CODE](https://github.com/tarunbechum/Walmart-Sales-Data-Analysis-using-Mysql/blob/main/Walmart-Sales-Data-Analysis-using-Mysql.sql)

[DATA BASE](https://github.com/tarunbechum/Walmart-Sales-Data-Analysis-using-Mysql/blob/main/WalmartSalesData.csv.csv)


## PROJECT OVERVIEW:

### Objective
Understand the Walmart sales data to improve and optimize sales strategies.

### Data Description
Dataset from Kaggle with 17 columns and 1000 rows, covering details such as invoice ID, branch, city, customer type, gender, product line, unit price, quantity, VAT, total, date, time, payment method, COGS, gross income, and rating.

## About Data

The dataset was obtained from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting). This dataset contains sales transactions from three different branches of Walmart, respectively located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solve        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method                 | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |




## Approach Used:

 - Data Wrangling: Inspect and handle missing values.
 -  Database Creation: Build tables and insert data.
 - Feature Engineering: Create new columns for time_of_day, day_name, and month_name.
 - Exploratory Data Analysis (EDA): Analyze data to answer specific questions and achieve project aims.

 ## Analysis Categories

 ### Product Analysis
 - Explore product lines, identify top-performing products, and assess sales trends.

### Sales Analysis:

- Analyse sales trends, assess the effectiveness of sales strategies, and propose modifications. Customer Analysis:

-  Uncover customer segments, study purchase trends, and evaluate the profitability of different customer segments.

## Approach

### Data Wrangling:
- Inspect and handle NULL values. 
-  Build a robust database structure. 

### Feature Engineering:

- Introduce new columns for deeper insights

### Exploratory Data Analysis (EDA):
- Conducted to address project goals.

## Business Questions:

### Generic Questions:

1) Unique cities in the data.
2) Cities of each branch.

### Product:

1) Common payment method.
2) Top-selling product line.
3) Monthly total revenue.
4) Month with the largest COGS.
5) Product line with the largest revenue.
6) City with the largest revenue.
7) Product line with the highest VAT.
   "Good" or "Bad" column for each product line.
8) Branches exceeding average product sales.
9) Most common product line by gender.
10) Average rating for each product line.

### Sales

1) Customer type bringing the most revenue.
2) City with the highest tax percent/VAT.
3) Customer type paying the most in VAT.
4) Sales at each time of day per weekday.

### Customer:

1) Unique customer types.
2) Unique payment methods.
3) Most common customer types.
4) Customer type making the most purchases.
5) Gender distribution of customers.
6) Gender distribution per branch.
7) Time of day for the most ratings.
8) Time of day for the most ratings per branch.
9) Best average ratings day of the week.
10)Best average ratings per branch each day.

# Conclusion: 
This analysis provides vital insights into Walmart's sales dynamics, guiding strategic decisions for product enhancement, sales strategy optimization, and improved customer engagement.
