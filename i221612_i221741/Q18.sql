
--19
SELECT 
    p.ProductID,
    p.Name,
    i.QuantityInStock,
    AVG(r.Rating) AS AvgRating
FROM 
    Products p
JOIN 
    Inventory i ON p.ProductID = i.ProductID
LEFT JOIN 
    Reviews r ON p.ProductID = r.ProductID
WHERE 
    i.QuantityInStock > 0
    AND r.ProductID IS NULL
GROUP BY 
    p.ProductID, p.Name, i.QuantityInStock;