
--Q4:
SELECT TOP 5 
    c.CustomerID,
    c.Name,
    SUM(p.Amount) AS TotalSpent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    Payment p ON o.OrderID = p.OrderID
GROUP BY 
    c.CustomerID, c.Name
ORDER BY 
    TotalSpent DESC;