SELECT DATE_FORMAT(booking_date, '%Y-%m-%d') AS booking_date, nights
FROM booking
WHERE guest_id = 1183