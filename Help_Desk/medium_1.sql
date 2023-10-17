SELECT Customer.Company_name, COUNT(*) AS CC
FROM Caller
JOIN Customer ON Caller.Company_ref = Customer.Company_ref
JOIN Issue ON Caller.Caller_id = Issue.Caller_id
GROUP BY Customer.Company_name
HAVING COUNT(*) > 18