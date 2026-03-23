USE customer_behavior;

SELECT *
FROM shopping_behavior;

---- 1) Total Revenue ----
SELECT SUM(`Purchase Amount (USD)`) AS Total_revenue
FROM shopping_behavior;

---- 2) Average Purchase Amount -----
SELECT AVG('Purchase Amount (USD)') AS Avg_purchase
FROM shopping_behavior;

---- 3) Total Customers ---- 
SELECT COUNT(DISTINCT `Customer ID`) AS Total_customers
FROM shopping_behavior;


---- 4) Revenue by Category ----- 
SELECT `Category`,
       ROUND(SUM(`Purchase Amount (USD)`), 2) AS revenue
FROM shopping_behavior
GROUP BY `Category`
ORDER BY revenue DESC;


---- 5) Revenue by Gender ---- 
SELECT `Gender`,
       ROUND(SUM(`Purchase Amount (USD)`), 2) AS revenue
FROM shopping_behavior
GROUP BY `Gender`;


---- 6)Revenue by Age Group---- 
SELECT 
  CASE 
    WHEN `Age` < 25 THEN 'Young'
    WHEN `Age` BETWEEN 25 AND 45 THEN 'Adult'
    WHEN `Age` BETWEEN 46 AND 60 THEN 'Middle Age'
    ELSE 'Senior'
  END AS age_group,
  ROUND(SUM(`Purchase Amount (USD)`), 2) AS revenue
FROM shopping_behavior
GROUP BY age_group
ORDER BY revenue DESC;

---- 7) Sales by Season ---
SELECT `Season`,
       ROUND(SUM(`Purchase Amount (USD)`), 2) AS total_sales
FROM shopping_behavior
GROUP BY `Season`
ORDER BY total_sales DESC;

--- 8) Subscription Analysis ---- 
SELECT `Subscription Status`,
       COUNT(*) AS customer_count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM shopping_behavior), 2) AS percentage
FROM shopping_behavior
GROUP BY `Subscription Status`;

--- 9) Top 5 Customers by Spending ---- 
SELECT `Customer ID`,
       ROUND(SUM(`Purchase Amount (USD)`), 2) AS total_spent
FROM shopping_behavior
GROUP BY `Customer ID`
ORDER BY Total_spent DESC
LIMIT 5;

---- 10) Purchase Frequency Analysis---- 
SELECT 
  CASE 
    WHEN `Previous Purchases` < 10 THEN 'Low'
    WHEN `Previous Purchases` BETWEEN 10 AND 30 THEN 'Medium'
    ELSE 'High'
  END AS Purchase_frequency,
  COUNT(*) AS customers
FROM shopping_behavior
GROUP BY purchase_frequency;




