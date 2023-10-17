SELECT t2.Company_name, t1.First_name, t1.Last_name, t2.nc

FROM Caller t1, (

SELECT Customer.Company_name, Customer.Contact_id, COUNT(*) AS nc
FROM Caller
JOIN Customer ON Caller.Company_ref = Customer.Company_ref
JOIN Issue ON Caller.Caller_id = Issue.Caller_id
GROUP BY Customer.Company_name, Customer.Contact_id
HAVING COUNT(*) < 5

) t2

WHERE t1.Caller_id = t2.Contact_id