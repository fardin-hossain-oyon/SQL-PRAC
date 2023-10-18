-- SELECT SUBSTRING(room_no, 1, 1)
-- FROM booking
-- WHERE DATE_ADD(booking_date, interval (nights+1) day) BETWEEN '2016-11-14' AND '2016-11-20'
-- GROUP BY SUBSTRING(room_no, 1, 1)

SELECT DISTINCT
    DATE_FORMAT(DATE_ADD(booking_date, interval (nights) day), '%Y-%m-%d') AS i,
    SUBSTRING(room_no, 1, 1) AS floor_no,
    COUNT(room_no) OVER (PARTITION BY SUBSTRING(room_no, 1, 1), DATE_ADD(booking_date, interval (nights+1) day)
    ) AS room_count

FROM booking
WHERE DATE_ADD(booking_date, interval (nights) day) BETWEEN '2016-11-14' AND '2016-11-20'
ORDER BY i, floor_no