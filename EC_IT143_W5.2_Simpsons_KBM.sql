/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Simpsons_KBM.sql
DESCR:   Deliverable 5.2 - Simpsons Community Analysis (4 Questions & Answers)
AUTHOR:  King Brandan Mthimunye
DATE:    2026-10-05
******************************************************************************************************************/

-- Q1 (Self-Authored): What is the total spending (debit) recorded in the FBS Visa account per family member?
-- Author: King Brandan Mthimunye
-- A1: Sum all debit charges in FBS_Viza_Costmo grouped by member name.
SELECT Member_Name, SUM(Debit) AS total_debit
FROM dbo.FBS_Viza_Costmo
GROUP BY Member_Name;

-- Q2 (Self-Authored): Which active family members belong to each department?
-- Author: King Brandan Mthimunye
-- A2: Filter family members where Status = 'Active' and list their department details.
SELECT First_Name, Last_Name, Department, Job_Title
FROM dbo.Family_Data
WHERE Status = 'Active';

-- Q3 (Peer-Authored): What is the total spending by description/category across Visa transactions?
-- Author: Kudzanayi Murambwa
-- A3: Group transactions by Description and calculate total spending.
SELECT Description, SUM(Debit) AS category_total
FROM dbo.FBS_Viza_Costmo
GROUP BY Description;

-- Q4 (Peer-Authored): What are the credit card transaction details connected with family employment info?
-- Author: Daniel Oluwafemi Solomon
-- A4: Join Family_Data with FBS_Viza_Costmo on full member name.
SELECT f.Name, f.Job_Title, v.Date, v.Description, v.Debit, v.Credit
FROM dbo.Family_Data f
JOIN dbo.FBS_Viza_Costmo v ON f.Name = v.Member_Name;