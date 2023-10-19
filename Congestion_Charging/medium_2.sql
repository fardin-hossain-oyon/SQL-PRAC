SELECT keeper.name, keeper.address, COUNT(*) AS vehicle_count
FROM vehicle
JOIN keeper ON keeper.id = vehicle.keeper
GROUP BY keeper.name, keeper.address
HAVING COUNT(*) > 5