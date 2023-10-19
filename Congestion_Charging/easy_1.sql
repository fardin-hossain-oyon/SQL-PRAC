SELECT keeper.name, keeper.address
FROM vehicle
JOIN keeper ON keeper.id = vehicle.keeper
WHERE vehicle.id = 'SO 02 PSP'