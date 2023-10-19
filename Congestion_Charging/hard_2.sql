WITH charge_count AS
(
SELECT chargeType, COUNT(*) AS permit_count
FROM permit
GROUP BY chargeType
)
SELECT *
FROM charge_count
WHERE permit_count = (
    SELECT MAX(permit_count)
    FROM charge_count
)