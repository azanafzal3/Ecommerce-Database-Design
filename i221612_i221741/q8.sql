
--9) Find products with quantities below the average quantity in stock

DECLARE @AverageQuantity FLOAT;
SELECT @AverageQuantity = AVG(QuantityInStock) FROM Inventory;
SELECT p.ProductID, p.Name, i.QuantityInStock
FROM Products p
JOIN Inventory i ON p.ProductID = i.ProductID
WHERE i.QuantityInStock < @AverageQuantity;