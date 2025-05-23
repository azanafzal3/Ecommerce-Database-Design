


--14) List customers who have made a purchase in every product category
SELECT c.CustomerID, c.Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(DISTINCT p.ProductID) = (SELECT COUNT(DISTINCT ProductID) FROM Products);