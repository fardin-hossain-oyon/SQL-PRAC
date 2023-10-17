SELECT  
        mt1.Company_name
       ,mt1.mt1_calls AS abna
FROM
(
	SELECT  t1.Company_name
	       ,COUNT(t1.Call_ref) AS mt1_calls
	FROM
	(
		SELECT DISTINCT Customer.Company_name
		       ,Issue.Call_ref
		-- 	   TIMESTAMPDIFF(MINUTE, 
        -- STR_TO_DATE(Issue.Call_date, '%a, %d %b %Y %H:%i:%s GMT'), 
        -- STR_TO_DATE(CONCAT(DATE(Issue.Call_date), ' ', Shift_type.End_time), '%Y-%m-%d %H:%i')) AS minute_difference
		FROM Caller
		JOIN Customer
		ON Customer.Company_ref = Caller.Company_ref
		JOIN Issue
		ON Issue.Caller_id = Caller.Caller_id
		JOIN Shift_type
		ON NOT( 
			-- TIMESTAMPDIFF(MINUTE, Issue.Call_date, Shift_type.End_time) >= 5
			HOUR(Issue.Call_date) = HOUR(Shift_type.End_time) -1 AND MINUTE(Issue.Call_date) >= 55 
		)
	) t1
	GROUP BY  t1.Company_name
) mt1
LEFT JOIN
(
	SELECT  t1.Company_name
	       ,COUNT(t1.Call_ref) AS mt2_calls
	FROM
	(
		SELECT  DISTINCT Customer.Company_name
		       ,Issue.Call_ref
		FROM Caller
		JOIN Customer
		ON Customer.Company_ref = Caller.Company_ref
		JOIN Issue
		ON Issue.Caller_id = Caller.Caller_id
		JOIN Shift_type
		ON ( HOUR(Issue.Call_date) = HOUR(Shift_type.End_time) -1 AND MINUTE(Issue.Call_date) >= 55 )
	) t1
	GROUP BY  t1.Company_name
) mt2
ON mt1.Company_name = mt2.Company_name

WHERE mt2_calls IS NULL
ORDER BY mt1.mt1_calls DESC
LIMIT 1
