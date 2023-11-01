--Q51
SELECT name, population, area
FROM WORLD
WHERE area >= 3000000 OR population >= 25000000;


--Q52
SELECT name
FROM Customer
WHERE NVL(referee_id, 0) != 2;


--Q53
SELECT name AS customers
FROM Customers
WHERE id NOT IN (SELECT customer_id FROM Orders);

--more efficient solution
SELECT name AS customers
FROM Customers
LEFT JOIN Orders ON Customers.id = Orders.customer_id
WHERE customer_id IS NULL;


--Q54
SELECT 
    employee_id,
    COUNT(*) OVER (PARTITION BY team_id) AS team_size
FROM Employee
ORDER BY employee_id;



--Q55
WITH CTE AS
(
SELECT Country.name, AVG(duration) as duration
FROM Person
JOIN Calls ON Person.id = Calls.caller_id OR Person.id = Calls.callee_id
JOIN Country ON LTRIM(SUBSTR(phone_number, 1, 3), '0') = Country.country_code
GROUP BY Country.name
)
SELECT name
FROM CTE
WHERE duration > (SELECT SUM(duration)/COUNT(*) FROM Calls)
;




--Q56
WITH CTE AS
(
SELECT 
    player_id
    , device_id
    , event_date
    , MIN(event_date) OVER (PARTITION BY player_id) AS first_login
FROM Activity
)
SELECT player_id, device_id
FROM CTE
WHERE event_date = first_login;



--Q57
WITH CTE AS
(
SELECT DISTINCT
    customer_number
    , COUNT(*) OVER (PARTITION BY customer_number) AS total_orders
FROM Orders
)
SELECT customer_number
FROM CTE
WHERE total_orders = (SELECT MAX(total_orders) FROM CTE);




--Q58
SELECT seat_id
FROM
(
SELECT 
    seat_id
    , free
    , LEAD(free,1) OVER (ORDER BY seat_id) AS lead_col
    , LAG(free, 1) OVER (ORDER BY seat_id) AS lag_col
FROM Cinema
)
WHERE (lead_col = 1 AND lag_col = 1 AND free = 1)
OR (lag_col = 0 AND lead_col = 1)
OR (lag_col = 1 AND NVL(lead_col, 0) = 0);



--Q59
SELECT name
FROM Sales_person
MINUS
SELECT s.name
FROM Orders o
JOIN Company c ON o.com_id = c.com_id
JOIN Sales_person s ON o.sales_id = s.sales_id
WHERE c.name = 'RED';



--Q60
SELECT
    x
    , y
    , z
    , CASE
        WHEN (x + y <= z) OR (x + z <= y) OR (y + z <= x)
        THEN 'No'
        ELSE 'Yes'
    END
    AS triangle
FROM triangle;



--Q61
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1, Point p2
WHERE p1.x <> p2.x;



--Q62
SELECT actor_id, director_id
FROM actor_director
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;


--Q63
SELECT Sales.sale_id, Product.product_name, Sales.year, Sales.price
FROM Product
JOIN Sales ON Product.product_id = Sales.product_id
ORDER BY Sales.sale_id;



--Q64
SELECT Project.project_id, ROUND(AVG(Employee.experience_years), 2)
FROM Project
JOIN Employee ON Project.employee_id = Employee.employee_id
GROUP BY Project.project_id;



--Q65
WITH CTE AS
(
SELECT seller_id, SUM(price) AS total_price
FROM Sales
GROUP BY seller_id
)
SELECT seller_id
FROM CTE
WHERE total_price = (SELECT MAX(total_price) FROM CTE);



--Q66
WITH CTE AS
(
SELECT buyer_id, Product.product_name
FROM Product
JOIN Sales ON Product.product_id = Sales.product_id
)
SELECT buyer_id
FROM CTE
WHERE product_name = 'S8'
MINUS
SELECT buyer_id
FROM CTE
WHERE product_name = 'iPhone';



--Q67
WITH CTE1 AS
(
SELECT
    visited_on, amount
    , ROW_NUMBER() OVER (ORDER BY visited_on) AS row_num
FROM Customer
),
CTE2 AS
(
SELECT
    visited_on
    , amount
    , row_num
FROM CTE1
WHERE row_num >= 7
),
CTE3 AS
(
SELECT DISTINCT
    CTE1.visited_on AS cte1_vo
    , CTE2.visited_on AS cte2_vo
    , CTE1.amount
FROM CTE1
JOIN CTE2 ON CTE1.visited_on BETWEEN CTE2.visited_on - 6 AND CTE2.visited_on
)
SELECT 
    cte2_vo AS visited_on
    , SUM(amount) AS amount
    , ROUND(SUM(amount)/7,2) AS average_amount
FROM CTE3
GROUP BY cte2_vo
ORDER BY cte2_vo;




--Q68
WITH CTE AS
(
SELECT gender, day, SUM(score_points) AS total
FROM Scores
GROUP BY gender, day
ORDER BY gender ASC, day ASC
)
SELECT
    c1.gender
    , c1.day
--    , c2.day
    , SUM(c2.total)
FROM CTE c1
JOIN CTE c2 ON (c1.gender = c2.gender AND c1.day >= c2.day)
GROUP BY c1.gender, c1.day
ORDER BY c1.gender, c1.day;



