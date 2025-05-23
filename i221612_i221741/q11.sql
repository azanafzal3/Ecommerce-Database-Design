--12) List customers who have purchased products from at least two different sellers.
SELECT 
    c.CustomerID, 
    c.Name AS CustomerName, 
    COUNT(DISTINCT p.SellerID) AS DistinctSellers
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderItems oi ON o.OrderID = oi.OrderID
JOIN 
    Products p ON oi.ProductID = p.ProductID
GROUP BY 
    c.CustomerID, c.Name
HAVING 
    COUNT(DISTINCT p.SellerID) >= 2;