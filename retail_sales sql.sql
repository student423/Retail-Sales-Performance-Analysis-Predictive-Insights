-- create database
CREATE DATABASE db_retail;
USE db_retail;

-- create table 

CREATE TABLE raw_sales(
  InvoiceNo    VARCHAR(50),
  StockCode    VARCHAR(50),
  Description  TEXT,
  Quantity     INT,
  InvoiceDate  TEXT,
  UnitPrice    DECIMAL(10,2),
  CustomerID   INT,
  Country      VARCHAR(100)
);

-- understand raw data
SELECT COUNT(*) 
FROM raw_sales;

-- top 10
SELECT * FROM raw_sales
LIMIT 10;

-- distinct invoices, distinct customers
SELECT
   COUNT(DISTINCT(InvoiceNo)) AS invoice,
   COUNT(DISTINCT(CustomerID)) AS customer
FROM raw_sales;

-- missing values per column
SELECT
  SUM(CASE WHEN InvoiceNo IS NULL OR TRIM(InvoiceNo)='' THEN 1 ELSE 0 END) AS Invoice_Missing,
  SUM(CASE WHEN StockCode IS NULL OR TRIM(StockCode)='' THEN 1 ELSE 0 END) AS Stock_Missing,
  SUM(CASE WHEN Description IS NULL OR TRIM(Description)='' THEN 1 ELSE 0 END) AS Description_Missing,
  SUM(CASE WHEN Quantity IS NULL OR TRIM(Quantity)='' THEN 1 ELSE 0 END) AS Quantity_Missing,
  SUM(CASE WHEN InvoiceDate IS NULL OR TRIM(InvoiceDate)='' THEN 1 ELSE 0 END) AS InvoiceDate_Missing,
  SUM(CASE WHEN UnitPrice IS NULL OR TRIM(UnitPrice)='' THEN 1 ELSE 0 END) AS UnitPrice_Missing,
  SUM(CASE WHEN CustomerID IS NULL OR TRIM(CustomerID)='' THEN 1 ELSE 0 END) AS CustomerID_Missing,
  SUM(CASE WHEN Country IS NULL OR TRIM(Country)='' THEN 1 ELSE 0 END) AS Country_Missing
FROM raw_sales;

-- safe mode on when dlt or update any values

SET SQL_SAFE_UPDATES =0;

-- Remove header-like rows (if any)
DELETE FROM raw_sales
WHERE TRIM(InvoiceNo) = 'InvoiceNo' OR InvoiceNo IS NULL;

-- create a cleaned_sales table from raw_sales applying filters and adding TotalPrice

CREATE TABLE cleaned_sale AS
 SELECT 
	InvoiceNo,
    StockCode,
    TRIM(Description) AS Descr_iption,
    SUM(Quantity) AS Quantity,
    InvoiceDate,
    CAST(AVG(UnitPrice)AS DECIMAL(10,2)) AS UnitPrice,
    CustomerID,
    Country,
    CAST(SUM(Quantity * UnitPrice)AS DECIMAL(10,2)) AS TotalPrice
FROM raw_sales
WHERE Quantity IS NOT NULL
  AND UnitPrice IS NOT NULL
  AND Quantity <> 0  
GROUP BY
    InvoiceNo,
    StockCode,
    Descr_iption,
    InvoiceDate,
    CustomerID,
    Country;  
    
-- Convert InvoiceDate to DATETIME
ALTER TABLE cleaned_sale
ADD COLUMN Invoice_dt DATETIME;

UPDATE cleaned_sale
SET Invoice_dt = STR_TO_DATE(InvoiceDate, '%d-%m-%Y %H:%i');

-- drop invoice column
ALTER TABLE cleaned_sale
DROP COLUMN InvoiceDate;

-- business insight and overview

-- 1.total sales
SELECT
  ROUND(SUM(TotalPrice),2) AS total_sales
FROM cleaned_sale;

-- 2.total orders
SELECT 
  ROUND(COUNT(DISTINCT InvoiceNo),2) AS total_orders
FROM cleaned_sale;

-- 3. total quantity sold
SELECT 
  ROUND(SUM(Quantity),2) AS quantity_sold
FROM cleaned_sale;

-- Monthly Sales Trend
SELECT
  DATE_FORMAT(Invoice_dt, '%y-%m') AS month,
  ROUND(SUM(TotalPrice),2) AS monthly_revenue
FROM cleaned_sale
GROUP BY month
ORDER BY month;

--  Top 10 Selling Products by Revenue
SELECT 
  Descr_iption,
  ROUND(SUM(TotalPrice),2) AS revenue
FROM cleaned_sale
GROUP BY Descr_iption
ORDER BY revenue DESC
LIMIT 10;

-- Repeat vs One-time Customers
WITH customer_orders AS (
  SELECT
    CustomerID,
    COUNT(InvoiceNO) AS count_orders
  FROM cleaned_sale
  GROUP BY CustomerID
)
SELECT
  CASE
     WHEN count_orders = 1 THEN 'one_time'
     ELSE 'repeat'
  END AS customer_types,
  COUNT(*) AS customer_count
FROM customer_orders
GROUP BY customer_types;
  
-- Identifies return patterns and months with most returns.
SELECT
  MONTH(Invoice_dt) AS month,
  COUNT(*) AS count_return,
  ROUND(SUM(TotalPrice),2) AS return_value
FROM cleaned_sale
GROUP BY month
ORDER BY month;

-- Shows which days of the week bring most revenue.
SELECT
  DAYNAME(Invoice_dt) AS weekdays,
  ROUND(SUM(TotalPrice),2) AS revenue
FROM cleaned_sale
GROUP BY weekdays
ORDER BY FIELD(weekdays, 'Mon','Tue','Wed','Thru','Fri','Sat','Sun');

-- Identifies VIP customers for loyalty program
SELECT 
  CustomerID,
  ROUND(SUM(TotalPrice),2) AS total_spent
FROM cleaned_sale
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

-- Find the number of unique items per invoice
SELECT
  InvoiceNo,
  COUNT(DISTINCT StockCode) AS iteamperorders
FROM cleaned_sale
GROUP BY InvoiceNo
ORDER BY iteamperorders DESC
LIMIT 5;

-- Find the total revenue per hour of the day.
SELECT
  HOUR(Invoice_dt) AS sale_hour,
  ROUND(SUM(TotalPrice),2) AS revenue
FROM cleaned_sale
GROUP BY sale_hour
ORDER BY sale_hour;
-- thank you