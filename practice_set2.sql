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



--Q81
WITH CTE AS
(
SELECT
    t1.item_type
    , t1.item_count
    , t2.square_footage
    , FLOOR( 500000 / t2.square_footage) * t2.square_footage
     AS sq_ft
     , FLOOR( 500000 / t2.square_footage) * t1.item_count AS total_items
FROM
(
SELECT
    item_type
    , COUNT(*) AS item_count
FROM Inventory
GROUP BY item_type
) t1
JOIN 
(
SELECT
    item_type
    , SUM(square_footage) AS square_footage
FROM Inventory
GROUP BY item_type
) t2
ON t1.item_type = t2.item_type
)
--SELECT * FROM CTE
SELECT
    item_type
    , CASE
        WHEN item_type = 'prime_eligible'
            THEN total_items
        ELSE
            FLOOR( (500000 - (SELECT sq_ft FROM CTE WHERE item_type = 'prime_eligible')) / CTE.square_footage) * CTE.item_count
        END
        AS item_count
FROM CTE
;



--Q82
WITH CTE AS
(
SELECT
    DISTINCT
        month
        , user_id
FROM
(
SELECT
    user_id
    , LTRIM( TO_CHAR(event_date, 'MM'), '0') AS month
FROM user_actions
WHERE event_type IN ('sign-in', 'like', 'comment')
)
)
SELECT
    c2.month
    , COUNT(DISTINCT c2.user_id) AS monthly_active_users
FROM CTE c1
JOIN CTE c2 ON c1.month = c2.month - 1 AND c1.user_id = c2.user_id
WHERE c2.month = 6
GROUP BY c2.month;




--Q83
SELECT MEDIAN(num_users) AS median_num_users
FROM search_frequency;


--Q84
SELECT
    user_id
    , CASE
        WHEN (status='NEW' OR status='EXISTING') AND paid IS NOT NULL 
            THEN 'EXISTING'
        WHEN (status='NEW' OR status='EXISTING') AND paid IS NULL
            THEN 'CHURN'
        WHEN status='CHURN' AND paid IS NOT NULL
            THEN 'RESURRECT'
        WHEN status='CHURN' AND paid IS NULL
            THEN 'CHURN'
        ELSE
            'RESURRECT'
        END
        AS new_status
FROM
(
SELECT
    advertiser.user_id
    , advertiser.status
    , daily_pay.paid
FROM advertiser
LEFT JOIN daily_pay ON advertiser.user_id = daily_pay.user_id
)
ORDER BY user_id;





--Q85
WITH CTE AS
(
SELECT
    server_id
    , session_status
    , status_time
    , prev_time
    , EXTRACT(DAY FROM (status_time - prev_time)) AS uptime_days
FROM
(
SELECT
    server_id
    , status_time
    , session_status
    , LAG(session_status, 1) OVER (ORDER BY server_id, status_time) AS prev_status
    , LAG(status_time, 1) OVER (ORDER BY server_id, status_time) AS prev_time
FROM server_utilization
)
WHERE session_status = 'stop'
)
SELECT
    SUM(uptime_days) AS total_uptime_days
FROM CTE;





--Q86
SELECT COUNT(*) AS payment_count 
FROM
(
SELECT
    t1.merchant_id
    , t2.merchant_id
    , t1.transaction_id
    , t2.transaction_id
    , t1.transaction_timestamp - t2.transaction_timestamp AS diff
FROM transactions t1, transactions t2
WHERE t1.merchant_id = t2.merchant_id
AND t1.credit_card_id = t2.credit_card_id
AND t1.amount = t2.amount
AND EXTRACT(MINUTE FROM (t1.transaction_timestamp - t2.transaction_timestamp)) < 10
AND EXTRACT(MINUTE FROM (t1.transaction_timestamp - t2.transaction_timestamp)) > 0
);



--Q87
WITH CTE AS
(
SELECT
    CASE
        WHEN status='completed incorrectly' OR status='never_received'
            THEN 1
        ELSE 0
    END
    AS bad_exp_y_n
FROM Customers
JOIN Orders ON Orders.customer_id = Customers.customer_id
JOIN trips ON Orders.trip_id = trips.trip_id
WHERE EXTRACT(MONTH FROM signup_timestamp) = 6
AND EXTRACT(DAY FROM order_timestamp - signup_timestamp) <= 14
)
SELECT ROUND((SUM(bad_exp_y_n)/COUNT(*))*100, 2) AS bad_experience_pct
FROM CTE;



--Q88
--SAME AS Q68
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


--Q89
--SAME AS Q55
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



--Q90
WITH CTE(num,frequency,temp) AS
(
    SELECT numbers.num,numbers.frequency,1 AS TEMP FROM numbers
    UNION ALL
    SELECT num,frequency,temp+1 FROM CTE WHERE temp+1<=frequency
)
SELECT PERCENTILE_CONT(0.50) WITHIN GROUP ( ORDER BY num ) AS median_searches from cte;


--- try later without recursion



--Q91
WITH CTE AS
(
SELECT
    Salary.employee_id
    , Employee.department_id
    , amount
    , TO_CHAR(pay_date, 'YYYY-MM') AS pay_month
    , ROUND(AVG(amount) OVER (PARTITION BY TO_CHAR(pay_date, 'YYYY-MM')), 2) AS company_avg
FROM Salary
JOIN Employee ON Salary.employee_id = Employee.employee_id
),
CTE2 AS
(
SELECT
    department_id
    , pay_month
    , company_avg
    , ROUND(AVG(amount), 2) AS dept_avg
FROM CTE
GROUP BY
    department_id
    , pay_month
    , company_avg
)
SELECT
    pay_month
    , department_id
    , CASE
        WHEN dept_avg = company_avg THEN 'same'
        WHEN dept_avg > company_avg THEN 'higher'
        ELSE 'lower'
    END
    AS comparison
