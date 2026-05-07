
SELECT COUNT(*)
FROM churn_project.customers
WHERE TotalCharges = '';
ALTER TABLE churn_project.customers
MODIFY COLUMN TotalCharges DECIMAL(10,2);
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn_project.customers;
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn_project.customers
GROUP BY Contract
ORDER BY churn_rate DESC;
SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn_project.customers
GROUP BY Contract
ORDER BY churn_rate DESC;
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM churn_project.customers
GROUP BY Churn;
SELECT 
    Churn,
    ROUND(AVG(tenure),1) AS avg_tenure
FROM churn_project.customers
GROUP BY Churn;
SELECT 
    PaymentMethod,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM churn_project.customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;
