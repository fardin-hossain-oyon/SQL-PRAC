SELECT t1.id, t1.cam_type, t2.rounded_whn AS busiest_hour
FROM
(
SELECT id, NVL(perim, 'INTERNAL') AS cam_type
FROM camera
) t1
LEFT JOIN (
WITH table1 AS (
SELECT camera
       ,DATE_FORMAT(whn, '%Y-%m-%d %H:00:00') AS rounded_whn
       ,COUNT(*) AS hr_count
       ,MAX(COUNT(*)) OVER (PARTITION BY camera) AS max_hr_count
       ,MIN(DATE_FORMAT(whn, '%Y-%m-%d %H:00:00')) OVER (PARTITION BY camera) AS min_time
FROM image
GROUP BY camera, DATE_FORMAT(whn, '%Y-%m-%d %H:00:00')
)
SELECT DISTINCT table1.camera, table1.rounded_whn, table1.hr_count
FROM table1
WHERE table1.hr_count = table1.max_hr_count
AND table1.rounded_whn = table1.min_time
) t2
ON t1.id = t2.camera
