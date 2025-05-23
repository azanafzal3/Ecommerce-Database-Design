
--5) Retrieve products with the highest average ratings
SELECT 
    p.ProductID,
    p.Name,
    AVG(r.Rating) AS AverageRating
FROM 
    Products p
JOIN 
    Reviews r ON p.ProductID = r.ProductID
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    AverageRating DESC;