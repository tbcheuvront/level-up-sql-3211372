-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT
  Customers.FirstName AS 'First Name',
  Customers.LastName AS 'Last Name',
  Reservations.PartySize AS 'Party Size',
  Reservations.Date AS 'Date'
FROM
  Reservations
JOIN Customers ON Reservations.CustomerID = Customers.CustomerID
WHERE
  Customers.LastName LIKE 'St%' AND Reservations.Date LIKE '%-06-14%';