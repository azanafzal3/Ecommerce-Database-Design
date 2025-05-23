

-- 15) Calculate the total number of products sold by each seller

SELECT 
    s.SellerID,
    s.Name AS SellerName,
    SUM(oi.Quantity) AS TotalProductsSold
FROM 
    Sellers s
JOIN 
    Products p ON s.SellerID = p.SellerID
JOIN 
    OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY 
    s.SellerID, s.Name
ORDER BY 
    TotalProductsSold DESC;
