-- SELECT Caller.First_name, Caller.Last_name, COUNT(Issue.Caller_id)
-- FROM Caller
-- LEFT JOIN Issue ON Caller.Caller_id = Issue.Caller_id
-- WHERE Caller.First_name = 'Ethan'
-- GROUP BY Caller.First_name, Caller.Last_name


SELECT Caller.First_name, Caller.Last_name
FROM Caller
LEFT JOIN Issue ON Caller.Caller_id = Issue.Caller_id
WHERE Issue.Caller_id IS NULL