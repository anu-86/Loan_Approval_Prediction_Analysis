# Loan Approval Prediction Analysis

## Project Overview

This project focuses on analysing loan application data to identify the key factors associated with loan approval and rejection.

The project follows an end-to-end data analytics workflow, starting from raw data cleaning and exploratory data analysis (EDA), followed by SQL analysis and an interactive Power BI dashboard.

The analysis helps understand applicant characteristics, financial profiles, loan application patterns, approval outcomes, and risk-related factors.

---

## Project Objective

The main objectives of this project are:

* Clean and prepare the loan application dataset.
* Explore applicant and loan-related characteristics.
* Identify patterns in loan approval and rejection.
* Analyse the relationship between applicant attributes and loan approval.
* Perform SQL-based data analysis.
* Create dynamic KPIs using DAX.
* Build an interactive Power BI dashboard.
* Generate meaningful business insights from the analysis.

---

## Dataset

**Dataset:** Loan Prediction Problem Dataset

The dataset contains information about loan applicants and their loan application outcomes.

### Key Columns

* Loan_ID
* Gender
* Married
* Dependents
* Education
* Self_Employed
* ApplicantIncome
* CoapplicantIncome
* LoanAmount
* Credit_History
* Property_Area
* Loan_Status

### Target Variable

**Loan_Status**

* `Y` → Loan Approved
* `N` → Loan Rejected

---

## Tools & Technologies

| Tool     | Purpose                                 |
| -------- | --------------------------------------- |
| Excel    | Data Cleaning & EDA                     |
| MySQL    | SQL Analysis                            |
| Power BI | Data Visualization & Dashboard          |
| DAX      | Dynamic KPI Measures                    |
| GitHub   | Project Documentation & Version Control |

---

# Project Workflow

```text
Raw Dataset
     ↓
Data Cleaning
     ↓
Exploratory Data Analysis
     ↓
SQL Analysis
     ↓
Power BI Data Preparation
     ↓
DAX Measures
     ↓
Interactive Dashboard
     ↓
Business Insights
```

---

# 1. Data Cleaning

The raw dataset was cleaned using Excel before performing further analysis.

### Data Cleaning Tasks

* Identified missing values.
* Checked data types.
* Handled blank values.
* Verified categorical values.
* Checked numerical columns.
* Identified potential outliers.

Missing values were identified in columns such as Gender, Married, Dependents, Self_Employed, LoanAmount, Loan_Amount_Term, and Credit_History.

After cleaning, the analysed fields contained no blank values.

Detailed cleaning information is available in:

`2_Data_Cleaning/cleaning_notes`

---

# 2. Exploratory Data Analysis

EDA was performed to understand the structure and characteristics of the loan application data.

### Analysis Performed

* Overall Loan Approval Analysis
* Gender Analysis
* Education Analysis
* Marital Status Analysis
* Dependents Analysis
* Self-Employment Analysis
* Property Area Analysis
* Credit History Analysis
* Applicant Income Analysis
* Coapplicant Income Analysis
* Loan Amount Analysis
* Loan Amount Term Analysis

Potential outliers were identified in ApplicantIncome, CoapplicantIncome, and LoanAmount using the IQR method.

These potential outliers were retained because they may represent genuine applicant financial values.

EDA results and charts are available in:

`3_EDA/`

---

# 3. SQL Analysis

MySQL was used to analyse the cleaned loan application data.

The SQL analysis focused on:

* Total loan applications
* Approved and rejected applications
* Approval rates
* Credit history and loan approval
* Education and loan approval
* Property area analysis
* Applicant income analysis
* Loan amount analysis
* Applicant demographic analysis

SQL analysis files are available in:

`4_SQL_Analysis/`

---

# 4. Power BI Dashboard

An interactive Power BI dashboard was created to analyse loan applications and approval patterns.

The dashboard contains **3 pages**.

## Page 1 — Loan Overview

Provides a high-level overview of loan applications.

### KPIs

* Total Applications
* Approved Loans
* Rejected Loans
* Approval Rate %

### Focus

* Overall loan application performance
* Approval and rejection overview
* High-level loan application patterns

---

## Page 2 — Applicant Analysis

Focuses on understanding the characteristics of loan applicants.

### Slicers

* Gender
* Education
* Married
* Self Employed

### KPIs

