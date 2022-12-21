#Performed analytics on the imported data using SQL. 

#1. Show Customers (their full names, customer ID, and country) who are not in the US.
    SELECT Firstname, LastName, CustomerId, Country
    FROM chinook.customers 
    WHERE Country <> 'USA';

#2. Show only the Customers from Brazil.
    SELECT * FROM chinook.customers
    WHERE country = 'Brazil';

#3. Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.
    SELECT c.firstname, c.lastname, i.invoiceid, i.invoicedate, i.billingcountry
    FROM chinook.customers c
    JOIN chinook.invoices i
    ON c.customerid = i.customerid
    WHERE c.country = 'Brazil';

#4. Show the Employees who are Sales Agents.
    SELECT * FROM chinook.employees
    WHERE title like 'Sales Support Agent';
    
#5. Find a unique/distinct list of billing countries from the Invoice table.
    SELECT DISTINCT BillingCountry 
    FROM chinook.invoices;

#6. Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.
    SELECT i.invoiceid, e.firstname, e.lastname
    FROM chinook.employees e
    JOIN chinook.customers c
    ON e.employeeid = c.supportrepid
    JOIN chinook.invoices i
    ON c.customerid = i.customerid
    WHERE e.title like 'Sales Support Agent';

#7. Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.
    SELECT c.firstname as C_FN, c.lastname as C_LN, c.country, e.firstname as Agent_FN, e.lastname as Agent_LN,  i.Total
    FROM chinook.invoices i
    JOIN chinook.customers c
    ON i.customerid = c.customerid
    JOIN chinook.employees e
    ON c.supportrepid = e.employeeid;

#8. How many Invoices were there in 2009?
    SELECT count(DISTINCT invoiceid) 
    FROM chinook.invoices
    WHERE InvoiceDate BETWEEN '2009-01-01' and '2009-12-31';

#9. What are the total sales for 2009?
    SELECT SUM(Total)
    FROM chinook.Invoices
    WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

#10. Write a query that includes the purchased track name with each invoice line ID.
     SELECT i.InvoiceLineID, t.Name as Track_Name
     FROM chinook.invoice_items i
     LEFT JOIN chinook.tracks t
     ON i.TrackId = t.TrackId;

#11. Write a query that includes the purchased track name AND artist name with each invoice line ID.
     SELECT t.name as Track_Name, a.name as Artist_Name, i.InvoiceLineId
     FROM chinook.invoice_items i
     JOIN chinook.tracks t
     ON i.trackid = t.trackid
     JOIN chinook.albums aa
     ON t.albumid = aa.albumid
     JOIN chinook.artists a
     ON aa.artistid = a.artistid;

#12. Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.
     SELECT t.Name as Track, a.title as Album, m.Name as MediaType, g.Name as Genre
     FROM chinook.tracks t
     LEFT JOIN chinook.albums a
     ON t.AlbumId = a.AlbumId
     LEFT JOIN chinook.media_types m
     ON t.MediaTypeId = m.MediaTypeId
     LEFT JOIN chinook.genres g
     ON t.GenreId = g.GenreId;

#13. Show the total sales made by each sales agent.
     SELECT e.FirstName, e.LastName, Round(sum(i.Total), 2) as TotalSales
     FROM chinook.invoices i
     JOIN chinook.customers c
     ON i. CustomerId = c.CustomerId
     JOIN chinook.employees e
     ON c.SupportRepId = e.EmployeeId
     WHERE e.Title = 'Sales Support Agent'
     GROUP BY e.employeeid;

#14. Which sales agent made the most dollars in sales in 2009?
     SELECT e.FirstName, e.LastName, Round(sum(i.Total), 2) as TotalSales
     FROM chinook.invoices i
     JOIN chinook.customers c
     ON i. CustomerId = c.CustomerId
     JOIN chinook.employees e
     ON c.SupportRepId = e.EmployeeId
     WHERE e.Title = 'Sales Support Agent'
     AND i.InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'
     GROUP BY e.employeeid
     ORDER BY TotalSales DESC
     LIMIT 1;