--Q69
WITH CTE AS 
(
SELECT
    log_id
    , LEAD(log_id) OVER (ORDER BY log_id) AS lead_col
    , LAG(log_id) OVER (ORDER BY log_id) AS lag_col
FROM Logs
),
CTE2 AS
(
SELECT log_id AS start_id, ROW_NUMBER() OVER (ORDER BY log_id) AS end_id
FROM CTE
WHERE lag_col IS NULL OR (log_id - lag_col > 1)
),
CTE3 AS
(
SELECT ROW_NUMBER() OVER (ORDER BY log_id) AS start_id, log_id AS end_id
FROM CTE
WHERE lead_col IS NULL OR (lead_col - log_id > 1 )
)
SELECT CTE2.start_id, CTE3.end_id
FROM CTE2
JOIN CTE3 ON CTE2.end_id = CTE3.start_id;




--Q70
SELECT
    t1.student_id
    , t1.student_name
    , t1.subject_name
    , COUNT(Examinations.subject_name) AS attended_exams
FROM
(
SELECT *
FROM Students
JOIN Subjects ON 1=1
--ORDER BY student_id
) t1
LEFT JOIN Examinations
ON t1.student_id = Examinations.student_id
AND t1.subject_name = Examinations.subject_name
GROUP BY
    t1.student_id
    , t1.student_name
    , t1.subject_name
ORDER BY t1.student_id;




--Q71
WITH CTE AS
(
SELECT
    e3.*
    , e.manager_id AS manager_3
FROM Employees e
JOIN
(
SELECT
    e1.employee_id
    , e1.manager_id AS manager_1
    , e2.manager_id AS manager_2
FROM Employees e1
JOIN Employees e2
ON e1.manager_id = e2.employee_id
) e3
ON e3.manager_2 = e.employee_id
)
SELECT employee_id
FROM CTE
WHERE manager_3 = 1 AND employee_id <> 1;


--Q72
WITH CTE AS
(
SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month
    , country
    , CASE
        WHEN state = 'approved' THEN 1
        ELSE 0
    END
    AS approved_or_not
    , CASE
        WHEN state = 'approved' THEN amount
        ELSE 0
    END
    AS approved_amount
    , amount
FROM Transactions
)
SELECT
    month
    , country
    , COUNT(*) AS trans_count
    , SUM(approved_or_not) AS approved_count
    , SUM(amount) AS trans_total_amount
    , SUM(approved_amount) AS approved_total_amount
FROM CTE
GROUP BY month, country;



--Q73
WITH CTE AS
(
SELECT
    DISTINCT
    t1.post_id
    , t1.action_date
    , Removals.post_id AS rem_pid
FROM
(
SELECT
    post_id
    , action_date
FROM Actions
WHERE action = 'report' AND extra = 'spam'
) t1
LEFT JOIN Removals ON t1.post_id = Removals.post_id
),
CTE2 AS
(
SELECT
    CTE.action_date
    , (COUNT(CTE.rem_pid)/COUNT(*)) * 100 AS percentage
FROM CTE
GROUP BY CTE.action_date
)
SELECT AVG(percentage) AS average_daily_percentage
FROM CTE2;



--Q74
WITH CTE AS
(
SELECT COUNT(*) AS total_cons
FROM 
(
SELECT DISTINCT player_id AS pid_1
FROM
(
SELECT
    player_id
    , event_date
    , LEAD(event_date, 1) OVER (ORDER BY player_id, event_date) AS lead_col
FROM Activity
)
WHERE lead_col - event_date = 1
)
),
CTE2 AS
(
SELECT COUNT(*) AS total_players
FROM(
SELECT DISTINCT player_id AS pid_2
FROM Activity
)
)
SELECT 
    ROUND(CTE.total_cons / CTE2. total_players, 2) AS fraction
FROM CTE, CTE2
;




--Q75
--SAME AS Q74



--Q76
WITH CTE AS
(
SELECT
    s.company_id
    , s.employee_id
    , s.employee_name
    , s.salary
    , t1.max_sal
FROM Salaries s
JOIN 
(
SELECT company_id, MAX(salary) AS max_sal
FROM Salaries
GROUP BY company_id
) t1
ON s.company_id = t1.company_id
)
SELECT
    company_id
    , employee_id
    , employee_name
    , CASE
        WHEN max_sal < 1000 THEN salary
        WHEN max_sal >= 1000 AND max_sal <=10000
            THEN ROUND(salary - salary * 0.24)
        ELSE ROUND(salary - salary * 0.49)
    END
    AS salary
FROM CTE;



--Q77
WITH CTE AS
(
SELECT
    left_operand
    , (SELECT value FROM Variables WHERE name = left_operand) AS left_val
    , operator
    , right_operand
    , (SELECT value FROM Variables WHERE name = right_operand) AS right_val
FROM Expressions
)
SELECT
    left_operand
    , operator
    , right_operand
    , CASE
        WHEN operator='<'
            THEN 
                CASE
                    WHEN left_val < right_val THEN 'true'
                    ELSE 'false'
                END
        WHEN operator='>'
            THEN
                CASE
                    WHEN left_val > right_val THEN 'true'
                    ELSe 'false'
                END
        WHEN operator='='
            THEN
                CASE
                    WHEN left_val = right_val THEN 'true'
                    ELSE 'false'
                END
        END
        AS value
FROM CTE;
                


--Q78
--SAME AS Q55



--Q79
SELECT name FROM Employee ORDER BY name;



--Q80
SELECT
    year
    , product_id
    , curr_year_spend
    , prev_year_spend
    ,ROUND(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100, 2) AS yoy_rate
FROM
(
SELECT
    TO_CHAR(transaction_date, 'YYYY') AS year
    , product_id
    , spend as curr_year_spend
    , LAG(spend, 1) OVER (ORDER BY transaction_date) AS prev_year_spend
FROM User_transactions
)
;


















