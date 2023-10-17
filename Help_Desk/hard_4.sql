

SELECT DISTINCT first_table.company_name_first_table, first_table.caller_count, second_table.registered_callers

FROM 
(
-- table to find how many callers from a company called in '2017-08-13'
SELECT t1.Company_name AS company_name_first_table , COUNT(*) AS caller_count
FROM
(
SELECT DISTINCT Caller.Caller_id, Customer.Company_name
FROM Caller
JOIN Customer ON (Customer.Company_ref = Caller.Company_ref)
JOIN Issue ON (Issue.Caller_id = Caller.Caller_id)
WHERE DATE_FORMAT(Issue.Call_date,'%Y-%m-%d') = '2017-08-13'
) t1
GROUP BY t1.Company_name
) first_table,

(
-- table to find how many registered callers are there for a company
SELECT Customer.Company_name AS company_name_second_table, COUNT(*) AS registered_callers
FROM Customer
JOIN Caller ON Caller.Company_ref = Customer.Company_ref
GROUP BY Customer.Company_name
) second_table

WHERE first_table.caller_count = second_table.registered_callers AND first_table.company_name_first_table = second_table.company_name_second_table
