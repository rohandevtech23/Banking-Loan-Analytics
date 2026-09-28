## Banking Loan Analytics

## Project Overview

This project is an end-to-end banking loan analytics case study built for portfolio and interview presentation. The goal is to analyze loan applications, approval behavior, default risk, borrower segments, profitability, and branch performance using SQL and Power BI.

The project uses a large real-world Lending Club loan dataset from Kaggle. A cleaned analytical sample was prepared from the raw accepted and rejected loan application files so the data could be handled efficiently in PostgreSQL and Power BI while still remaining realistic.

## Business Objective

The main objective is to help a banking business answer:

> Which customer segments are more likely to default, which branches have higher risk exposure, and how can the bank improve loan approval quality while protecting profitability?

## Business Questions

1. What is the overall loan approval rate?
2. What percentage of loans are good loans vs bad loans?
3. Which borrower segments have the highest default risk?
4. How do credit score, DTI, and income relate to loan performance?
5. Which loan purposes create higher default risk?
6. Which branches have the highest default rate and high-risk exposure?
7. How much funded amount is exposed to risky borrowers?
8. What is the estimated net gain or loss by loan type?
9. How does loan volume and funded amount change over time?

## Tools Used

- PostgreSQL
- pgAdmin
- SQL
- Power BI
- Power Query
- DAX
- CSV data preparation
- Business analytics
- Banking and financial risk analysis

## Dataset

Source dataset:

- Kaggle Lending Club accepted loan applications
- Kaggle Lending Club rejected loan applications

Raw files used:

```text
accepted_2007_to_2018Q4.csv
rejected_2007_to_2018Q4.csv
```

Because the original files are very large, cleaned working samples were created:

```text
accepted_loans_sample_200k.csv
rejected_loans_sample_100k.csv
```

The accepted loan sample was used for:

- Default analysis
- Good loan vs bad loan classification
- Risk segmentation
- Credit score analysis
- DTI analysis
- Income analysis
- Loan purpose analysis
- Branch performance
- Profitability analysis

The rejected application sample was used for:

- Approval rate analysis
- Rejection rate analysis
- State-wise accepted vs rejected comparison

## Data Preparation

The raw dataset was transformed into an analysis-ready structure. Additional business fields were created to support advanced analysis:

- `good_bad_loan`
- `risk_segment`
- `income_group`
- `dti_band`
- `credit_score_band`
- `branch_id`
- `branch_name`
- `region`

The main classification logic:

- Good Loan: Fully Paid or Current loans
- Bad Loan: Charged Off, Default, or Late loans
- Risk Segment: Derived using credit score, DTI, and loan performance

## Database Design

Two main PostgreSQL tables were created:

```text
accepted_loans
rejected_applications
```

The SQL workflow included:

- Table creation
- CSV import
- KPI validation
- Good loan vs bad loan analysis
- Risk segmentation analysis
- Credit score band analysis
- DTI band analysis
- Income group analysis
- Loan purpose analysis
- State-wise performance analysis
- Branch ranking
- Approval and rejection analysis
- Monthly trend analysis
- Profitability analysis

## SQL Views Created

Six final SQL views were created for dashboard reporting:

```text
vw_executive_summary
vw_risk_analysis
vw_branch_performance
vw_approval_analysis
vw_profitability_analysis
vw_monthly_loan_trend
```

These views were used to simplify the Power BI model and keep business logic centralized in SQL.

## Power BI Dashboard Pages

The Power BI dashboard contains six pages:

### 1. Executive Summary

This page gives a high-level overview of loan performance.

Key visuals:

- Total loans
- Total funded amount
- Total payment received
- Good loans
- Bad loans
- Good loan percentage
- Bad loan percentage
- Average interest rate
- Good loan vs bad loan donut chart
- Loan status breakdown
- Monthly funded amount trend

### 2. Risk Analysis

This page focuses on borrower risk and default indicators.

Key visuals:

- Bad loans
- Default rate
- Average FICO score
- Average DTI
- Loan count by risk segment
- Bad loans by credit score band
- Bad loans by DTI band
- Funded amount by risk segment

### 3. Branch Performance

This page compares branch-level loan quality and exposure.

Key visuals:

- Default rate by branch
- High-risk exposure by branch
- Funded amount by branch
- Branch ranking and performance comparison

### 4. Approval Analysis

This page uses accepted and rejected application data.

Key visuals:

- Applications by state map
- Approval rate by state
- Approved vs rejected applications by state

### 5. Profitability Analysis

This page estimates financial performance by loan type.

Key visuals:

- Estimated net gain/loss by loan type
- Funded amount vs payment received
- Net gain/loss waterfall
- Interest received by loan type

### 6. Monthly Trend

This page analyzes time-based loan performance.

Key visuals:

- Monthly loan count trend
- Monthly funded amount trend
- Monthly default rate trend
- Bad loans by month

## Key KPIs

- Total loans
- Total funded amount
- Total payment received
- Good loans
- Bad loans
- Good loan percentage
- Bad loan percentage
- Approval rate
- Rejection rate
- Default rate
- Average interest rate
- Average DTI
- Average FICO score
- High-risk exposure percentage
- Estimated net gain/loss
- Estimated return percentage

## SQL Skills Demonstrated

- Data definition using `CREATE TABLE`
- Data import from CSV
- Aggregations
- `CASE WHEN` logic
- CTEs
- Window functions
- Ranking using `RANK()`
- Date transformation
- Percentage calculations
- Business KPI creation
- SQL views for reporting

## Power BI Skills Demonstrated

- PostgreSQL connection
- Data model loading
- Power Query validation
- DAX measures
- KPI cards
- Donut charts
- Bar and column charts
- Line and area charts
- Treemap
- Map visual
- Waterfall chart
- Slicers and filters
- Dashboard page design
- Business storytelling

## Business Insights

The analysis helps identify:

- The split between good loans and bad loans
- Borrower groups with higher default concentration
- Branches with higher default rate and risk exposure
- States with stronger or weaker approval patterns
- Loan types that generate positive or negative estimated return
- Monthly changes in loan volume, funded amount, and default behavior

## Business Recommendations

1. Strengthen approval checks for high-risk borrowers with high DTI and lower credit score bands.
2. Review branches with high default rates and high-risk exposure.
3. Monitor loan purposes that show above-average default concentration.
4. Use branch-level risk ranking to support audit and policy review.
5. Track monthly default rate movement to identify early risk changes.
6. Compare funded amount with payment received to balance growth and profitability.

## Project Folder Structure

```text
Banking-Loan-Analytics/
|-- dataset/
|   |-- raw/
|   |-- processed/
|   |-- sample/
|-- sql/
|   |-- 01_create_tables.sql
|   |-- 02_kpi_queries.sql
|   |-- 03_approval_analysis.sql
|   |-- 04_default_risk_analysis.sql
|   |-- 05_branch_performance.sql
|   |-- 06_powerbi_measures_dax.txt
|   |-- 07_final_views.sql
|-- powerbi/
|   |-- Banking_Loan_Analytics_Dashboard.pbix
|-- screenshots/
|-- insights/
|-- README.md
```

## Interview Summary

I built an end-to-end banking loan analytics project using SQL and Power BI. I used a large Lending Club loan dataset, prepared cleaned analytical samples, created PostgreSQL tables, wrote SQL queries for KPIs and risk analysis, and built final SQL views for reporting. In Power BI, I created a six-page dashboard covering executive KPIs, risk segmentation, branch performance, approval analysis, profitability, and monthly trends. The project demonstrates business analytics, SQL, Power BI dashboarding, and financial domain understanding.

