-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.

-- The final table is the most elegant solution and presents a 
-- front that is desirable for customer consumption.
SELECT
  *
FROM
  Dishes
ORDER BY
  Price;

SELECT
  *
FROM
  Dishes
WHERE
  Type
IN
  ('Appetizer',
  'Beverage')
ORDER BY
  Type;

SELECT
  Type,
  Name,
  Price,
  Description
From
  Dishes
WHERE
  Type != 'Beverage'
ORDER BY
  Type;