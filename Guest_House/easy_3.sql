SELECT booking.booking_id, booking.room_type_requested, booking.occupants, rate.amount
FROM booking
JOIN rate ON booking.room_type_requested = rate.room_type
WHERE booking.booking_id IN (5152, 5154,5295)
AND rate.occupancy = booking.occupants