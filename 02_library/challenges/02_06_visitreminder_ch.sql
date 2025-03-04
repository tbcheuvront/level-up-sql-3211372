-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT 
  COUNT(Loans.LoanID) AS BookCount,
  Patrons.FirstName,
  Patrons.LastName,
  Patrons.Email
FROM Loans
JOIN Patrons ON Patrons.PatronID = Loans.PatronID
GROUP BY Loans.PatronID
ORDER BY BookCount ASC
LIMIT 15

-- Nice, I ended up doing this basically EXACTLY how the instructor did
-- But I also included LastName.