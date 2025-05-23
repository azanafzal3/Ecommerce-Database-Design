
--13) Find customers who have placed an order in the last 30 days.
SELECT DISTINCT c.CustomerID, c.Name, c.Email, c.PhoneNumber
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IN (
    SELECT OrderID
    FROM Payment
    WHERE CreationTimestamp >= DATEADD(DAY, -30, GETDATE())
);

