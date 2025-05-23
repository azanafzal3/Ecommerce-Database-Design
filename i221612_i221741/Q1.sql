
CREATE TABLE Sellers (
    SellerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    SellerID INT,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Description VARCHAR(500),
	Category VARCHAR(50),
    FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID)
);

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(11)
	CONSTRAINT CHK_PhoneNumber CHECK (PhoneNumber NOT LIKE '%[^0-9]%')
);
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShoppingCart (
    CartID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE CartItems (
    CartItemID INT IDENTITY(1,1) PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CartID) REFERENCES ShoppingCart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Payment (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    CreationTimestamp DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


CREATE TABLE Reviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    CreationTimestamp DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Address (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    AddressLine1 VARCHAR(255),
    AddressLine2 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10),
    Country VARCHAR(100),
    IsBillingAddress Bit,   
    IsShippingAddress bit, 
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    ReorderThreshold INT,
    UnitCost DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Sellers (Name, Email) VALUES 
('Ayaan Malik', 'ayaan.malik@sellers.com'),
('Sara Khan', 'sara.khan@sellers.com'),
('Zain Malik', 'zain.malik@sellers.com'),
('Fatima Ahmed', 'fatima.ahmed@sellers.com'),
('Omar Farooq', 'omar.farooq@sellers.com'),
('Aisha Siddiqui', 'aisha.siddiqui@sellers.com'),
('Hassan Raza', 'hassan.raza@sellers.com'),
('Noor Khalid', 'noor.khalid@sellers.com'),
('Yasir Abbas', 'yasir.abbas@sellers.com'),
('Zara Ahmed', 'zara.ahmed@sellers.com'),
('Bilal Sheikh', 'bilal.sheikh@sellers.com'),
('Mariam Hanif', 'mariam.hanif@sellers.com'),
('Ibrahim Ali', 'ibrahim.ali@sellers.com'),
('Sana Iqbal', 'sana.iqbal@sellers.com'),
('Aliya Mustafa', 'aliya.mustafa@sellers.com'),
('Rayan Mir', 'rayan.mir@sellers.com'),
('Zoya Tariq', 'zoya.tariq@sellers.com'),
('Hamza Qureshi', 'hamza.qureshi@sellers.com'),
('Rida Khan', 'rida.khan@sellers.com'),
('Ahmed Nadeem', 'ahmed.nadeem@sellers.com');
INSERT INTO Products (SellerID, Name, Price, Description, Category)
VALUES 
(1, 'Wireless Earbuds', 49.99, 'High-quality wireless earbuds with noise cancellation.', 'Electronics'),
(2, 'Smartwatch', 199.99, 'Water-resistant smartwatch with heart rate monitor and GPS.', 'Wearables'),
(3, 'Laptop Backpack', 39.99, 'Durable laptop backpack with multiple compartments and water resistance.', 'Accessories'),
(4, 'Bluetooth Speaker', 29.99, 'Portable Bluetooth speaker with deep bass and 12 hours of battery life.', 'Electronics'),
(5, 'Gaming Mouse', 59.99, 'High-precision gaming mouse with customizable RGB lighting.', 'Gaming'),
(6, 'Smartphone Stand', 9.99, 'Adjustable smartphone stand, compatible with all devices.', 'Accessories'),
(7, 'Fitness Tracker', 79.99, 'Fitness tracker with heart rate monitor and step counter.', 'Wearables'),
(8, 'Wireless Charger', 19.99, 'Fast wireless charger, compatible with all Qi-enabled devices.', 'Accessories'),
(9, 'Noise-Cancelling Headphones', 149.99, 'Over-ear noise-cancelling headphones with 30-hour battery life.', 'Electronics'),
(10, '4K Action Camera', 249.99, 'Waterproof 4K action camera with image stabilization and voice control.', 'Cameras'),
(11, 'Tablet Stylus', 12.99, 'Precision stylus pen, compatible with all major tablets.', 'Accessories'),
(12, 'Electric Kettle', 25.99, '1.7L electric kettle with auto shut-off and boil-dry protection.', 'Home Appliances'),
(13, 'USB-C Hub', 34.99, 'Multi-port USB-C hub with HDMI, USB-A, and Ethernet ports.', 'Electronics'),
(14, 'Wireless Keyboard', 59.99, 'Mechanical wireless keyboard with customizable keys and backlighting.', 'Computers'),
(15, 'Portable Hard Drive', 89.99, '1TB portable external hard drive with USB 3.0 support.', 'Computers'),
(16, 'Smart Light Bulb', 14.99, 'Wi-Fi enabled smart light bulb, compatible with Alexa and Google Home.', 'Home Automation'),
(17, 'Laptop Cooling Pad', 19.99, 'Adjustable laptop cooling pad with quiet fans and USB power.', 'Computers'),
(18, 'Electric Toothbrush', 49.99, 'Rechargeable electric toothbrush with multiple brushing modes.', 'Personal Care'),
(19, 'Drone with Camera', 399.99, 'High-performance drone with 1080p camera and GPS tracking.', 'Drones'),
(20, 'Gaming Chair', 199.99, 'Ergonomic gaming chair with adjustable height and lumbar support.', 'Gaming');




INSERT INTO Customers (Name, Email, PhoneNumber) VALUES 
('Ayaan Malik', 'ayaan.malik@customers.com', '03001234567'),
('Sara Khan', 'sara.khan@customers.com', '03011234567'),
('Zain Malik', 'zain.malik@customers.com', '03021234567'),
('Fatima Ahmed', 'fatima.ahmed@customers.com', '03031234567'),
('Omar Farooq', 'omar.farooq@customers.com', '03041234567'),
('Aisha Siddiqui', 'aisha.siddiqui@customers.com', '03051234567'),
('Hassan Raza', 'hassan.raza@customers.com', '03061234567'),
('Noor Khalid', 'noor.khalid@customers.com', '03071234567'),
('Yasir Abbas', 'yasir.abbas@customers.com', '03081234567'),
('Zara Ahmed', 'zara.ahmed@customers.com', '03091234567'),
('Bilal Sheikh', 'bilal.sheikh@customers.com', '03101234567'),
('Mariam Hanif', 'mariam.hanif@customers.com', '03111234567'),
('Ibrahim Ali', 'ibrahim.ali@customers.com', '03121234567'),
('Sana Iqbal', 'sana.iqbal@customers.com', '03131234567'),
('Aliya Mustafa', 'aliya.mustafa@customers.com', '03141234567'),
('Rayan Mir', 'rayan.mir@customers.com', '03151234567'),
('Zoya Tariq', 'zoya.tariq@customers.com', '03161234567'),
('Hamza Qureshi', 'hamza.qureshi@customers.com', '03171234567'),
('Rida Khan', 'rida.khan@customers.com', '03181234567'),
('Ahmed Nadeem', 'ahmed.nadeem@customers.com', '03191234567');

INSERT INTO Orders (CustomerID) VALUES 
(1),
(1),
(2),
(2),
(3),
(3),
(4),
(5),
(6),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(14),
(15),
(16),
(17),
(18),
(19),
(19),
(20),
(20),
(20),
(20),
(20),
(20),
(20);


INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES 
(1, 1, 2, 49.99),
(2, 2, 1, 199.99),
(3, 3, 1, 39.99),
(4, 4, 3, 29.99),
(5, 5, 2, 59.99),
(6, 6, 1, 9.99),
(7, 7, 2, 79.99),
(8, 8, 1, 19.99),
(9, 9, 1, 149.99),
(10, 10, 1, 249.99),
(11, 11, 3, 12.99),
(12, 12, 1, 25.99),
(13, 13, 2, 34.99),
(14, 14, 1, 59.99),
(15, 15, 1, 89.99),
(16, 16, 4, 14.99),
(17, 17, 1, 19.99),
(18, 18, 2, 49.99),
(19, 19, 1, 399.99),
(20, 20, 1, 199.99),
(21, 5, 1, 59.99),
(22, 6, 1, 9.99),
(23, 20, 1, 199.99),
(24, 5, 1, 59.99),
(25, 6, 1, 9.99),
(26, 20, 1, 199.99),
(27, 5, 1, 59.99),
(28, 6, 1, 9.99),
(29, 20, 1, 199.99),
(30, 5, 1, 59.99),
(31, 6, 1, 9.99),
(32, 6, 1, 9.99);




INSERT INTO ShoppingCart (CustomerID)
VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);


INSERT INTO CartItems (CartID, ProductID, Quantity)
VALUES 
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 4, 3),
(3, 5, 2),
(4, 6, 1),
(5, 7, 2),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1),
(9, 11, 3),
(10, 12, 1),
(11, 13, 2),
(12, 14, 1),
(13, 15, 1),
(14, 16, 4),
(15, 17, 1),
(16, 18, 2),
(17, 19, 1),
(18, 20, 1);

