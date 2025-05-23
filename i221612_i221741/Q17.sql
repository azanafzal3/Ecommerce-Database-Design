

--18) Retrieve customers who have made purchases in every product category, along with the total number of categories they have purchased from.

WITH TotalCategories AS (
    SELECT COUNT(DISTINCT ProductID) AS CategoryCount
    FROM Products
),

CustomerCategoryCount AS (
    SELECT o.CustomerID, COUNT(DISTINCT p.ProductID) AS PurchasedCategories
    FROM Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    GROUP BY o.CustomerID
)
SELECT c.CustomerID, c.Name, ccc.PurchasedCategories
FROM Customers c
JOIN CustomerCategoryCount ccc ON c.CustomerID = ccc.CustomerID
JOIN TotalCategories tc ON ccc.PurchasedCategories = tc.CategoryCount;