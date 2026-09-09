# Loan Approval Prediction Analysis

### End-to-End Data Analytics Project using Excel, MySQL & Power BI

An end-to-end data analytics project focused on analyzing **loan applications, applicant characteristics, approval patterns, and key risk factors** using data cleaning, exploratory data analysis, SQL, Power BI, and DAX.

---

## 📊 Dashboard Preview

### Page 1 — Loan Overview
![Loan Overview](8_Screenshots/Page_1_Loan_Overview.png?raw=true)

### Page 2 — Applicant Analysis

![Applicant Analysis](8_Screenshots/Page_2_Applicant_Analysis.png)

### Page 3 — Loan Approval & Risk Analysis

![Loan Approval & Risk Analysis](8_Screenshots/Page_3_Loan_Approval_Risk_Analysis.png)

---

## 📌 Project Overview

Loan approval decisions depend on several applicant and loan-related factors such as:

* Credit History
* Applicant Income
* Coapplicant Income
* Loan Amount
* Education
* Marital Status
* Self Employment
* Property Area

This project analyzes these factors to identify **patterns in loan approvals and rejections** and presents the findings through an interactive Power BI dashboard.

---

## 🎯 Project Objective

The main objectives of this project are:

* Clean and prepare the loan application dataset.
* Perform Exploratory Data Analysis (EDA).
* Analyze loan approval patterns using SQL.
* Identify important factors associated with loan approval.
* Build an interactive Power BI dashboard.
* Create DAX measures for dynamic KPIs.
* Generate meaningful business insights from the analysis.

---

## 📂 Dataset

**Dataset:** Loan Prediction Problem Dataset

**Target Variable:** `Loan_Status`

* `Y` → Loan Approved
* `N` → Loan Rejected

### Important Columns

| Column            | Description                |
| ----------------- | -------------------------- |
| Loan_ID           | Unique loan application ID |
| Gender            | Applicant gender           |
| Married           | Marital status             |
| Dependents        | Number of dependents       |
| Education         | Graduate / Not Graduate    |
| Self_Employed     | Self-employed status       |
| ApplicantIncome   | Applicant income           |
| CoapplicantIncome | Coapplicant income         |
| LoanAmount        | Requested loan amount      |
| Credit_History    | Credit history status      |
| Property_Area     | Urban / Semiurban / Rural  |
| Loan_Status       | Loan approval status       |

---

## 🛠️ Tools & Technologies

| Tool         | Purpose                           |
| ------------ | --------------------------------- |
| Excel        | Data Cleaning & EDA               |
| MySQL        | SQL Analysis                      |
| Power BI     | Dashboard & Data Visualization    |
| DAX          | KPI Measures                      |
| Git & GitHub | Version Control & Project Hosting |

---

# 🔄 Project Workflow

```text
Raw Dataset
     ↓
Data Cleaning – Excel
     ↓
Exploratory Data Analysis – Excel
     ↓
SQL Analysis – MySQL
     ↓
Power BI Dashboard
     ↓
DAX Measures
     ↓
Business Insights
     ↓
GitHub Documentation
```

---

# 🧹 1. Data Cleaning

The raw dataset was cleaned using **Microsoft Excel**.

### Data Cleaning Tasks

* Identified missing values.
* Handled missing categorical values.
* Handled missing numerical values.
* Checked duplicate records.
* Verified data types.
* Checked inconsistent values.
* Identified potential outliers.

### Missing Values Identified

Missing values were found in:

* Gender
* Married
* Dependents
* Self_Employed
* LoanAmount
* Loan_Amount_Term
* Credit_History

After the cleaning process, the analyzed fields contained no blank values.

---

# 📈 2. Exploratory Data Analysis

EDA was performed using Excel PivotTables and charts.

### EDA Analysis Performed

* Overall Loan Approval Analysis
* Credit History Analysis
* Gender Analysis
* Education Analysis
* Married Status Analysis
* Dependents Analysis
* Self Employment Analysis
* Property Area Analysis
* Applicant Income Analysis
* Coapplicant Income Analysis
* Loan Amount Analysis
* Loan Amount Term Analysis

### Key EDA Findings

* Applicant Income ranged from approximately **150 to 81,000**.
* Average Applicant Income was approximately **5,403.46**.
* Loan Amount ranged from approximately **9 to 700**.
* Average Loan Amount was approximately **145.75**.
* Graduate applicants had a higher approval rate than Not Graduate applicants in the analysis.
* Potential outliers were identified in Applicant Income, Coapplicant Income, and Loan Amount using the IQR method.

Outliers were retained because they may represent genuine applicants with unusually high income or loan requirements.

---

# 🗄️ 3. SQL Analysis

The cleaned dataset was imported into **MySQL** for deeper analysis.

### SQL Concepts Used

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* GROUP BY
* HAVING
* Aggregate Functions
* CASE
* JOIN
* NULL Handling
* Conditional Analysis

### SQL Analysis Areas

* Total loan applications
* Approved vs rejected applications
* Approval rate
* Credit history and loan approval
* Property area analysis
* Education and loan approval
* Applicant income analysis
* Loan amount analysis
* Applicant profile analysis

