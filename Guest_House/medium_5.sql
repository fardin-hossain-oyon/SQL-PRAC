SELECT SUM(occupants)
FROM booking
WHERE DATE_ADD(booking_date, interval nights day) > '2016-11-21'
AND booking_date <= '2016-11-21'