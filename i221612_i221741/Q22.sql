

--Q23
SELECT 
    P.ProductID,
    P.Name AS ProductName,
    P.Category AS ProductCategory,
    COALESCE(SUM(OI.Quantity), 0) AS OrderQuantity,
    P.Price AS OrderPrice,
    COALESCE(SUM(OI.Quantity * OI.UnitPrice), 0) AS TotalRevenue
FROM 
    Products P
LEFT JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
LEFT JOIN 
    Orders O ON OI.OrderID = O.OrderID
WHERE 
    P.Category = 'Electronics'
GROUP BY 
    P.ProductID, P.Name, P.Category, P.Price
HAVING 
    COALESCE(SUM(OI.Quantity), 0) BETWEEN 5 AND 10
ORDER BY 
    TotalRevenue DESC;