INSERT INTO Payment (OrderID, PaymentMethod, Amount, CreationTimestamp)
VALUES 
(1, 'Credit Card', 49.99, GETDATE()),
(2, 'PayPal', 199.99, GETDATE()),
(3, 'Debit Card', 39.99, GETDATE()),
(4, 'Credit Card', 89.97, GETDATE()),
(5, 'PayPal', 119.98, GETDATE()),
(6, 'Credit Card', 9.99, GETDATE()),
(7, 'Debit Card', 159.98, GETDATE()),
(8, 'Credit Card', 19.99, GETDATE()),
(9, 'PayPal', 149.99, GETDATE()),
(10, 'Credit Card', 249.99, GETDATE()),
(11, 'PayPal', 38.97, GETDATE()),
(12, 'Debit Card', 25.99, GETDATE()),
(13, 'Credit Card', 69.98, GETDATE()),
(14, 'PayPal', 59.99, GETDATE()),
(15, 'Credit Card', 89.99, GETDATE()),
(16, 'Debit Card', 59.96, GETDATE()),
(17, 'PayPal', 19.99, GETDATE()),
(18, 'Credit Card', 99.98, GETDATE()),
(19, 'Debit Card', 399.99, GETDATE()),
(20, 'PayPal', 199.99, GETDATE());
INSERT INTO Reviews (ProductID, CustomerID, Rating, CreationTimestamp)
VALUES 
(1, 1, 5, GETDATE()),
(2, 1, 4, GETDATE()),
(3, 1, 3, GETDATE()),
(4, 1, 5, GETDATE()),
(5, 5, 2, GETDATE()),
(7, 7, 5, GETDATE()),
(8, 8, 3, GETDATE()),
(9, 9, 4, GETDATE()),
(14, 14, 5, GETDATE()),
(18, 18, 4, GETDATE()),
(12, 12, 3, GETDATE()),
(6, 6, 2, GETDATE()),
(10, 10, 4, GETDATE()),
(11, 11, 5, GETDATE()),
(16, 16, 4, GETDATE()),
(17, 17, 3, GETDATE()),
(19, 19, 5, GETDATE()),
(20, 20, 3, GETDATE()),
(13, 13, 2, GETDATE()),
(15, 15, 5, GETDATE());


