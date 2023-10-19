WITH saved_table AS (
SELECT
    permit.reg AS vehicle_id
    ,permit.sDate AS start_date
    ,CASE 
        WHEN permit.chargeType = 'Weekly' THEN DATE_ADD(permit.sDate, INTERVAL 7 DAY) 
        ELSE permit.sDate
    END AS end_date
FROM permit
)
SELECT saved_table.vehicle_id, COUNT(*)
FROM saved_table
WHERE '2007-02-01' BETWEEN saved_table.start_date AND saved_table.end_date
GROUP BY saved_table.vehicle_id