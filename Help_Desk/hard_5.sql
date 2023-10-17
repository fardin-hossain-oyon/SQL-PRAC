SELECT Taken_by, Call_date
        , TIMESTAMPDIFF(MINUTE, LAG(Call_date,1) OVER (PARTITION BY Taken_by ORDER BY Call_date), Call_date) AS minute_diff
FROM Issue