#In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customers and orders data. 

#1. How many orders were placed in January?
    SELECT 
    count(orderID) 
    FROM BIT_DB.JanSales;

#2. How many of those orders were for an iPhone?
    SELECT 
    count(orderID) 
    FROM BIT_DB.JanSales
    WHERE Product = 'iPhone';

#3. Select the customer account numbers for all the orders that were placed in February.
    SELECT distinct c.acctnum
    FROM BIT_DB.customers c
    JOIN BIT_DB.FebSales f
    ON c.order_id = f.orderID;

#4. Which product was the cheapest one sold in January, and what was the price?
    SELECT DISTINCT Product, price
    FROM BIT_DB.JanSales
    WHERE price <= (SELECT min(price) FROM BIT_DB.JanSales);

#5. What is the total revenue for each product sold in January? (Revenue can be calculated using the number of products sold and the price of the products).
    SELECT Product, ROUND(SUM(Quantity)*price,2) as Product_Revenue
    FROM BIT_DB.JanSales
    GROUP BY Product;
    
#6. Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?
    SELECT Product, sum(Quantity), sum(Quantity)*price
    FROM BIT_DB.FebSales
    WHERE location = '548 Lincoln St, Seattle, WA 98101'
    GROUP BY Product;

#7. How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers?
    SELECT count(DISTINCT c.acctnum), AVG(Quantity*price)
    FROM BIT_DB.FebSales f
    LEFT JOIN BIT_DB.customers c
    ON f.OrderID = c.order_id
    WHERE f.Quantity > 2;
    
#8. List all the products sold in Los Angeles in February, and include how many of each were sold.
    SELECT Product, SUM(Quantity)
    FROM BIT_DB.FebSales
    WHERE location like '%Los Angeles%'
    GROUP BY Product;
    
#9. Which locations in New York received at least 3 orders in January, and how many orders did they each receive?
    SELECT distinct location, count(orderID) as Received_Orders
    FROM BIT_DB.JanSales
    WHERE location like '%NY%'
    GROUP BY location
    HAVING count(orderID) >= 3;

#10. How many of each type of headphone were sold in February?
     SELECT Product, sum(quantity) as Sold_Quantity
     FROM BIT_DB.FebSales
     WHERE Product like '%Headphone%'
     GROUP BY Product;

#11. What was the average amount spent per account in February?
     SELECT sum(quantity*price)/count(c.acctnum)
     FROM BIT_DB.FebSales f
     JOIN BIT_DB.customers c
     ON f.orderid = c.order_id;
     
#12. What was the average quantity of products purchased per account in February?
     SELECT AVG(quantity) 
     FROM BIT_DB.FebSales f
     JOIN BIT_DB.customers c
     ON f.orderid = c.order_id;

#13. Which product brought in the most revenue in January and how much revenue did it bring in total?
     SELECT Product, SUM(quantity*price) as Revenue
     FROM BIT_DB.JanSales
     GROUP BY Product
     ORDER BY Revenue DESC
     LIMIT 1;
  
