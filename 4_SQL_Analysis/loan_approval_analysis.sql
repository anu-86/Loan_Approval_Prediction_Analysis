CREATE DATABASE loan_approval_analysis;
USE loan_approval_analysis;
SELECT DATABASE();
CREATE TABLE loan_data (
    Loan_ID VARCHAR(20),
    Gender VARCHAR(10),
    Married VARCHAR(10),
    Dependents INT,
    Education VARCHAR(20),
    Self_Employed VARCHAR(20),
    ApplicantIncome INT,
    CoapplicantIncome DECIMAL(10,2),
    LoanAmount DECIMAL(10,2),
    Loan_Amount_Term INT,
    Credit_History INT,
    Property_Area VARCHAR(20),
    Loan_Status CHAR(1)
);
DESCRIBE loan_data;
DROP TABLE loan_data;
SHOW TABLES;
ALTER TABLE loan_data
DROP COLUMN Income_Group,
DROP COLUMN Coapplicant_Income_Group,
DROP COLUMN LoanAmount_Group;
DESCRIBE loan_data;
ALTER TABLE loan_data
CHANGE COLUMN `ï»¿Loan_ID` `Loan_ID` TEXT;
SELECT Loan_ID
FROM loan_data
ORDER BY Loan_ID;
DESCRIBE loan_data;

ALTER TABLE loan_data
MODIFY COLUMN Dependents TEXT
INSERT INTO loan_data
(Loan_ID, Gender, Married, Dependents, Education, Self_Employed,
 ApplicantIncome, CoapplicantIncome, LoanAmount, Credit_History,
 Property_Area, Loan_Status, Loan_Amount_Term)
VALUES
('LP001014', 'Male', 'Yes', '3+', 'Graduate', 'No',
 3036, 2504, 158, 0, 'Semiurban', 'N', 360);

CREATE TABLE loan_data_temp LIKE loan_data;
SELECT COUNT(*) AS total_records,
       COUNT(DISTINCT Loan_ID) AS unique_loans
FROM loan_data_temp;
DROP TABLE loan_data;
RENAME TABLE loan_data_temp TO loan_data;
SELECT COUNT(*) AS total_records,
       COUNT(DISTINCT Loan_ID) AS unique_loans
FROM loan_data;
-- STEP 1: Overall Loan Approval Count
SELECT Loan_Status, COUNT(*) AS Loan_Count
FROM loan_data
GROUP BY Loan_Status;
-- STEP 2: Overall Loan Approval Rate
SELECT
    Loan_Status,
    COUNT(*) AS Loan_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data), 2) AS Percentage
FROM loan_data
GROUP BY Loan_Status
-- STEP 3: Loan Approval Rate by Credit History
SELECT
    Credit_History,
    Loan_Status,
    COUNT(*) AS Loan_Count
FROM loan_data
GROUP BY Credit_History, Loan_Status
ORDER BY Credit_History, Loan_Status;
-- STEP 4: Loan Approval Rate by Credit History
SELECT
    Credit_History,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Credit_History
ORDER BY Credit_History;
-- STEP 5: Loan Approval Rate by Education
SELECT
    Education,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Education
ORDER BY Education;
-- STEP 6: Loan Approval Rate by Gender
SELECT
    Gender,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Gender
ORDER BY Gender;
-- STEP 7: Loan Approval Rate by Marital Status
SELECT
    Married,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Married
ORDER BY Married;
-- STEP 8: Loan Approval Rate by Dependents
SELECT
    Dependents,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Dependents
ORDER BY Dependents;
-- STEP 9: Loan Approval Rate by Self Employment
SELECT
    Self_Employed,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Self_Employed
ORDER BY Self_Employed;
-- STEP 10: Loan Approval Rate by Property Area
SELECT
    Property_Area,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Property_Area
ORDER BY Property_Area;
-- STEP 11: Loan Approval Rate by Applicant Income Category
SELECT
    CASE
        WHEN ApplicantIncome < 3000 THEN 'Low Income'
        WHEN ApplicantIncome < 6000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Category,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Income_Category