* Total Applicants
* Average Applicant Income
* Average Coapplicant Income
* Average Loan Amount

### Charts

* Gender Distribution
* Education Distribution
* Marital Status Distribution
* Dependents Distribution
* Self-Employment Distribution
* Income Range Analysis

---

## Page 3 — Loan Approval & Risk Analysis

Focuses on loan approval patterns and risk-related factors.

### Slicers

* Credit History
* Property Area
* Education
* Self Employed

### KPIs

* Total Applications
* Approved Loans
* Rejected Loans
* Approval Rate %

### Charts

* Credit History vs Loan Approval
* Property Area Distribution
* Applicant Income vs Loan Status
* Average Loan Amount by Loan Status
* Marital Status vs Loan Approval
* Education + Credit History vs Loan Status

---

# 5. DAX Measures

Seven DAX measures were created for dynamic KPI analysis.

### Measures

1. Total Applications
2. Approved Loans
3. Rejected Loans
4. Approval Rate %
5. Avg Applicant Income
6. Avg Coapplicant Income
7. Avg Loan Amount

These measures dynamically respond to slicers and filters in the Power BI dashboard.

Detailed DAX formulas are available in:

`6_DAXMeasures/KPI_Measures.md`

---

# 6. Key Insights

### Credit History

Credit History was identified as one of the strongest factors associated with loan approval.

Applicants with a positive credit history had substantially more approved applications compared with applicants with a negative credit history.

### Education

Graduate applicants showed a higher approval rate than non-graduate applicants.

* Graduate approval rate: **70.83%**
* Not Graduate approval rate: **61.19%**

### Applicant Income

ApplicantIncome showed considerable variation.

* Minimum: **150**
* Maximum: **81,000**
* Average: **5,403.46**

Potential high-income outliers were identified using the IQR method and retained because they may represent genuine applicants.

### Loan Amount

LoanAmount also showed considerable variation.

* Minimum: **9**
* Maximum: **700**
* Average: **145.75**

### Applicant Characteristics

The analysis identified differences in loan applications based on:

* Gender
* Education
* Marital Status
* Dependents
* Self-Employment
* Property Area

These characteristics provide useful context for applicant segmentation and loan approval analysis.

Detailed insights are available in:

`7_Insights/PowerBI_Insights.md`

---

# 7. Dashboard Screenshots

## Page 1 — Loan Overview

![Loan Overview](8_Screenshots/Page_1_Loan_Overview.png)

## Page 2 — Applicant Analysis

![Applicant Analysis](8_Screenshots/Page_2_Applicant_Analysis.png)

## Page 3 — Loan Approval & Risk Analysis

![Loan Approval & Risk Analysis](8_Screenshots/Page_3_Loan_Approval_Risk_Analysis.png)

---

# 8. Project Structure

```text
Loan_Approval_Prediction_Analysis
│
├── 1_Data
│   ├── raw
│   └── cleaned
│
├── 2_Data_Cleaning
│   └── cleaning_notes
│
├── 3_EDA
│   ├── eda_analysis
│   └── charts
│
├── 4_SQL_Analysis
│   ├── Loan_Approval_Analysis.sql
│   └── sql_insights.md
│
├── 5_PowerBI
│   └── Loan_Approval_Analysis.pbix
│
├── 6_DAXMeasures
│   └── KPI_Measures.md
│
├── 7_Insights
│   └── PowerBI_Insights.md
│
├── 8_Screenshots
│   ├── Page_1_Loan_Overview.png
│   ├── Page_2_Applicant_Analysis.png
│   └── Page_3_Loan_Approval_Risk_Analysis.png
│
└── README.md```

---

# 9. Conclusion

The Loan Approval Prediction Analysis project demonstrates an end-to-end data analytics workflow using Excel, MySQL, and Power BI.

The project transforms raw loan application data into meaningful insights through data cleaning, exploratory analysis, SQL queries, DAX measures, and interactive dashboards.

The analysis highlights the importance of Credit History in loan approval outcomes and provides additional insights into applicant demographics, income, loan amounts, education, property area, and other applicant characteristics.

The final Power BI dashboard enables users to interactively explore loan approval patterns using slicers, KPIs, and visualizations.

---

## Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* SQL Analysis
* Data Visualization
* Power BI Dashboard Development
* DAX
* KPI Development
* Business Insights
* Data Storytelling
* Project Documentation
