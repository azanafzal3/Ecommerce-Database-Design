
--8) List customers who have not reviewed any products:
SELECT c.CustomerID, c.Name, c.Email
FROM Customers c
LEFT JOIN Reviews r ON c.CustomerID = r.CustomerID
WHERE r.ReviewID IS NULL;