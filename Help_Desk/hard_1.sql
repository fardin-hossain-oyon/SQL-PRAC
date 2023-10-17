SELECT  t2.manager
       ,t1.Hr
       ,t1.cc
FROM
(
	SELECT  DATE_FORMAT(Issue.Call_date,'%Y-%m-%d %H') AS Hr
	       ,COUNT(*)                                   AS cc
	FROM Issue
	GROUP BY  Hr
) t1, 
(
SELECT  Shift.Shift_date
       ,Shift.Shift_type
       ,Shift.Manager
       ,CONCAT(DATE_FORMAT(Shift.Shift_date, '%Y-%m-%d '), SUBSTRING(Shift_type.Start_time, 1, 2)) AS Start_time
       ,CONCAT(DATE_FORMAT(Shift.Shift_date, '%Y-%m-%d '), SUBSTRING(Shift_type.End_time, 1, 2)) AS End_time
FROM Shift
JOIN Shift_type
ON Shift.Shift_type = Shift_type.Shift_type ) t2


WHERE t1.Hr BETWEEN t2.Start_time AND t2.End_time
AND DATE_FORMAT(t1.Hr, '%Y-%m-%d ') = '2017-08-12'







SELECT  Shift.Shift_date
       ,Shift.Shift_type
       ,Shift.Manager
       ,CONCAT(DATE_FORMAT(Shift.Shift_date, '%Y-%m-%d '), SUBSTRING(Shift_type.Start_time, 1, 2))
       ,CONCAT(DATE_FORMAT(Shift.Shift_date, '%Y-%m-%d '), SUBSTRING(Shift_type.End_time, 1, 2))
FROM Shift
JOIN Shift_type
ON Shift.Shift_type = Shift_type.Shift_type




