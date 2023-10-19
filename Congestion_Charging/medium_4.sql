SELECT image.whn, image.reg, keeper.name
FROM vehicle
JOIN image ON image.reg = vehicle.id
JOIN keeper ON keeper.id = vehicle.keeper
WHERE image.camera = 10 AND DATE_FORMAT(image.whn, '%Y-%m-%d') = '2007-02-25'