# Loan Default Risk Analysis

## Project Overview

This project is an end to end loan default analysis project. The main goal of the project is to understand which customer, loan, and credit related factors are connected with loan default.

The project starts with raw loan application data, then moves through Python cleaning, exploratory data analysis, SQL analysis in PostgreSQL, and finally an interactive Power BI dashboard.

The target column in this project is Status.

0 means the loan was not defaulted.

1 means the loan was defaulted.

## Data Source

The dataset used in this project is the Loan Default Dataset from Kaggle.

Dataset source: Kaggle Loan Default Dataset by Yasser H

Source link: https://www.kaggle.com/datasets/yasserh/loan-default-dataset

The dataset contains loan application records with borrower details, loan details, credit information, property information, and loan default status.

## Tools Used

Python was used for data loading, data cleaning, and exploratory analysis.

Pandas was used to work with the dataset in tabular form.

PostgreSQL was used to store the cleaned dataset.

Power BI was used to create the final dashboard.

## Project Workflow

The project followed this workflow.

1. Loaded the raw CSV file in Python.

2. Checked the size of the data, column names, data types, missing values, and duplicate records.

3. Cleaned the column names to make them easier to use.

4. Renamed the Status column to default_flag.

5. Created a new readable column called default_status.

6. Imported the cleaned data into PostgreSQL.

7. Wrote SQL queries to analyze default rate across different categories.

8. Built Power BI measures and charts using the cleaned table.

9. Created an interactive dashboard for business level understanding.

## Python Work

In Python, the dataset was loaded using pandas. I checked the basic structure of the dataset, missing values, duplicate rows, and important columns.

The original Status column was renamed to default_flag because it gives a clearer meaning.

A new column called default_status was created so that 0 and 1 could be shown as readable labels.

0 was converted to Not Defaulted.

1 was converted to Defaulted.

This made the dataset easier to understand in SQL and Power BI.

## SQL Work

In SQL, I worked with the cleaned table named loan_default_cleaned.

The SQL analysis included total applications, defaulted applications, overall default rate, and category wise default rates.

I analyzed default rate by gender, loan type, region, credit type, and loan purpose.

I also compared average loan amount, average income, average credit score, average LTV, and average DTI between defaulted and not defaulted loans.

Segmentation was also done for loan amount, income, and credit score. This helped divide customers into simple groups such as low, medium, and high.

Finally, I created risk levels for loan types using default rate.

## Power BI Dashboard

The Power BI dashboard was created using the cleaned PostgreSQL table.

The dashboard includes KPI cards for total applications, defaulted applications, default rate, average loan amount, and average credit score.

The dashboard also includes charts for default status, gender, loan type, region, credit type, and loan purpose.

Slicers were added so the user can filter the dashboard by gender, loan type, region, credit type, and loan purpose.

## Key Insights

The dataset contains both defaulted and not defaulted loan applications.

The overall default rate shows that a noticeable portion of loan applications resulted in default.

Default rate changes across different loan types, which means some loan categories may carry higher risk.

Region wise analysis shows that default behavior is not the same across all regions.

Credit type is an important factor because different credit categories show different default rates.

Loan amount, income, credit score, LTV, and DTI help explain the financial profile of borrowers.

Segmenting loan amount, income, and credit score makes it easier to identify possible high risk groups.

The Power BI dashboard makes these insights easier to explore visually.

## Business Use

This project can help a bank or financial institution understand loan default patterns.

It can support risk teams in identifying customer groups that may need closer review.

It can also help business users track default rate across different borrower and loan categories.

The dashboard gives a simple and interactive way to monitor loan default risk.

## Final Summary

This project helped me understand how a real data analysis project moves from raw data to business insights.

Python was used to prepare and clean the data.

SQL was used to answer business questions and calculate important metrics.

Power BI was used to create the final dashboard.

The project shows how data analysis can be used to understand loan default risk and support better decision making.
