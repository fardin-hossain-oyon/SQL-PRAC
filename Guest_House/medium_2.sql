SELECT t1.total_extra + t2.total_amount AS total_bill
FROM
(
SELECT SUM(extra.amount) AS total_extra
FROM booking
JOIN extra ON booking.booking_id = extra.booking_id
WHERE booking.booking_id = 5346
) t1,
(
SELECT rate.amount AS total_amount
FROM booking
JOIN rate ON booking.room_type_requested = rate.room_type
WHERE booking.booking_id = 5346
AND rate.occupancy = booking.occupants
) t2
