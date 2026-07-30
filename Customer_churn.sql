SELECT * FROM dbo.telecom_churn
--OVERVIEW METRICS
SELECT COUNT(*) AS Total_Customers,
SUM(CASE WHEN Churn = 1 Then 1 ElSE 0 END) AS Churned_Customers, 
ROUND(CAST(SUM(CASE WHEN Churn = 1 Then 1 ElSE 0 END) AS FLOAT)*100/COUNT(*),2) AS Churn_Rate_Pct,
ROUND(SUM(MonthlyCharge),2) AS Total_monthly_revenue,
ROUND(SUM(CASE WHEN Churn = 1 THEN MonthlyCharge ELSE 0 END),2) AS Lost_monthly_revenue,
ROUND(AVG(MonthlyCharge),2) AS Avg_monthly_revenue
FROM dbo.telecom_churn

--Customer Service Calls On Churn Rate 
SELECT CustServCalls, 
COUNT(*) AS Total_Customers, 
SUM(CASE WHEN Churn = 1 Then 1 ElSE 0 END) AS Churned_Customers, 
ROUND(CAST(SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) AS FLOAT)*100/COUNT(*),2) AS Churn_Rate_Pct
FROM dbo.telecom_churn
GROUP BY CustServCalls
ORDER BY CustServCalls DESC


--Contract Renewal and Dataplan on Churn Rate 
SELECT ContractRenewal, DataPlan,
COUNT(*) AS Total_Customers,
SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) AS Churned_Customers, 
ROUND(CAST(SUM(CASE WHEN Churn=1 THEN 1 ELSE 0 END) AS FLOAT)*100/COUNT(*),2) AS Churn_Rate_Pct,
ROUND(AVG(MonthlyCharge),2) AS AVG_Monthly_Revenue
FROM dbo.telecom_churn 
GROUP BY ContractRenewal, DataPlan
ORDER BY ContractRenewal DESC, DataPlan DESC

