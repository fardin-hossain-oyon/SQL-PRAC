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












