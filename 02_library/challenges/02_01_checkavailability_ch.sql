-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT
  COUNT(Books.Title)
FROM
  Books
WHERE
  Title = 'Dracula';

SELECT
  COUNT(Books.Title)
FROM
  Books
JOIN Loans ON Books.BookID = Loans.BookID
WHERE
  Title = 'Dracula' AND ReturnedDate IS NULL;

SELECT
  (SELECT
    COUNT(Books.Title)
  FROM
    Books
  WHERE
    Title = 'Dracula') -
  (SELECT
    COUNT(Books.Title)
  FROM
    Books
  JOIN Loans ON Books.BookID = Loans.BookID
  WHERE
    Title = 'Dracula' AND ReturnedDate IS NULL)
  AS AvailableCopies;
