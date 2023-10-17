SELECT SUM(booking.nights * rate.amount)
FROM booking
JOIN rate ON booking.room_type_requested = rate.room_type
WHERE guest_id = (SELECT id FROM guest WHERE first_name = 'Ruth' AND last_name = 'Cadbury') 
AND rate.occupancy = booking.occupants