INSERT INTO Address (CustomerID, AddressLine1, AddressLine2, City, State, ZipCode, Country, IsBillingAddress, IsShippingAddress)
VALUES 
(1, '123 Main St', '', 'Karachi', 'Sindh', '75000', 'Pakistan', 1, 1),
(2, '456 Elm St', 'Apt 2', 'Lahore', 'Punjab', '54000', 'Pakistan', 1, 0),
(3, '789 Oak St', '', 'Islamabad', 'Islamabad', '44000', 'Pakistan', 1, 1),
(4, '321 Maple St', '', 'Peshawar', 'Khyber Pakhtunkhwa', '25000', 'Pakistan', 0, 1),
(5, '654 Pine St', 'Suite 100', 'Quetta', 'Balochistan', '10000', 'Pakistan', 1, 1),
(6, '987 Cedar St', '', 'Multan', 'Punjab', '60000', 'Pakistan', 0, 1),
(7, '159 Birch St', '', 'Faisalabad', 'Punjab', '38000', 'Pakistan', 1, 0),
(8, '753 Walnut St', 'Floor 3', 'Rawalpindi', 'Punjab', '46000', 'Pakistan', 1, 1),
(9, '258 Ash St', '', 'Hyderabad', 'Sindh', '70000', 'Pakistan', 0, 0),
(10, '369 Spruce St', '', 'Sukkur', 'Sindh', '65200', 'Pakistan', 1, 1),
(11, '147 Chestnut St', 'Unit 5', 'Gujranwala', 'Punjab', '52200', 'Pakistan', 1, 0),
(12, '258 Fir St', '', 'Sialkot', 'Punjab', '39300', 'Pakistan', 0, 1),
(13, '369 Palm St', '', 'Sargodha', 'Punjab', '39350', 'Pakistan', 1, 1),
(14, '753 Willow St', '', 'Bahawalpur', 'Punjab', '63100', 'Pakistan', 0, 0),
(15, '159 Dogwood St', 'Apt 4', 'Mardan', 'Khyber Pakhtunkhwa', '23200', 'Pakistan', 1, 1),
(16, '753 Cottonwood St', '', 'Larkana', 'Sindh', '77000', 'Pakistan', 0, 1),
(17, '951 Redbud St', '', 'Rahim Yar Khan', 'Punjab', '64200', 'Pakistan', 1, 1),
(18, '369 Poplar St', '', 'Kasur', 'Punjab', '39360', 'Pakistan', 0, 0),
(19, '258 Sequoia St', '', 'Dera Ghazi Khan', 'Punjab', '32000', 'Pakistan', 1, 1),
(20, '147 Juniper St', '', 'Jhelum', 'Punjab', '49600', 'Pakistan', 1, 0);

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate, ReorderThreshold, UnitCost)
VALUES 
(1, 100, GETDATE(), 10, 25.00),
(2, 50, GETDATE(), 5, 150.00),
(3, 75, GETDATE(), 100, 20.00),
(4, 200, GETDATE(), 15, 30.00),
(5, 150, GETDATE(), 20, 45.00),
(6, 80, GETDATE(), 8, 10.00),
(7, 60, GETDATE(), 7, 75.00),
(8, 90, GETDATE(), 10, 15.00),
(9, 40, GETDATE(), 4, 100.00),
(10, 30, GETDATE(), 3, 200.00),
(11, 120, GETDATE(), 12, 12.00),
(12, 110, GETDATE(), 15, 25.00),
(13, 70, GETDATE(), 6, 60.00),
(14, 130, GETDATE(), 10, 22.00),
(15, 160, GETDATE(), 20, 55.00),
(16, 190, GETDATE(), 15, 18.00),
(17, 140, GETDATE(), 14, 27.00),
(18, 150, GETDATE(), 15, 35.00),
(19, 80, GETDATE(), 8, 150.00),
(20, 70, GETDATE(), 7, 45.00);


