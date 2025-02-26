-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

SELECT
  CustomerID
FROM
  Customers
WHERE
  LastName = 'Norby' OR FirstName = 'Norby';

SELECT
  ReservationID
FROM
  Reservations
WHERE
  CustomerID = 64 AND Date LIKE '2022-07%';

DELETE FROM
  Reservations
WHERE
  ReservationID = '2000';