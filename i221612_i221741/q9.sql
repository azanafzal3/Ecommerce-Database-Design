
-- 10) Calculate the total number of orders for each customer and show only those with more than
--- 5 orders.

SELECT 
    c.CustomerID, 
    c.Name, 
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, c.Name
HAVING 
    COUNT(o.OrderID) > 5;
