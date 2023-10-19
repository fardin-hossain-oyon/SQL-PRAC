WITH saved_table AS (SELECT  Taken_by AS Taken_by
        ,DATE_FORMAT(Call_date, '%Y-%m-%d %H:%i:%s') AS Call_date
        ,TIMESTAMPDIFF(MINUTE, LAG(Call_date,1) OVER (PARTITION BY Taken_by ORDER BY Call_date), Call_date) AS lag_col
        ,TIMESTAMPDIFF(MINUTE, Call_date, LEAD(Call_date,1) OVER (PARTITION BY Taken_by ORDER BY Call_date)) AS lead_col
        ,ROW_NUMBER() OVER (PARTITION BY Taken_by ORDER BY Call_date) AS row_num
FROM Issue
), saved_table_2 AS
(
SELECT
    saved_table.Taken_by
    ,saved_table.Call_date
    ,saved_table.lag_col
    ,saved_table.lead_col
    ,saved_table.row_num
    ,(row_num - LAG(row_num,1) OVER (PARTITION BY Taken_by ORDER BY Call_date) ) AS cons_call_count
    ,LAG(Call_date,1) OVER (PARTITION BY Taken_by ORDER BY Call_date) AS lag_date
FROM saved_table
WHERE saved_table.lag_col IS NULL
OR saved_table.lag_col > 10
OR saved_table.lead_col IS NULL
OR saved_table.lead_col > 10
ORDER BY saved_table.Taken_by, saved_table.Call_date
)
SELECT 
    t1.Taken_by
    , t1.lag_date AS first_call
    , t1.Call_date AS last_call
    , t1.cons_call_count + 1 AS Consecutive_calls
    
FROM saved_table_2 t1
WHERE t1.cons_call_count = (
    SELECT MAX(cons_call_count)
    FROM saved_table_2
)