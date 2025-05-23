
--22) Write a SQL query to retrieve the total number of products and the total revenue for each
--product category. Include products that may not have been sold. Additionally, order the
--product in descending order based on total revenue.

SELECT 
    P.Name AS ProductName,
    COUNT(P.ProductID) AS TotalProducts,
    COALESCE(SUM(OI.Quantity * OI.UnitPrice), 0) AS TotalRevenue
FROM 
    Products P
LEFT JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
GROUP BY 
    P.Name
ORDER BY 
    TotalRevenue DESC;
