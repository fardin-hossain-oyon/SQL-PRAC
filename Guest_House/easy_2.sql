SELECT booking.arrival_time, guest.first_name, guest.last_name
FROM guest
JOIN booking ON booking.guest_id = guest.id
WHERE booking.booking_date = '2016-11-05'
ORDER BY booking.arrival_time ASC