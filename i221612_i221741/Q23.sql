
--Q24
SELECT 
    p.Category, 
    SUM(oi.Quantity) AS total_products_sold
FROM 
    Products p
JOIN 
    OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY 
    p.Category
HAVING 
    SUM(oi.Quantity) > 10
ORDER BY 
    total_products_sold DESC;
