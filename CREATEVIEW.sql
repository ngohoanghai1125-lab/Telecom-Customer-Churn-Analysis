CREATE VIEW telecom_churn_analytics AS 
SELECT *, 
ROUND(MonthlyCharge+OverageFee,2) AS Total_Montly_Bills,
CASE WHEN AccountWeeks < 26 THEN 'New (<6 months)'
WHEN AccountWeeks BETWEEN 26 AND 52 THEN 'Mid_Term (6-12 Months)'
ELSE 'Loyal (> 1 Year)' END AS Tenure_Segment, 
CASE WHEN CustServCalls >= 4 OR ContractRenewal = 0 THEN 'High Risk'
WHEN CustServCalls BETWEEN 2 AND 3 OR ContractRenewal = 0 THEN 'Medium Risk'
ELSE 'Low Risk'
END AS Churn_Risk_Level
From dbo.telecom_churn