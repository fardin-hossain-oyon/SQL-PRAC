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
    gender
    , day
    , total
    , total + LAG(total,1) OVER (PARTITION BY gender ORDER BY day) AS cumulative_tot
FROM CTE





















