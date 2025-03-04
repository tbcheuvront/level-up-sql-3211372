-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

-- METHOD 1: This identifies the books all at once.
SELECT
  Books.Title,
  Books.Barcode,
  Loans.ReturnedDate
FROM
  Books
JOIN Loans ON Books.BookID = Loans.BookID
WHERE
  Loans.ReturnedDate IS NULL AND
  (Books.Barcode = 6435968624
  OR Books.Barcode = 5677520613
  OR Books.Barcode = 8730298424);

-- METHOD 2: This does not work
SELECT
  Books.Title,
  Books.Barcode,
  Loans.ReturnedDate
FROM
  Books
JOIN Loans ON Books.BookID = Loans.BookID
WHERE
  ReturnedDate IS NULL AND
  ((SELECT Barcode FROM Books WHERE Barcode = 6435968624)
  OR (SELECT Barcode FROM Books WHERE Barcode = 5677520613)
  OR (SELECT Barcode FROM Books WHERE Barcode = 8730298424));

-- Doesn't work with Method 1 to pull. Seems we can't use Join on an
-- Update function. Method 2 was a dud in and of itself. Looks like 
-- this will have to be accomplished one record at a time.
UPDATE Loans
SET
  ReturnedDate = '2022-07-05'
WHERE
  BookID = (SELECT BookID FROM Books WHERE Barcode = '6435968624')
  AND ReturnedDate IS NULL;

UPDATE Loans
SET
  ReturnedDate = '2022-07-05'
WHERE
  BookID = (SELECT BookID FROM Books WHERE Barcode = '5677520613')
  AND ReturnedDate IS NULL;

UPDATE Loans
SET
  ReturnedDate = '2022-07-05'
WHERE
  BookID = (SELECT BookID FROM Books WHERE Barcode = '8730298424')
  AND ReturnedDate IS NULL;

-- Re-ran Method 1 to confirm successful update.