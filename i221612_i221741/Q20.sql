
--21) Retrieve all customers who have placed orders, and include details of their orders, even for
--orders with no associated customers. Include information about the shipping addresses
--for each order.
SELECT 
    Customers.CustomerID, 
    Customers.Name AS CustomerName, 
    Orders.OrderID, 
    Products.Name AS ProductName, 
    OrderItems.Quantity, 
    OrderItems.UnitPrice, 
    Address.AddressLine1, 
    Address.City, 
    Address.State, 
    Address.ZipCode, 
    Address.Country
FROM 
    Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
LEFT JOIN Products ON OrderItems.ProductID = Products.ProductID
LEFT JOIN Address ON Customers.CustomerID = Address.CustomerID AND Address.IsShippingAddress = 1;