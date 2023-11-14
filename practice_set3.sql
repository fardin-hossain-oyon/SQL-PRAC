--Q101
WITH CTE AS
(
SELECT
    username
    , activity
    , start_date
    , end_date
    , RANK() OVER (PARTITION BY username ORDER BY end_date DESC) AS rank
    , COUNT(*) OVER (PARTITION BY username) AS activity_count
FROM user_activity
)
SELECT
    username
    , activity
    , start_date
    , end_date
FROM CTE
WHERE (activity_count >= 2 AND rank = 2)
OR (activity_count = 1 AND rank = 1);



--Q102
--SAME AS Q101



--Q103
SELECT name
FROM students
WHERE marks > 75
ORDER BY SUBSTR(name, -3), id ASC;



--Q104
SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;



--Q105
SELECT
    triangles.*
    , CASE
        WHEN A+B<C OR B+C<A OR A+C<B THEN 'not a triangle'
        WHEN A=B AND B=C THEN 'equilateral'
        WHEN A=B OR B=C THEN 'isosceles'
        ELSE 'scalene'
    END
    AS type_of_triangle
FROM triangles;




--Q106
SELECT
    AVG(salary - TO_NUMBER(REPLACE(TO_CHAR(salary), '0', ''))) AS avg_error
FROM employees;




--Q107
SELECT
    MAX(months*salary) AS max_salary
    , COUNT(*) AS max_salary_count
FROM employee
WHERE months*salary = (SELECT MAX(months*salary) FROM employee);



--Q108
SELECT
    name || '(' || SUBSTR(occupation, 1 , 1) || ')' AS common
FROM occupations
ORDER BY name ASC;

--UNION

SELECT
    'There are a total of ' ||
    occurrences || ' ' || LOWER(occupation) || 's' AS common
FROM
(
SELECT
    occupation
    , TO_CHAR(COUNT(*)) AS occurrences
FROM occupations
GROUP BY occupation
)
ORDER BY occurrences ASC, LOWER(occupation) ASC
;



--Q109
--SELECT *
--FROM (
--    SELECT occupation, name
--    FROM OCCUPATIONS
--)
--PIVOT (
--    LISTAGG(name, ' ') WITHIN GROUP (ORDER BY name) AS names
--    FOR occupation IN ('Doctor' AS Doctor, 'Actor' AS Actor, 'Singer' AS Singer, 'Professor' AS Professor)
--)
--ORDER BY 1;


SELECT
    LISTAGG(name, ',') WITHIN GROUP (ORDER BY name) AS persons
FROM occupations
GROUP BY occupation
ORDER BY occupation;

--WITH t1 AS (SELECT name FROM occupations WHERE occupation='Doctor'),
--t2 AS (SELECT name FROM occupations WHERE occupation='Professor'),
--t3 AS (SELECT name FROM occupations WHERE occupation='Singer'),
--t4 AS (SELECT name FROM occupations WHERE occupation='Actor')
--SELECT DISTINCT t1.name, t2.name, t3.name, t4.name
--FROM t1
--FULL OUTER JOIN t2 ON 1=1
--FULL OUTER JOIN t3 ON 1=1
--FULL OUTER JOIN t4 ON 1=1;



--Q110
SELECT
    N AS node
    , CASE
        WHEN P IS NULL THEN 'root'
        WHEN N IN (SELECT P FROM bst)
                THEN 'inner'
        ELSE 'leaf'
    END
    AS type_of_node
FROM bst
ORDER BY N;



-- using CONNECT BY
WITH CTE AS
(
SELECT
    N
    , P
    , LEVEL AS lev
FROM bst
CONNECT BY PRIOR N = P
START WITH P IS NULL
)
SELECT
    N AS node
    , CASE
        WHEN lev = 1 THEN 'root'
        WHEN lev = (SELECT MAX(lev) FROM CTE) THEN 'leaf'
        ELSE 'inner'
    END
    AS type_of_node
FROM CTE
ORDER BY N;



--Q111
SELECT
    c.company_code
    , c.founder
    , COUNT(DISTINCT lm.lead_manager_code) AS lead_managers
    , COUNT(DISTINCT sm.senior_manager_code) AS senior_managers
    , COUNT(DISTINCT m.manager_code) AS managers
    , COUNT(DISTINCT e.employee_code) AS employees
FROM company c
FULL OUTER JOIN lead_manager lm ON c.company_code = lm.company_code
FULL OUTER JOIN senior_manager sm ON lm.lead_manager_code = sm.lead_manager_code
FULL OUTER JOIN manager m ON sm.senior_manager_code = m.senior_manager_code
FULL OUTER JOIN employee e ON m.manager_code = e.manager_code
GROUP BY 
    c.company_code
    , c.founder
;




--Q112
WITH CTE AS
(
SELECT LEVEL L
FROM DUAL
CONNECT BY LEVEL<=1000
),
CTE2 AS
(
SELECT
    c1.l
    , CASE 
        WHEN MOD(c1.l, c2.l) = 0 THEN 1
        ELSE 0
    END
    AS div
FROM CTE c1, CTE c2
WHERE c1.l >= c2.l
),
CTE3 AS
(
SELECT
    l
FROM CTE2
GROUP BY l
HAVING SUM(div)<=2
ORDER BY l
)
SELECT
    LISTAGG(l, '&') WITHIN GROUP (ORDER BY l) AS prime_numbers
