WITH unified_table AS
(
    SELECT t1.g1_f_name, t1.g2_f_name, t1.g2_l_name, b.booking_id, b.booking_date, b.nights
    FROM 
    (
        SELECT
            g1.id AS g1_id,
            g1.first_name AS g1_f_name,
            g1.last_name AS g1_l_name,
            g2.id AS g2_id,
            g2.first_name AS g2_f_name,
            g2.last_name AS g2_l_name
        FROM guest g1, guest g2
        WHERE g1.last_name = g2.last_name
        AND g1.id <> g2.id
    ) t1,
    booking b
    WHERE t1.g1_id = b.guest_id
)
SELECT u1.g1_f_name, u1.g1_f_name, u1.g2_l_name
FROM unified_table u1, unified_table u2
WHERE u1.booking_date BETWEEN u2.booking_date AND DATE_ADD(u2.booking_date, interval u2.nights day)