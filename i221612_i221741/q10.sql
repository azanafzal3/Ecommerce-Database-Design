--11) Retrieve the 3 most recent orders for a specific customer

SELECT TOP 3 
    o.OrderID,
    o.CustomerID,
    oi.ProductID,
    oi.Quantity,
    oi.UnitPrice,
    p.Name AS ProductName
FROM 
    Orders o
JOIN 
    OrderItems oi ON o.OrderID = oi.OrderID
JOIN 
    Products p ON oi.ProductID = p.ProductID
WHERE 
    o.CustomerID = 20
ORDER BY 
    o.OrderID DESC; 
