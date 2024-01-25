-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
    
);

-- ------------------------------------------------------------------------------------------------
-- ------------------------ FEATURE ENGINEERING ---------------------------------------------------

--  Adding new column time_of_day 

SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS c
FROM sales;


alter table sales add column time_of_day varchar(20);

UPDATE sales 
SET time_of_day = (
CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
  );
  
  
  -- adding new column day_name
  
  select date,
         dayname(date) 
  from sales ;     
  
  alter table sales add column day_name varchar(10);
  update sales 
  set day_name = dayname(date);
  
  -- Month name 
  select date ,
	     monthname(date)
  from sales;
  
  alter table sales add column month_name varchar(10);
  UPDATE sales 
SET 
    month_name = MONTHNAME(date);
  -- ------------------------------------------------------------------------------------------------
  
  
  -- ------------------------------------------------------------------------------------------------
  -- -----------------------------Generic------------------------------------------------------------
  
  -- 1) How many unique cities does the data have?
SELECT
   DISTINCT(city) 
FROM sales ;

-- 2) In which city is each branch?
SELECT
   DISTINCT(city),
   branch
FROM sales ;

  -- ------------------------------------------------------------------------------------------------
  -- -----------------------------Product------------------------------------------------------------
-- 1) How many unique product lines does the data have?
SELECT 
    COUNT(DISTINCT(product_line))
FROM SALES;   

-- 2) What is the most common payment method?
SELECT 
    payment,
    COUNT(payment) count 
 FROM sales
 GROUP BY payment
 ORDER BY COUNT DESC;   

-- 3) What is the most selling product line?
SELECT 
     product_line,
     count(product_line)count
 from sales 
 group by product_line
 order by count desc;
 
-- 4) What is the total revenue by month?
SELECT 
     MONTH_NAME AS MONTH,
     SUM(TOTAL) AS Total_sales
FROM SALES
group by month
order by Total_sales desc;
     
-- 5) What month had the largest COGS?
SELECT 
     MONTH_NAME AS MONTH,
     sum(cogs) cogs 
FROM SALES
group by month
order by cogs;

-- 6) What product line had the largest revenue?
select  
     product_line,
     sum(total) total_sales
from sales 
group by product_line
order by total_sales desc;

-- 7) which is the city with the largest revenue?
select 
    branch,
    city,
    sum(total) total_sales
from sales 
group by branch,city 
order by total_sales desc;    

-- 8) What product line had the largest VAT?
SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- 9) Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
 select 
      product_line,
      (case
           when total > avg(total) then "good"
           when total < avg(total) then "bad"
         end) as Product_rating 
 from sales
 group by product_line;  
 

-- 10) What is the most common product line by gender?
select 
     gender,
     product_line,
     count(gender)
from sales
group by gender , product_line
order by count(gender) desc;  
   
-- 11) What is the average rating of each product line?
select 
     product_line,
     avg(rating)
 from sales 
 group by product_line;
 
 -- 12) Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
 SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;


-- ------------------------------------------------------------------------------------------------------------------
-- ------------------------------------Sales-------------------------------------------------------------------------
-- 1) Number of sales made in each time of the day per weekday
select 
      time_of_day,
      count(*) as total_sales
from sales 
where day_name = "Sunday"
group by time_of_day
order by total_sales desc;

-- 2) Which of the customer types brings the most revenue?
select 
     customer_type,
     sum(total) as total_sales 
from sales 
group by customer_type
order by total_sales desc;
     
-- 3) Which city has the largest tax percent/ VAT (Value Added Tax)?
select 
	city,
    avg(tax_pct) vat
from sales 
group by city 
order by vat desc;

-- 4) Which customer type pays the most in VAT?
select 
    customer_type,
    sum(tax_pct) vat
from sales 
group by customer_type
order by vat desc;    

-- -------------------------------------------------------------------------------------------------
-- -----------------------Customer------------------------------------------------------------------

-- 1) How many unique customer types does the data have?
select  
    count(distinct customer_type)
 from sales;   

-- 2) How many unique payment methods does the data have?
select  
    count(distinct payment)
 from sales;
 
-- 3) What is the most common customer type?
select  
	 customer_type,
     count(*) as sales 
from sales
group by customer_type
order by sales desc;     

-- 4) Which customer type buys the most?
SELECT
	customer_type,
    COUNT(*)
FROM sales
GROUP BY customer_type;

-- 5) What is the gender of most of the customers?
select 
     gender,
     count(*) sales 
from sales 
group by gender 
order by sales desc ;  
   
-- 6) What is the gender distribution per branch?
select 
     gender,
     count(*) sales 
from sales 
where branch = "c"
group by gender 
order by sales desc ;  

-- 7) Which time of the day do customers give most ratings?
select 
     time_of_day,
     count(rating) rating
from sales 
group by time_of_day 
order by rating desc;
    
-- 8) Which time of the day do customers give most ratings per branch?
select 
     time_of_day,
     count(rating) rating
from sales 
where branch = "a"
group by time_of_day 
order by rating desc;

-- 9) Which day fo the week has the best avg ratings?
select 
    day_name,
    avg(rating) rating
from sales 
group by day_name 
order by rating desc;
    
-- 10) Which day of the week has the best average ratings per branch?
select 
    day_name,
    avg(rating) rating
from sales 
where branch = 'b'
group by day_name 
order by rating desc



    