ORDER BY
    CASE Income_Category
        WHEN 'Low Income' THEN 1
        WHEN 'Medium Income' THEN 2
        WHEN 'High Income' THEN 3
    END;
    -- STEP 12: Loan Approval Rate by Loan Amount Category
SELECT
    CASE
        WHEN LoanAmount < 100 THEN 'Low Loan'
        WHEN LoanAmount < 200 THEN 'Medium Loan'
        ELSE 'High Loan'
    END AS Loan_Amount_Category,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Loan_Amount_Category
ORDER BY
    CASE Loan_Amount_Category
        WHEN 'Low Loan' THEN 1
        WHEN 'Medium Loan' THEN 2
        WHEN 'High Loan' THEN 3
    END;
    -- STEP 13: Loan Approval Rate by Loan Amount Term
    SELECT
    Loan_Amount_Term,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Loan_Amount_Term
ORDER BY Loan_Amount_Term;
-- STEP 14: Loan Approval Rate by Coapplicant Income Category

SELECT
    CASE
        WHEN CoapplicantIncome = 0 THEN 'No Coapplicant Income'
        WHEN CoapplicantIncome < 2000 THEN 'Low Income'
        WHEN CoapplicantIncome < 5000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Coapplicant_Income_Category,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Coapplicant_Income_Category
ORDER BY
    CASE Coapplicant_Income_Category
        WHEN 'No Coapplicant Income' THEN 1
        WHEN 'Low Income' THEN 2
        WHEN 'Medium Income' THEN 3
        WHEN 'High Income' THEN 4
    END;
    -- STEP 15: Average Applicant Income by Loan Status
    SELECT
    Loan_Status,
    COUNT(*) AS Total_Applications,
    ROUND(AVG(ApplicantIncome), 2) AS Average_Applicant_Income
FROM loan_data
GROUP BY Loan_Status
ORDER BY Loan_Status;
-- STEP 16: Average Coapplicant Income by Loan Status
SELECT
    Loan_Status,
    COUNT(*) AS Total_Applications,
    ROUND(AVG(CoapplicantIncome), 2) AS Average_Coapplicant_Income
FROM loan_data
GROUP BY Loan_Status
ORDER BY Loan_Status;
-- STEP 17: Average Loan Amount by Loan Status
SELECT
    Loan_Status,
    COUNT(*) AS Total_Applications,
    ROUND(AVG(LoanAmount), 2) AS Average_Loan_Amount
FROM loan_data
GROUP BY Loan_Status
ORDER BY Loan_Status;
-- STEP 18: Loan Approval by Credit History and Education
SELECT
    Credit_History,
    Education,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Credit_History, Education
ORDER BY Credit_History, Education;
-- STEP 19: Loan Approval by Credit History and Property Area
SELECT
    Credit_History,
    Property_Area,
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM loan_data
GROUP BY Credit_History, Property_Area
ORDER BY Credit_History, Property_Area;
-- STEP 20: Applicant Income vs Loan Amount
SELECT
    Loan_Status,
    ROUND(AVG(ApplicantIncome), 2) AS Average_Applicant_Income,
    ROUND(AVG(LoanAmount), 2) AS Average_Loan_Amount
FROM loan_data
GROUP BY Loan_Status
ORDER BY Loan_Status;
-- STEP 21: Top Applicant Income among Approved Loans
SELECT
    Loan_ID,
    ApplicantIncome,
    LoanAmount,
    Credit_History,
    Education,
    Property_Area
FROM loan_data
WHERE Loan_Status = 'Y'
ORDER BY ApplicantIncome DESC
LIMIT 10;
-- STEP 22: Overall Loan Approval Summary
SELECT
    COUNT(*) AS Total_Applications,
    SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) AS Approved_Loans,
    SUM(CASE WHEN Loan_Status = 'N' THEN 1 ELSE 0 END) AS Rejected_Loans,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Overall_Approval_Rate
FROM loan_data;









