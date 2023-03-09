#Answering below questions to demonstrate SQL skills 
#Skills used: Aggregate Functions, Group By, Order By, Having, Case.

#1. Find out total number of sales per country from highest to lowest.
    SELECT country, COUNT(product) as Total_sales
    FROM sales
    GROUP BY country
    ORDER BY Total_sales desc;

#2. Find out Visa or Amex Customers who spent more than $2000.
    SELECT name, SUM(price) AS Total_spending
    FROM sales
    WHERE payment_type LIKE 'Visa' OR payment_type LIKE 'Amex' 
    GROUP BY name
    HAVING Total_spending > 2000
    ORDER BY Total_spending DESC;

#3. Find out names and city of all UK customers who bought chairs with Mastercard.
    SELECT name, city
    FROM sales
    WHERE product = 'Chair' AND country = 'United Kingdom' AND payment_type = 'Mastercard';

#4. Find out US and Canada Profitability by States.
    SELECT state,
    CASE
        WHEN SUM(price) > 8000 THEN 'High'
        WHEN SUM(price) > 3500 THEN  'Medium'
        ELSE 'Low'
    END AS Profitability
    FROM sales
    WHERE country IN ('United states', 'Canada')
    GROUP BY state
    ORDER BY SUM(price) DESC;
