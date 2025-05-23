
--17) Retrieve the latest 5 orders along with customer details and order items for each order.

SELECT TOP 5 
    O.OrderID,
    C.CustomerID,
    C.Name AS CustomerName,
    C.Email AS CustomerEmail,
    OI.ProductID,
    OI.Quantity,
    OI.UnitPrice
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
ORDER BY O.OrderID DESC;
