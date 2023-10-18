SELECT room.id
FROM room
LEFT JOIN (
SELECT room_no AS id
FROM booking
WHERE '2016-11-25' BETWEEN
    booking_date AND
    DATE_ADD(booking_date, interval (nights-1) day)
ORDER BY room_no
) r ON room.id = r.id
WHERE r.id IS NULL
