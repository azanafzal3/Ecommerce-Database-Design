
--20) Find the top 3 products with the highest total sales, including details of the reviews for
--each product.
SELECT TOP 3 P.ProductID, 
              P.Name AS ProductName, 
              SUM(OI.Quantity * OI.UnitPrice) AS TotalSales,
              R.ReviewID, 
              R.Rating, 
              C.Name AS CustomerName, 
              R.CreationTimestamp AS ReviewDate
FROM Products P
JOIN OrderItems OI ON P.ProductID = OI.ProductID
JOIN Reviews R ON P.ProductID = R.ProductID
JOIN Customers C ON R.CustomerID = C.CustomerID
GROUP BY P.ProductID, P.Name, R.ReviewID, R.Rating, C.Name, R.CreationTimestamp
ORDER BY TotalSales DESC;