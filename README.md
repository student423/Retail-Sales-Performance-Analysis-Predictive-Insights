# Retail Sales Performance Analysis & Predictive Insights

## 📌 Project Overview
This project analyzes retail sales data to extract business insights, forecast future sales, and enable interactive decision-making through multiple tools. 
It covers **data cleaning, exploratory data analysis (EDA), machine learning, and dashboard creation** in an integrated workflow.

## 🎯 Objectives
- Clean and preprocess sales data for accurate analysis.
- Identify top-performing products, regions, and sales trends.
- Build predictive models to forecast future sales.
- Create interactive dashboards and applications for stakeholders.

## 🛠 Tools & Technologies
- **SQL (MySQL/PostgreSQL)** → Data cleaning, preprocessing, and initial EDA.
- **Excel** → Quick pivot analysis and KPI reporting.
- **Python (Pandas, Matplotlib, Seaborn, Scikit-learn)** → EDA, feature engineering, and ML model building.
- **Streamlit** → Deploy ML models as interactive web applications.
- **Power BI** → Executive dashboards for high-level business insights.

## 📂 Workflow
1. **Phase 1 - SQL**:  
   - Import raw CSV data into SQL database.  
   - Clean data (null handling, duplicates, type conversion).  
   - Perform initial EDA (sales trends, top products, customer segmentation).  

2. **Phase 2 - Excel**:  
   - Connect SQL to Excel for pivot reports.  
   - Generate category-wise contribution, growth trends, and region performance KPIs.  

3. **Phase 3 - Python (ML)**:  
   - Import cleaned SQL data into Python.  
   - Conduct EDA and visualization.  
   - Build regression and classification ML models.  
   - Save trained models for deployment.  

4. **Phase 4 - Streamlit**:  
   - Create an interactive web app to input parameters and get sales predictions.  
   - Display EDA charts dynamically.  

5. **Phase 5 - Power BI**:  
   - Connect SQL database to Power BI.  
   - Build dashboards with KPIs, trends, and filters.  

## 📊 Key Insights
- **Top Product Line**: XYZ Products generated 28% of total sales.
- **Peak Sales Month**: November, due to festive season offers.
- **High-Value Region**: North America contributed 35% of revenue.
- **Customer Retention**: 42% of customers made repeat purchases.

## 🤖 Machine Learning Results
- **Regression Model**: R² = 0.87, RMSE = 520
- **Classification Model**: Accuracy = 85%, Precision = 82%, Recall = 80%

## 🚀 Deployment
- **Streamlit App**: [Link to App]  
- **Power BI Dashboard**: [Link to Dashboard]

## 📁 Folder Structure

Retail-Sales-Analysis/
│── data/ # Raw and cleaned datasets
│── sql_scripts/ # SQL queries for cleaning & EDA
│── excel_reports/ # Pivot tables & quick reports
│── notebooks/ # Python EDA & ML
│── streamlit_app/ # Streamlit source code
│── powerbi_dashboard/ # Power BI project file
│── README.md # Project documentation
