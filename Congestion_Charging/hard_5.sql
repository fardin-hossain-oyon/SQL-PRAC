SELECT *
FROM permit
WHERE chargeType = 'Daily'
AND DAYOFWEEK(sDate) IN (7, 1)