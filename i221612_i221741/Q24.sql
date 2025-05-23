
--25) Retrieve customers with the total number of orders they have placed, ordered in
---descending order by the total number of orders, and show only customers who have placed
---more than 5 orders.
SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 5
ORDER BY TotalOrders DESC;
