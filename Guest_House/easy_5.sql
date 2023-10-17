SELECT booking.guest_id, COUNT(nights), SUM(booking.nights)
FROM booking
WHERE booking.guest_id IN (1185, 1270)
GROUP BY booking.guest_id