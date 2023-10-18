WITH t AS (SELECT
    room_no
    ,DATE_FORMAT(booking_date, '%Y-%m-%d') AS booking_date
    ,DATE_FORMAT(DATE_ADD(booking_date, interval nights day), '%Y-%m-%d') AS free_date
    ,IFNULL(
        (LEAD(booking_date, 1) OVER (PARTITION BY room_no ORDER BY booking_date) - DATE_ADD(booking_date, interval nights day)), DATE('2016-12-31') - DATE_ADD(booking_date, interval nights day)) AS consecutive_free
FROM booking
WHERE DATE_ADD(booking_date, interval nights day) >= '2016-12-01'
AND DATE_ADD(booking_date, interval nights day) <= '2016-12-31'
AND room_type_requested = 'single'
ORDER BY room_no, free_date
)
SELECT t.room_no, t.free_date
FROM t
WHERE t.consecutive_free >= 3
ORDER BY t.free_date
LIMIT 1
