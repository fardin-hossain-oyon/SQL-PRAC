WITH percentage AS (

    SELECT  t2.Caller_id
	       ,(t2.calls_by_a_company / t1.total_calls)*100 AS pcnt
           ,ROW_NUMBER() OVER (ORDER BY pcnt DESC) AS rownum

	FROM
	(
		SELECT  COUNT(*) AS total_calls
		FROM Issue
	) t1, 
    (
	SELECT  Caller.Caller_id
	       ,COUNT(*) AS calls_by_a_company
	FROM Caller
	JOIN Customer
	ON Customer.Company_ref = Caller.Company_ref
	JOIN Issue
	ON Issue.Caller_id = Caller.Caller_Id
	GROUP BY  Caller.Caller_id ORDER BY calls_by_a_company DESC 
    ) t2

)
SELECT  SUM(percentage.pcnt) AS t20pc
FROM percentage
WHERE rownum < (SELECT ROUND(COUNT(*)*0.20) FROM Caller)