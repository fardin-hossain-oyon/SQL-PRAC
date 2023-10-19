SELECT camera.id, COUNT(*)
FROM camera
JOIN image ON image.camera = camera.id
WHERE camera.id NOT IN (15, 16, 17, 18)
GROUP BY camera.id