FROM CTE2
ORDER BY department_id, pay_month;



--Q92
WITH CTE AS
(
SELECT
    player_id
    , MIN(event_date) AS install_date
FROM Activity
GROUP BY player_id
),
CTE2 AS
(
SELECT
    CTE.player_id
    , CTE.install_date
    , Activity.event_date
FROM CTE
LEFT JOIN Activity ON (CTE.player_id = Activity.player_id
AND CTE.install_date = Activity.event_date - 1)
),
CTE3 AS
(
SELECT
    install_date
    , COUNT(*) AS installs
    , COUNT(event_date) AS retentions
FROM CTE2
GROUP BY install_date
)
SELECT
    install_date
    , installs
    , retentions / installs AS day1_retention
FROM CTE3;



--Q93
WITH CTE1 AS
(
SELECT Players.*, t1.wins
FROM Players
JOIN
(
SELECT winner, COUNT(*) AS wins
FROM
(
SELECT
    CASE
        WHEN first_score > second_score THEN first_player
        WHEN first_score < second_score THEN second_player
        WHEN first_score = second_score AND first_player < second_player THEN first_player
        ELSE second_player
    END
    AS winner
FROM Matches
)
GROUP BY winner
) t1
ON Players.player_id = t1.winner
),
CTE2 AS
(
SELECT 
    player_id
    , group_id
    , wins
    , MAX(wins) OVER (PARTITION BY group_id) AS group_max_wins
FROM CTE1
),
CTE3 AS
(
SELECT player_id, group_id, group_max_wins
FROM CTE2
WHERE wins = group_max_wins
),
CTE4 AS
(
SELECT player_id, group_id, group_max_wins, MIN(player_id) OVER (PARTITION BY group_id) AS min_group
FROM CTE3
)
SELECT group_id, player_id
FROM CTE4
WHERE player_id = min_group;



--Q94
WITH CTE AS
(
SELECT
    Exam.exam_id
    , Exam.student_id
    , Student.student_name
    , Exam.score
    , MAX(Exam.score) OVER (PARTITION BY Exam.exam_id) AS max_score
    , MIN(Exam.score) OVER (PARTITION BY Exam.exam_id) AS min_score
FROM Student
JOIN Exam ON Student.student_id = Exam.student_id
)
SELECT DISTINCT student_id, student_name
FROM CTE
WHERE score <> max_score AND score <> min_score
MINUS
SELECT DISTINCT student_id, student_name
FROM CTE
WHERE score = max_score OR score = min_score;



--Q95
--SAME AS Q94



--Q96
WITH CTE AS
(
SELECT user_id, song_id, song_plays
FROM songs_history
UNION
SELECT
    user_id
    , song_id
    , COUNT(*) AS song_plays
--    , TO_CHAR(listen_time, 'YYYY-MM-DD')
FROM songs_weekly
WHERE TO_CHAR(listen_time, 'YYYY-MM-DD') <= '2022-08-04'
GROUP BY user_id, song_id
)
SELECT user_id, song_id, SUM(song_plays) AS song_plays
FROM CTE
GROUP BY user_id, song_id;



--Q97
WITH CTE AS
(
SELECT
    emails.email_id
    , CASE
        WHEN signup_action = 'Confirmed' THEN 1
        ELSE 0
    END
    AS conf
FROM emails
LEFT JOIN texts ON emails.email_id = texts.email_id
WHERE signup_action = 'Confirmed'
OR signup_action IS NULL
)
SELECT
    ROUND(SUM(conf) / COUNT(*), 2) AS confirm_rate
FROM CTE;



--Q98
WITH CTE AS
(
SELECT
    user_id
    , tweet_date
    , COUNT(*) AS tweet_count
FROM tweets
GROUP BY user_id, tweet_date
)
SELECT
    user_id
    , tweet_date
    , ROUND(AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date), 2) AS rolling_avg_3days
FROM CTE
ORDER BY user_id, tweet_date;



--Q99
WITH CTE AS
(
SELECT
    activities.activity_type
    , age_breakdown.age_bucket
    , SUM(activities.time_spent) AS time_spent
FROM activities
JOIN age_breakdown ON activities.user_id = age_breakdown.user_id
WHERE activity_type <> 'chat'
GROUP BY 
    activities.activity_type
    , age_breakdown.age_bucket
),
CTE2 AS
(
SELECT
    activity_type
    , age_bucket
    , time_spent
    , ROUND(time_spent / (SUM(time_spent) OVER (PARTITION BY age_bucket)), 4) AS perc
FROM CTE
),
CTE3 AS
(
SELECT
    age_bucket
    , CASE
        WHEN activity_type = 'send' THEN perc
        ELSE NULL
    END
    AS send_perc
    , CASE
        WHEN activity_type = 'open' THEN perc
        ELSE NULL
    END
    AS open_perc
FROM CTE2
)
SELECT
    age_bucket
    , (SUM(send_perc) * 100.0) AS send_perc
    , (SUM(open_perc) * 100.0) AS open_perc
FROM CTE3
GROUP BY age_bucket;



--Q100
SELECT
    personal_profiles.profile_id AS profile_id
FROM
(
SELECT
    employee_company.personal_profile_id
    , MAX(company_pages.followers) AS max_follower
FROM employee_company
JOIN company_pages ON employee_company.company_id = company_pages.company_id
GROUP BY employee_company.personal_profile_id
ORDER BY employee_company.personal_profile_id
) t1
JOIN personal_profiles ON t1.personal_profile_id = personal_profiles.profile_id
WHERE t1.max_follower < personal_profiles.followers;




















