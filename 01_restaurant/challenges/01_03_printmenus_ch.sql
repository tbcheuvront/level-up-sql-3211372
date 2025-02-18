-- Create reports that will be used to make three menus.

-- Create a report with all the items sorted by price (lowest to highest).
-- Create a report showing appetizers and beverages.
-- Create a report with all items except beverages.

-- This solution I've developed works, but the one in the solution
-- is more elegant. It avoids the IN clause and excludes columns
-- which are not to be displayed to customers.
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
  *
From
  Dishes
WHERE
  Type
IN
  ('Appetizer',
  'Dessert',
  'Main')
ORDER BY
  Type;