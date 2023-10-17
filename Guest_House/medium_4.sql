SELECT DATE_FORMAT(booking.booking_date, '%Y-%m-%d') AS i, COUNT(*) AS arrivals
FROM booking
WHERE DATE_FORMAT(booking.booking_date, '%Y-%m-%d') BETWEEN '2016-11-25' AND '2016-12-01'
GROUP BY i
ORDER BY i