FROM CTE3;




--Q113
SELECT RPAD('*', LEVEL, '*') AS star_pattern
FROM dual
CONNECT BY LEVEL <= 20;


--Q114
SELECT LPAD('*', LEVEL, '*') AS star_pattern
FROM dual
CONNECT BY LEVEL <= 5
ORDER BY LEVEL DESC;



--Q115
--SAME AS Q103




--Q116
SELECT DISTINCT
    f1.X
    , f1.Y
FROM functions f1, functions f2
WHERE f1.X = f2.Y AND f2.X = f1.Y AND f1.X<=f1.Y
ORDER BY f1.X;



--Q116(2)
SELECT name
FROM Employee
ORDER BY name ASC;



--Q117
--SAME AS 104



--Q118
--SAME AS 105



--Q119
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


--Q120
--SAME AS Q81


--      q121,q122,q123,q124,q125,q126,q127,q128,q129,q130,q131,q132,q133,q134
--same as q82, q83, q84, q85, q86, q87, q88, q89, q90, q91, q92, q93, q94, q95
--so is not writing it here





--      q135, q136
--same as q101, q102(same as q101)
--so, not writing it here


--Q122
WITH CTE(searches,num_users,temp) AS
(
    SELECT search_frequency.searches,search_frequency.num_users,1 AS TEMP FROM search_frequency
    UNION ALL
    SELECT searches,num_users,temp+1 FROM CTE WHERE temp+1<=num_users
)
SELECT PERCENTILE_CONT(0.50) WITHIN GROUP ( ORDER BY searches ) AS median from cte;


--        q137,q138,q139,q140,q141,q142
--same as q106,q107,q108,q109,q110,q111
--so not writing it here.



--q143
--same as q116(The one q116 before q115)



--Q144
SELECT
    t1.name
FROM
(
SELECT
    students.id
    , students.name
    , friends.friend_id
    , packages.salary
FROM students
JOIN friends ON students.id = friends.id 
JOIN packages ON students.id = packages.id
) t1
JOIN packages ON packages.id = t1.friend_id
WHERE t1.salary < packages.salary;



--Q145
SELECT DISTINCT
    hackers.hacker_id
    , hackers.name
FROM
(
SELECT
    hacker_id
    , COUNT(*) OVER (PARTITION BY hacker_id) AS win_count
FROM submissions
WHERE (challenge_id, score) IN (SELECT challenge_id, MAX(score) FROM submissions GROUP BY challenge_id)
) t1
JOIN hackers ON hackers.hacker_id = t1.hacker_id
WHERE t1.win_count>1;




--Q146
WITH CTE AS
(
SELECT
    start_date
    , end_date
    , next_task_start_date
    , next_task_start_date - end_date AS gap
    , start_date - prev_tast_end_date AS prev_gap
    , ROW_NUMBER() OVER (ORDER BY end_date) AS row_num
FROM
(
SELECT
    task_id
    , start_date
    , end_date
    , LEAD(start_date, 1) OVER (ORDER BY end_date) AS next_task_start_date
    , LAG(end_date, 1) OVER (ORDER BY end_date) AS prev_tast_end_date
FROM projects
)
)
SELECT
    t1.start_date
    , t2.end_date
FROM
(
SELECT
    start_date
    , ROW_NUMBER() OVER (ORDER BY end_date) AS row_num
FROM CTE
WHERE prev_gap IS NULL OR prev_gap<>0
) t1,
(
SELECT
    end_date
    , ROW_NUMBER() OVER (ORDER BY end_date) AS row_num
FROM CTE
WHERE gap IS NULL OR gap<>0
) t2
WHERE t1.row_num = t2.row_num
ORDER BY t2.end_date-t1.start_date ASC
;




--Q147

--TRYING AGAIN LATER
SELECT
    transactions.*
    , LEAD(transaction_date, 1) OVER (ORDER BY transaction_date) - transaction_date AS diff
FROM transactions;



--Q148
SELECT
    COUNT(*) AS unique_relationships
FROM payments p1
JOIN payments p2 ON (p1.payer_id = p2.recipient_id AND p1.recipient_id = p2.payer_id)
WHERE p1.payer_id < p1.recipient_id
;



--Q149
SELECT
    COUNT(*) AS users
FROM user_transactions
WHERE (user_id, transaction_date) IN (SELECT user_id, MIN(transaction_date) FROM user_transactions GROUP BY user_id)
AND spend > 50
;



--Q150
WITH CTE AS
(
SELECT
    measurement_id
    , measurement_value
    , TO_CHAR(measurement_time, 'YYYY-MM-DD') AS tran_day
    , ROW_NUMBER() OVER (PARTITION BY TO_CHAR(measurement_time, 'YYYY-MM-DD') ORDER BY measurement_time) AS row_num
FROM measurements
)
SELECT DISTINCT
    c1.tran_day AS measurement_day
    , (SELECT SUM(c2.measurement_value)
        FROM CTE c2
        WHERE c2.tran_day = c1.tran_day AND MOD(c2.row_num, 2)=1)
        AS odd_sum
    , (SELECT SUM(c3.measurement_value)
        FROM CTE c3
        WHERE c3.tran_day = c1.tran_day AND MOD(c3.row_num, 2)=0)
        AS even_sum
FROM CTE c1











