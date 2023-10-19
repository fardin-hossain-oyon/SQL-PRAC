SELECT COUNT(*) As in_cameras
FROM camera
WHERE perim = 'IN'
GROUP BY perim