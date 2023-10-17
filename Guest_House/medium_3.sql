SELECT guest.last_name, guest.first_name, guest.address, NVL(SUM(booking.nights),0)
FROM booking
RIGHT JOIN guest ON booking.guest_id = guest.id
WHERE guest.address LIKE'%Edinburgh%'
GROUP BY guest.last_name, guest.first_name, guest.address