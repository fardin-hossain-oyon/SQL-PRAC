SELECT DISTINCT keeper.name, keeper.address
FROM vehicle
JOIN image ON vehicle.id = image.reg
JOIN keeper ON vehicle.keeper = keeper.id
WHERE image.camera IN (1, 18)