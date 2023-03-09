#Answer below questions using data from the table

#1. Display the database ordered by price
    SELECT * FROM JKF
    ORDER BY item_price ASC;

#2. What is the total price of all item in women section
    SELECT sum(item_price) AS Total_Price FROM JKF 
    WHERE item_section LIKE "Women";

#3. Find out all the unavailable items from baby section
    SELECT * FROM JKF
    WHERE item_availability = "No" AND item_section = "Baby";

#4. What are the 3 most expensive item currently available in the store
    SELECT item, item_price, item_section FROM JKF
    WHERE item_availability = 'Yes' 
    ORDER BY item_price desc
    LIMIT 3
