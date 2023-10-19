SELECT DISTINCT keeper.name, keeper.address
FROM vehicle
JOIN permit ON permit.reg = vehicle.id
JOIN keeper ON keeper.id = vehicle.keeper
WHERE permit.sDate = '2007-01-30'