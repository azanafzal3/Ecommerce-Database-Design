
-- 16) Retrieve the top 5 products with the highest sales in the last month
SELECT TOP 5 
    p.ProductID,
    p.Name,
    SUM(oi.Quantity) AS TotalQuantitySold,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSales
FROM 
    Products p
JOIN 
    OrderItems oi ON p.ProductID = oi.ProductID
JOIN 
    Orders o ON oi.OrderID = o.OrderID
WHERE 
    o.OrderID IN (
        SELECT OrderID 
        FROM Payment 
        WHERE CreationTimestamp >= DATEADD(MONTH, -1, GETDATE())
    )
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    TotalSales DESC;