WITH all_booking_table AS(
    SELECT 
    b.booking_id,
    b.booking_date,
    b.nights,
    g.id,
    g.first_name,
    g.last_name
FROM booking b, guest g
WHERE b.guest_id = g.id
)
SELECT 
    DISTINCT t1.last_name, t1.first_name, t2.first_name
    -- t1.last_name, t1.first_name, DATE_FORMAT(t1.booking_date, '%Y-%m-%d'), t1.nights, t2.first_name, DATE_FORMAT(t2.booking_date, '%Y-%m-%d'), t2.nights
FROM all_booking_table t1, all_booking_table t2
WHERE t1.last_name = t2.last_name
AND t1.first_name <> t2.first_name
AND t1.booking_date BETWEEN t2.booking_date AND DATE_ADD(t2.booking_date, interval (t2.nights-1) day)
GROUP BY t1.last_name
ORDER BY t1.last_name