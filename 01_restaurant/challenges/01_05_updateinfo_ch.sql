-- Update a customer's contact information.

-- Taylor Jenkins, of 27170 6th Ave., Washington, DC,
-- has moved to 74 Pine St., New York, NY.

-- It probably would've been easier to just use the customerID once I
-- identified it, but this way allows me to use just the information
-- front of me, without hunting down any further information.

SELECT
  *
FROM
  Customers
WHERE
  Address = '27170 6th Ave.';

UPDATE 
  Customers
SET
  Address = '74 Pine St.',
  City = 'New York',
  State = 'NY'
WHERE
  Address = '27170 6th Ave.' AND City = 'Washington' AND State = 'DC';

SELECT
  *
FROM
  Customers
WHERE
  FirstName = 'Taylor' AND LastName = 'Jenkins';