WITH thursday_coll AS
(
	SELECT  t1.booking_id
	       ,DATE_FORMAT(t2.thursday_date,'%Y-%m-%d')  AS Thursday -- , t2.nights
	       ,t2.room_amount
	       ,t1.extra_amount
	       ,(t2.room_amount + NVL(t1.extra_amount,0)) AS total
	FROM
	(
		WITH saved_query AS (
		SELECT  booking.booking_id 
        , booking.booking_date
		, booking.nights
		, rate.amount AS rate_amount
		,CASE 
			WHEN DAYOFWEEK(DATE_ADD(booking.booking_date,INTERVAL (booking.nights) DAY)) = 5 THEN DATE_ADD(booking.booking_date,INTERVAL (booking.nights) DAY)
			ELSE DATE_ADD( 
					DATE_ADD(
						booking.booking_date, INTERVAL (booking.nights) DAY), INTERVAL (7 - (DAYOFWEEK(DATE_ADD(booking.booking_date,INTERVAL (booking.nights) DAY)) + 2) % 7) DAY 
				)
		END AS thursday_date 
			   
			,DAYOFWEEK(DATE_ADD(booking.booking_date,INTERVAL (booking.nights) DAY)) AS daysofweek
		FROM booking
		JOIN rate
		ON rate.room_type = booking.room_type_requested AND booking.occupants = rate.occupancy
		)
		SELECT saved_query.booking_id, saved_query.thursday_date, SUM(saved_query.rate_amount * saved_query.nights) AS room_amount
		FROM saved_query
		GROUP BY saved_query.booking_id, saved_query.thursday_date
	) t2
	LEFT JOIN
	(
		SELECT  booking_id
		       ,SUM(amount) AS extra_amount
		FROM extra
		GROUP BY  booking_id
	) t1
	ON t1.booking_id = t2.booking_id
),
thursday_dates AS(
	WITH RECURSIVE Date_CTE AS (
    SELECT CAST('2016-11-01' AS DATE) AS date
    UNION ALL
    SELECT DATE_ADD(date, INTERVAL 1 DAY)
    FROM Date_CTE
    WHERE DATE_ADD(date, INTERVAL 1 DAY) <= '2017-01-06'
)

SELECT DATE_FORMAT(date, '%Y-%m-%d') AS t_date
FROM Date_CTE
WHERE DAYOFWEEK(date) = 5
)
SELECT  thursday_dates.t_date AS Thursday
       ,NVL(SUM(thursday_coll.total), 0) AS Weekly_income
FROM thursday_coll
RIGHT JOIN thursday_dates
ON DATE_FORMAT(thursday_coll.Thursday, '%Y-%m-%d') = thursday_dates.t_date
GROUP BY  thursday_coll.Thursday, thursday_dates.t_date
ORDER BY thursday_dates.t_date