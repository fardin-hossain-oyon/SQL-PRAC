WITH cte AS
(
SELECT image_table.reg
FROM image image_table
JOIN 
(
SELECT image_table.reg, DATE_FORMAT(image_table.whn, '%Y-%m-%d') AS spot_time
FROM
(
SELECT
    reg
    , sDate
    , CASE 
        WHEN chargeType = 'Weekly' THEN DATE_ADD(sDate, interval 7 day)  
        WHEN chargeType = 'Monthly' THEN DATE_ADD(sDate, interval 30 day)
        WHEN chargeType = 'Annually' THEN DATE_ADD(sDate, interval 365 day)
        ELSE sDate
    END
    AS eDate
    , chargeType
FROM permit
ORDER BY reg, sDate
) permit_with_eDate,
image image_table
WHERE permit_with_eDate.reg = image_table.reg
AND image_table.whn BETWEEN permit_with_eDate.sDate AND permit_with_eDate.eDate
) valid_permits 
ON image_table.reg = valid_permits.reg
WHERE valid_permits.reg IS NULL
)
SELECT DISTINCT keeper.name, address
FROM vehicle
JOIN cte ON vehicle.id = cte.reg
JOIN keeper ON keepr.id = vehicle.keeper