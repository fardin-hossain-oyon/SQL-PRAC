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


SELECT *
FROM occupations
ORDER BY occupation, name;

--trying later



--Q110
SELECT
    N AS node
    , CASE
        WHEN P IS NULL THEN 'root'
        WHEN N IN (SELECT DISTINCT t1.n
                    FROM bst t1, bst t2 
                    WHERE t1.N = t2.P AND t1.P IS NOT NULL)
                THEN 'inner'
        ELSE 'leaf'
    END
    AS type_of_node
FROM bst
ORDER BY N;

































