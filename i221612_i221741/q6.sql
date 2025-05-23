
-- 7) Calculate the total revenue for each product category
SELECT 
    P.Category,
    SUM(OI.Quantity * OI.UnitPrice) AS TotalRevenue
FROM 
    OrderItems OI
JOIN 
    Products P ON OI.ProductID = P.ProductID
GROUP BY 
    P.Category;
