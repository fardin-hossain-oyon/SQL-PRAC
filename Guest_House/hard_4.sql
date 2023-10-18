SELECT 
    room_no, 
    DATE_FORMAT(DATE_ADD(booking_date, interval nights day), '%Y-%m-%d')
    -- *
FROM booking
WHERE DATE_ADD(booking_date, interval nights day) < '2016-12-31' AND booking_date > '2016-11-01'
AND room_no = 201
AND room_type_requested = 'single'
ORDER BY room_no