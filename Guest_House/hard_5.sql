---------------- NOT SOLVED YET -------------------------------

WITH thursday_coll AS
(
	SELECT  t1.booking_id
	       ,DATE_FORMAT(t2.thursday_date,'%Y-%m-%d')  AS Thursday -- , t2.nights
	       ,t2.room_amount
	       ,t1.extra_amount
	       ,(t2.room_amount + NVL(t1.extra_amount,0)) AS total
	FROM
	(
		SELECT  booking.booking_id 
        -- , booking.booking_date
		-- , DATE_ADD(booking.booking_date, interval booking.nights day)
		-- , DATE_ADD(booking.booking_date, INTERVAL (8 - DAYOFWEEK(booking.booking_date)) DAY) AS rounded_booking_date
		-- , SUBDATE(DATE_ADD(booking.booking_date, interval booking.nights day), (DAYOFWEEK(DATE_ADD(booking.booking_date, interval booking.nights day)) + 2) % 7) AS thursday_date
		-- , booking.nights
		       ,DATE_ADD( DATE_ADD(booking.booking_date, INTERVAL (booking.nights+1) DAY),INTERVAL (7 - (DAYOFWEEK(DATE_ADD(booking.booking_date,INTERVAL (booking.nights+1) DAY)) + 2) % 7) DAY ) AS thursday_date
		       ,SUM(rate.amount * booking.nights) AS room_amount
		FROM booking
		JOIN rate
		ON rate.room_type = booking.room_type_requested AND booking.occupants = rate.occupancy
		GROUP BY  booking.booking_id
		         ,DATE_ADD( DATE_ADD(booking.booking_date, INTERVAL (booking.nights+1) DAY),INTERVAL (7 - (DAYOFWEEK(DATE_ADD(booking.booking_date, INTERVAL (booking.nights+1) DAY)) + 2) % 7) DAY )
	) t2
	LEFT JOIN
	(
		SELECT  booking_id
		       ,SUM(amount) AS extra_amount
		FROM extra
		GROUP BY  booking_id
	) t1
	ON t1.booking_id = t2.booking_id
)
SELECT  thursday_coll.Thursday
       ,SUM(thursday_coll.total)
FROM thursday_coll
GROUP BY  thursday_coll.Thursday