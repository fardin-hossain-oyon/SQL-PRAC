SELECT guest.first_name, guest.last_name, guest.address
FROM booking
JOIN guest ON guest.id = booking.guest_id
WHERE room_no = 101
AND booking.booking_date = '2016-12-03'