SQL insights are documented in:

```text
4_SQL_Analysis/
├── Loan_Approval_Analysis.sql
└── sql_insights.md
```

---

# 📊 4. Power BI Dashboard

An interactive Power BI dashboard was created with **3 pages**.

---

## 📄 Page 1 — Loan Overview

### KPIs

* 📋 Total Applications
* ✅ Approved Loans
* ❌ Rejected Loans
* 📈 Approval Rate %

### Purpose

Provides a high-level overview of the overall loan application and approval performance.

---

## 📄 Page 2 — Applicant Analysis

### Slicers

* 👤 Gender
* 🎓 Education
* 💍 Married
* 💼 Self Employed

### KPIs

* 📋 Total Applicants
* 💰 Average Applicant Income
* 💵 Average Coapplicant Income
* 🏠 Average Loan Amount

### Visualizations

* Gender Distribution
* Education Distribution
* Married Status
* Dependents Distribution
* Self Employment Distribution
* Income Range Analysis

### Purpose

This page focuses on understanding the **profile and financial characteristics of loan applicants**.

---

## 📄 Page 3 — Loan Approval & Risk Analysis

### Slicers

* 💳 Credit History
* 🏠 Property Area
* 🎓 Education
* 💼 Self Employed

### KPIs

* 📋 Total Applications
* ✅ Approved Loans
* ❌ Rejected Loans
* 📈 Approval Rate %

### Visualizations

1. Credit History vs Loan Approval
2. Property Area Distribution
3. Applicant Income vs Loan Status
4. Average Loan Amount by Loan Status
5. Marital Status vs Loan Approval
6. Education + Credit History vs Loan Status

### Purpose

This page focuses on identifying **factors associated with loan approval and potential risk patterns**.

---

# 🧮 5. DAX Measures

Seven DAX measures were created for dynamic KPI calculations.

### Measures Created

```text
Total Applications
Approved Loans
Rejected Loans
Approval Rate %
Avg Applicant Income
Avg Coapplicant Income
Avg Loan Amount
```

### Example

```DAX
Total Applications =
DISTINCTCOUNT(LoanData[Loan_ID])
```

```DAX
Approved Loans =
CALCULATE(
    DISTINCTCOUNT(LoanData[Loan_ID]),
    LoanData[Loan_Status] = "Y"
)
```

```DAX
Rejected Loans =
CALCULATE(
    DISTINCTCOUNT(LoanData[Loan_ID]),
    LoanData[Loan_Status] = "N"
)
```

```DAX
Approval Rate % =
DIVIDE(
    [Approved Loans],
    [Total Applications],
    0
)
```

Complete DAX documentation is available in:

```text
6_DAXMeasures/
└── KPI_Measures.md
```

---

# 💡 6. Key Insights

### Credit History

Credit history is one of the strongest factors associated with loan approval. Applicants with a positive credit history generally show a much higher likelihood of approval.

### Education

Graduate applicants showed a higher approval rate compared with Not Graduate applicants in the analysis.

### Applicant Income

Applicant income varies considerably across the dataset. Higher income applicants may have greater financial capacity, although income alone does not determine approval.

### Loan Amount

Loan amounts vary significantly between applicants. Comparing average loan amounts across approval status helps identify differences in loan requirements.

### Property Area

Applicants are distributed across Urban, Semiurban, and Rural property areas, allowing approval patterns to be compared across locations.

### Marital Status

Loan approval patterns can also be compared across married and unmarried applicants.

### Combined Risk Factors

Combining **Education and Credit History** provides a more detailed view of approval patterns than analyzing either factor independently.

---

# 🏦 Business Insights

Based on the analysis:

* Credit history should be considered a key factor during loan evaluation.
* Applicant financial information can help assess repayment capacity.
* Combining multiple applicant attributes can improve risk assessment.
* Dashboard-based analysis can help decision-makers identify approval patterns quickly.
* Interactive slicers allow users to explore different applicant segments dynamically.

---

# 📁 Project Structure

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
└── README.md
```

---

# 📸 Dashboard Screenshots

## Page 1 — Loan Overview

![Loan Overview](8_Screenshots/Page_1_Loan_Overview.png)

## Page 2 — Applicant Analysis

![Applicant Analysis](8_Screenshots/Page_2_Applicant_Analysis.png)

## Page 3 — Loan Approval & Risk Analysis

![Loan Approval & Risk Analysis](8_Screenshots/Page_3_Loan_Approval_Risk_Analysis.png)

---

# 🎓 Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* Excel
* PivotTables
* Data Visualization
* SQL
* MySQL
* Power BI
* DAX
* KPI Development
* Business Analysis
* Data Storytelling
* Git
* GitHub

---

# ✅ Conclusion

This project demonstrates an end-to-end data analytics workflow, starting from **raw data cleaning and exploratory analysis** and progressing through **SQL analysis, Power BI visualization, DAX calculations, and business insights**.

The final Power BI dashboard provides an interactive view of applicant characteristics, loan approval patterns, and important risk-related factors.

This project demonstrates practical skills in **Excel, SQL, Power BI, DAX, data visualization, and business analytics**.

