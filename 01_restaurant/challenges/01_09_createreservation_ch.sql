-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

SELECT
  CustomerID
FROM
  Customers
WHERE
  LastName = 'McAdams' AND Email = 'smac@kinetecoinc.com';

-- This showed us that the customer is not in the database.

INSERT INTO Customers
  (FirstName, LastName, Email)
VALUES
  ('Sam', 'McAdams', 'smac@kinetecoinc.com');

-- Here we create a CustomerID for Sam McAdams in the system.

SELECT
  CustomerID
FROM
  Customers
WHERE LastName = 'McAdams';

-- Confirm that McAdams has been added and has a corresponding CustomerID

INSERT INTO Reservations
  (CustomerID, Date, PartySize)
VALUES(
  (SELECT CustomerID
  FROM Customers
  WHERE LastName = 'McAdams'),
  '2022-08-12 1800:00:00',
  5);

-- Add the reservation. Accidentally did this three times troubleshooting.

SELECT *
FROM Reservations
WHERE CustomerID = 102;

-- Confirm reservation is added.