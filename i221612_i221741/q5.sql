
--6) Find customers who have made more than one purchase on the same day
SELECT 
    C.CustomerID,
    C.Name,
    COUNT(O.OrderID) AS PurchaseCount,
    CAST(P.CreationTimestamp AS DATE) AS PurchaseDate
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
JOIN 
    Payment P ON O.OrderID = P.OrderID
GROUP BY 
    C.CustomerID,
    C.Name,
    CAST(P.CreationTimestamp AS DATE)
HAVING 
    COUNT(O.OrderID) > 1
ORDER BY 
    PurchaseDate DESC, PurchaseCount DESC;
