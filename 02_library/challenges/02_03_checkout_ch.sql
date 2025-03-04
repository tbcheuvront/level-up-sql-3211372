-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

-- Step 1: Acquire book IDs
SELECT
  BookID,
  Title
FROM
  Books
WHERE
  Barcode = 2855934983 OR Barcode = 4043822646;

-- We know Dorian Gray is ID 11 & Great Expectations is ID 93.
-- Step 2: Obtain Patron ID

SELECT
  PatronID,
  FirstName,
  LastName
FROM
  Patrons
WHERE
  Email = 'jvaan@wisdompets.com';

-- This tells us that the PatronID is 50. 
-- Create the checkout

INSERT INTO Loans
  (BookID, PatronID, LoanDate, DueDate)
VALUES
  (11, 50, '2022-08-25', '2022-09-08'),
  (93, 50, '2022-08-25', '2022-09-08');

-- Confirm the table has been updated appropriately.
SELECT
  *
FROM
  Loans
ORDER BY LoanID DESC;