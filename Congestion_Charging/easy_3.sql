SELECT image.*
FROM image
JOIN camera ON camera.id = image.camera
WHERE camera.id = 10
AND image.whn < '2007-02-26'