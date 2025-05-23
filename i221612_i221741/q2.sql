

--Q2

--1: 
-- This query retrieves a list of all products along with their corresponding seller information.
SELECT 
    p.ProductID, 
    p.Name AS ProductName, 
    p.Price, 
    s.Name AS SellerName, 
    s.Email AS SellerEmail 
FROM 
    Products p 
JOIN 
    Sellers s ON p.SellerID = s.SellerID;

-- Importance: This query helps in understanding which products are offered by which sellers, 
--             providing valuable insights into seller performance and product variety.

--2:
-- This query calculates the total amount spent by each customer across all their orders.
SELECT 
    c.CustomerID, 
    c.Name AS CustomerName, 
    SUM(p.Amount) AS TotalSpent 
FROM 
    Customers c 
JOIN 
    Orders o ON c.CustomerID = o.CustomerID 
JOIN 
    Payment p ON o.OrderID = p.OrderID 
GROUP BY 
    c.CustomerID, c.Name;

--Importance: Understanding customer spending behavior is crucial for marketing strategies, customer relationship management, 
--				and personalized promotions.

--3:
-- This query retrieves products that are below their reorder threshold in stock.
SELECT 
    p.ProductID, 
    p.Name AS ProductName, 
    i.QuantityInStock, 
    i.ReorderThreshold 
FROM 
    Products p 
JOIN 
    Inventory i ON p.ProductID = i.ProductID 
WHERE 
    i.QuantityInStock < i.ReorderThreshold;
--Importance: Keeping track of low stock products is essential for inventory management and ensuring that popular
--				items remain available for customers.

--4:-- This query retrieves all reviews for a specific product, including the customer's rating and feedback.

SELECT 
    r.ReviewID, 
    c.Name AS CustomerName, 
    r.Rating, 
    r.CreationTimestamp 
FROM 
    Reviews r 
JOIN 
    Customers c ON r.CustomerID = c.CustomerID 
WHERE 
    r.ProductID = ProductID;  

--Importance: Customer reviews are critical for assessing product quality, gaining customer insights, 
--and improving products based on feedback.