-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

SELECT
  FirstName,
  LastName,
  CustomerID
FROM Customers
WHERE LastName = 'Hundey' AND Address = '6939 Elka Place';

-- Confirm customer is in database, identify CustomerID as 70.

INSERT INTO Orders
  (CustomerID, OrderDate)
VALUES
  (70, '2022-09-20 14:00:00');

-- Insert order into Orders.

SELECT
  OrderID
FROM
  Orders
WHERE CustomerID = 70
ORDER BY OrderID Desc;

-- Identify OrderID as 1001.

INSERT INTO OrdersDishes
  (OrderID, DishID)
VALUES
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
  (1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

-- Add items ordered to the OrdersDishes table.

SELECT *
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;

-- Confirm items added and correctly affiliated with OrderID.

SELECT SUM(Dishes.Price)
FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;

-- Find the sum of the order cost.