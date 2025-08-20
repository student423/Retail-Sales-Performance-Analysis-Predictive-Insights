# Online Retail Customer Analytics & Segmentation

# Project Overview
This project is a comprehensive, end-to-end data analysis portfolio piece that demonstrates a full data science workflow, 
from raw data processing to predictive modeling and business insights. The core objective is to analyze a transactional dataset from an online retailer and perform RFM (Recency, 
Frequency, Monetary) analysis to segment the customer base. This project addresses the critical business problem of identifying and 
understanding different customer groups to optimize marketing strategies and improve customer retention.

# End-to-End Workflow
This project showcases a versatile skill set by leveraging multiple tools for different stages of the data pipeline.

# SQL: Data Cleaning & Initial Business Insights

Utilized SQL to meticulously clean and transform a raw, semi-structured dataset of over 500,000 records. 
Addressed common data quality issues such as missing values, data type inconsistencies, and duplicate line items through strategic aggregation.

Extracted foundational business insights by identifying key performance indicators (KPIs), 
including total revenue, customer count, top-selling products, and revenue by country.

# Excel: Business-Level Reporting & KPIs

Connected Excel directly to the cleaned SQL database to demonstrate proficiency in creating rapid, business-focused reports.

Developed dynamic PivotTables and charts to visualize key metrics like monthly sales trends and top-performing customers, providing quick, actionable insights.

# Python: Advanced Analytics & Predictive Modeling

Used Python to perform in-depth analysis beyond the capabilities of traditional business intelligence tools.

Conducted product-level analysis to uncover top-selling items and product co-purchase patterns.

Engineered RFM features (Recency, Frequency, Monetary) as the basis for a robust customer segmentation model.

Applied the K-Means clustering algorithm to segment the customer base, a key machine learning technique for unsupervised learning. 
The analysis identified distinct, behavior-based customer groups.

# Power BI: Interactive Dashboarding & Storytelling

Integrated data from both the SQL database and the Python model to create a comprehensive and interactive dashboard.

Designed visualizations to represent key metrics, geographical sales, and the RFM customer segments.

Utilized DAX to create custom measures for dynamic and granular data exploration. The final dashboard serves as a powerful business intelligence tool for stakeholders.

# Key Insights & Business Outcomes
The project delivers significant business value by providing a clear understanding of the customer base.

Customer Segmentation: The K-Means model successfully classified customers into three distinct, actionable segments based on their RFM scores:

# Cluster 1 (Champions): 
Identified as the most valuable segment with the lowest Recency (12.9 days) and the highest Frequency (25.4 orders) and
Monetary value (£19,967). This group represents the top-tier of customers.

# Cluster 0 (Loyal & Engaged): 
A highly active group with low Recency (24.9 days), moderate Frequency (2.9 orders), and a solid average Monetary value (£896).

# Cluster 2 (At-Risk): 
Classified as customers who have not made a recent purchase (Recency of 98.3 days) but have a purchasing history, making them prime candidates for re-engagement campaigns.

# Product Insights: 
Identified best-selling products crucial for inventory management and promotional strategies.

# Actionable Recommendations: 
The insights generated from this project can be used to inform targeted marketing campaigns, 
loyalty programs, and re-engagement efforts, directly impacting customer lifetime value and revenue.

# Dashboard Snapshots
Here are the visual representations of the dashboards created for this project.

# Excel Dashboard
(Insert image of your Excel dashboard here. Make sure to update the URL.)

# Power BI Dashboard
(Insert image of your Power BI dashboard here. Make sure to update the URL.)

# Technical Skills & Tools
Databases: MySQL (Data Cleaning & Aggregation)

Data Analysis & BI: Microsoft Excel (KPIs & Initial Reporting), Power BI (Interactive Dashboarding)

Programming: Python (Pandas for data manipulation, Scikit-learn for machine learning)

Development Environment: Google Colab

# Repository Structure
sql/: Contains the SQL scripts used for data cleaning and initial analysis.

notebooks/: Contains the Python notebook used for RFM analysis and K-Means clustering.

dashboards/: Contains the Power BI file (.pbix) and dashboard images.

data/: Includes the original dataset.

# Contact
Feel free to connect with me if you have any questions or feedback about this project.






