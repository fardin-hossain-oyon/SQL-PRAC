WITH k_v_p AS
(
SELECT keeper.id AS k_id, vehicle.id AS v_id, COUNT(*) AS permit_count
FROM vehicle
JOIN keeper ON keeper.id = vehicle.keeper
JOIN permit ON permit.reg = vehicle.id
GROUP BY keeper.id, vehicle.id
)
SELECT DISTINCT t1.k_id
FROM
(
    SELECT k_id, COUNT(*)
    FROM k_v_p
    GROUP BY k_id
) t1,
(
    SELECT k_id, v_id
    FROM k_v_p
    WHERE permit_count > 2
) t2
WHERE t1.k_id = t2.k_id
