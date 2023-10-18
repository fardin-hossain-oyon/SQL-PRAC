SELECT 
    t.i,
    MAX(CASE WHEN t.floor_no = 1 THEN t.room_count END) AS '1st',
    MAX(CASE WHEN t.floor_no = 2 THEN t.room_count END) AS '2nd',
    MAX(CASE WHEN t.floor_no = 3 THEN t.room_count END) AS '3rd'
FROM
(
SELECT DISTINCT
    DATE_FORMAT(DATE_ADD(booking_date, interval (nights) day), '%Y-%m-%d') AS i,
    SUBSTRING(room_no, 1, 1) AS floor_no,
    COUNT(room_no) OVER (PARTITION BY SUBSTRING(room_no, 1, 1), DATE_ADD(booking_date, interval (nights+1) day)
    ) AS room_count

FROM booking
WHERE DATE_ADD(booking_date, interval (nights) day) BETWEEN '2016-11-14' AND '2016-11-20'
ORDER BY i, floor_no
) t
GROUP BY t.i