--Q51:

CREATE TABLE world
(
  name VARCHAR(25),
  continent VARCHAR(10),
  area NUMBER,
  population NUMBER,
  gdp NUMBER,
  CONSTRAINT pk_world PRIMARY KEY (name)
);

INSERT INTO world VALUES('Afghanistan', 'Asia', 652230, 25500100, 20343000000);
INSERT INTO world VALUES('Albania', 'Europe', 28748, 2831741, 12960000000);
INSERT INTO world VALUES('Algeria', 'Africa', 2381741, 37100000, 188681000000);
INSERT INTO world VALUES('Andorra', 'Europe', 468, 78115, 3712000000);
INSERT INTO world VALUES('Angola', 'Africa', 1246700, 20609294, 100990000000);



--drop tables

DROP TABLE world;


--Q52:

CREATE TABLE customer
(
  id NUMBER,
  name VARCHAR(25),
  referee_id NUMBER,
  CONSTRAINT pk_customer PRIMARY KEY (id)
);

INSERT INTO customer VALUES(1, 'Will', null);
INSERT INTO customer VALUES(2, 'Jane', null);
INSERT INTO customer VALUES(3, 'Alex', 2);
INSERT INTO customer VALUES(4, 'Bill', null);
INSERT INTO customer VALUES(5, 'Zack', 1);
INSERT INTO customer VALUES(6, 'Mark', 2);


--drop tables

DROP TABLE customer;


--Q53:

CREATE TABLE customers
(
  id NUMBER,
  name VARCHAR(25),
  CONSTRAINT pk_customers PRIMARY KEY (id)
);

CREATE TABLE orders
(
  id NUMBER,
  customer_id NUMBER,
  CONSTRAINT pk_orders PRIMARY KEY (id),
  CONSTRAINT fk_customer_order FOREIGN KEY(customer_id)
    REFERENCES customers(id)
);

INSERT INTO customers VALUES(1, 'Joe');
INSERT INTO customers VALUES(2, 'Henry');
INSERT INTO customers VALUES(3, 'Sam');
INSERT INTO customers VALUES(4, 'Max');

INSERT INTO orders VALUES(1, 3);
INSERT INTO orders VALUES(2, 1);



--drop tables

DROP TABLE orders;
DROP TABLE customers;


--Q54:

CREATE TABLE employee
(
  employee_id NUMBER,
  team_id NUMBER,
  CONSTRAINT pk_employee PRIMARY KEY (employee_id)
);

INSERT INTO employee VALUES(1, 8);
INSERT INTO employee VALUES(2, 8);
INSERT INTO employee VALUES(3, 8);
INSERT INTO employee VALUES(4, 7);
INSERT INTO employee VALUES(5, 9);
INSERT INTO employee VALUES(6, 9);



--drop tables

DROP TABLE employee;


--Q55:

CREATE TABLE person
(
  id NUMBER,
  name VARCHAR(25),
  phone_number VARCHAR(11),
  CONSTRAINT pk_person PRIMARY KEY (id)
);

CREATE TABLE country
(
  name VARCHAR(25),
  country_code VARCHAR(3),
  CONSTRAINT pk_country PRIMARY KEY (country_code)
);

CREATE TABLE calls
(
  caller_id NUMBER,
  callee_id NUMBER,
  duration NUMBER
);

INSERT INTO person VALUES(3, 'Jonathan', '051-1234567');
INSERT INTO person VALUES(12, 'Elvis', '051-7654321');
INSERT INTO person VALUES(1, 'Moncef', '212-1234567');
INSERT INTO person VALUES(2, 'Maroua', '212-6523651');
INSERT INTO person VALUES(7, 'Meir', '972-1234567');
INSERT INTO person VALUES(9, 'Rachel', '972-0011100');

INSERT INTO country VALUES('Peru', '51');
INSERT INTO country VALUES('Israel', '972');
INSERT INTO country VALUES('Morocco', '212');
INSERT INTO country VALUES('Germany', '49');
INSERT INTO country VALUES('Ethiopia', '251');

INSERT INTO calls VALUES(1, 9, 33);
INSERT INTO calls VALUES(2, 9, 4);
INSERT INTO calls VALUES(1, 2, 59);
INSERT INTO calls VALUES(3, 12, 102);
INSERT INTO calls VALUES(3, 12, 330);
INSERT INTO calls VALUES(12, 3, 5);
INSERT INTO calls VALUES(7, 9, 13);
INSERT INTO calls VALUES(7, 1, 3);
INSERT INTO calls VALUES(9, 7, 1);
INSERT INTO calls VALUES(1, 7, 7);



--drop tables

DROP TABLE person;
DROP TABLE country;
DROP TABLE calls;


--Q56:

CREATE TABLE activity
(
  player_id NUMBER,
  device_id NUMBER,
  event_date DATE,
  games_played NUMBER
);

INSERT INTO activity VALUES(1, 2, TO_DATE('2016-03-01','YYYY-MM-DD'), 5);
INSERT INTO activity VALUES(1, 2, TO_DATE('2016-05-02','YYYY-MM-DD'), 6);
INSERT INTO activity VALUES(2, 3, TO_DATE('2016-06-25','YYYY-MM-DD'), 1);
INSERT INTO activity VALUES(3, 1, TO_DATE('2016-03-02','YYYY-MM-DD'), 0);
INSERT INTO activity VALUES(3, 4, TO_DATE('2016-07-03','YYYY-MM-DD'), 5);



--drop tables

DROP TABLE activity;


--Q57:

CREATE TABLE orders
(
  order_number NUMBER,
  customer_number NUMBER,
  CONSTRAINT pk_orders PRIMARY KEY (order_number)
);

INSERT INTO orders VALUES(1, 1);
INSERT INTO orders VALUES(2, 2);
INSERT INTO orders VALUES(3, 3);
INSERT INTO orders VALUES(4, 3);



--drop tables

DROP TABLE orders;


--Q58:

CREATE TABLE cinema
(
  seat_id NUMBER AUTO_INCREMENT,
  free BOOLEAN,
  CONSTRAINT pk_cinema PRIMARY KEY (seat_id)
);

INSERT INTO cinema(free) VALUES(TRUE);
INSERT INTO cinema(free) VALUES(FALSE);
INSERT INTO cinema(free) VALUES(TRUE);
INSERT INTO cinema(free) VALUES(TRUE);
INSERT INTO cinema(free) VALUES(TRUE);


--drop tables

DROP TABLE cinema;


--Q59:

CREATE TABLE sales_person
(
  sales_id NUMBER,
  name VARCHAR(25),
  salary NUMBER,
  commission_rate NUMBER,
  hire_rate DATE,
  CONSTRAINT pk_sales_person PRIMARY KEY (sales_id)
);

CREATE TABLE company
(
  com_id NUMBER,
  name VARCHAR(25),
  city VARCHAR(25),
  CONSTRAINT pk_company PRIMARY KEY (com_id)
);

CREATE TABLE orders
(
  order_id NUMBER,
  order_date DATE,
  com_id NUMBER,
  sales_id NUMBER,
  amount NUMBER,
  CONSTRAINT pk_orders PRIMARY KEY (order_id),
  CONSTRAINT fk_company FOREIGN KEY (com_id)
    REFERENCES company(com_id),
  CONSTRAINT fk_sales_person FOREIGN KEY (sales_id)
    REFERENCES sales_person(sales_id)
);


INSERT INTO sales_person VALUES(1, 'John', 100000, 6, '2006-04-01');
INSERT INTO sales_person VALUES(2, 'Amy', 12000, 5, '2010-05-01');
INSERT INTO sales_person VALUES(3, 'Mark', 65000, 12, '2008-12-25');
INSERT INTO sales_person VALUES(4, 'Pam', 25000, 25, '2005-01-01');
INSERT INTO sales_person VALUES(5, 'Alex', 5000, 10, '2007-02-03');

INSERT INTO company VALUES(1, 'RED', 'Boston');
INSERT INTO company VALUES(2, 'ORANGE', 'New York');
INSERT INTO company VALUES(3, 'YELLOW', 'Boston');
INSERT INTO company VALUES(4, 'GREEN', 'Austin');


INSERT INTO orders VALUES(1, '2014-01-01', 3, 4, 10000);
INSERT INTO orders VALUES(2, '2014-02-01', 4, 5, 5000);
INSERT INTO orders VALUES(3, '2014-03-01', 1, 1, 50000);
INSERT INTO orders VALUES(4, '2014-04-01', 1, 4, 25000);



--drop tables

DROP TABLE orders;
DROP TABLE company;
DROP TABLE sales_person;


--Q60:

CREATE TABLE triangle
(
  x NUMBER,
  y NUMBER,
  z NUMBER,
  CONSTRAINT pk_triangle PRIMARY KEY (x,y,z)
);

INSERT INTO triangle VALUES(13, 15, 30);
INSERT INTO triangle VALUES(10, 20, 15);



--drop tables

DROP TABLE triangle;


--Q61:

CREATE TABLE point
(
  x NUMBER,
  CONSTRAINT pk_point PRIMARY KEY (x)
);

INSERT INTO point VALUES(-1);
INSERT INTO point VALUES(0);
INSERT INTO point VALUES(2);


--drop tables

DROP TABLE point;


--Q62:

CREATE TABLE actor_director
(
  actor_id NUMBER,
  director_id NUMBER,
  timestamp NUMBER,
  CONSTRAINT pk_actor_director PRIMARY KEY (timestamp)
);

INSERT INTO actor_director VALUES(1, 1, 0);
INSERT INTO actor_director VALUES(1, 1, 1);
INSERT INTO actor_director VALUES(1, 1, 2);
INSERT INTO actor_director VALUES(1, 2, 3);
INSERT INTO actor_director VALUES(1, 2, 4);
INSERT INTO actor_director VALUES(2, 1, 5);
INSERT INTO actor_director VALUES(2, 1, 6);



--drop tables

DROP TABLE actor_director;


--Q63:

CREATE TABLE product
(
  product_id NUMBER,
  product_name VARCHAR(25),
  CONSTRAINT pk_product PRIMARY KEY (product_id)
);

CREATE TABLE sales
(
  sale_id NUMBER,
  product_id NUMBER,
  year NUMBER,
  quantity NUMBER,
  price NUMBER,
  CONSTRAINT pk_sales PRIMARY KEY (sale_id, year),
  CONSTRAINT fk_product FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

INSERT INTO product VALUES(100, 'Nokia');
INSERT INTO product VALUES(200, 'Apple');
INSERT INTO product VALUES(300, 'Samsung');

INSERT INTO sales VALUES(1, 100, 2008, 10, 5000);
INSERT INTO sales VALUES(2, 100, 2009, 12, 5000);
INSERT INTO sales VALUES(7, 200, 2011, 15, 9000);



--drop tables

DROP TABLE sales;
DROP TABLE product;


--Q64:

CREATE TABLE employee
(
  employee_id NUMBER,
  name VARCHAR(25),
  experience_years NUMBER,
  CONSTRAINT pk_employee PRIMARY KEY (employee_id)
);

CREATE TABLE project
(
  project_id NUMBER,
  employee_id NUMBER,
  CONSTRAINT pk_project PRIMARY KEY (project_id, employee_id),
  CONSTRAINT fk_employee FOREIGN KEY (employee_id)
    REFERENCES employee(employee_id)
);

INSERT INTO employee VALUES(1, 'Khaled', 3);
INSERT INTO employee VALUES(2, 'Ali', 2);
INSERT INTO employee VALUES(3, 'John', 1);
INSERT INTO employee VALUES(4, 'Doe', 2);

INSERT INTO project VALUES(1, 1);
INSERT INTO project VALUES(1, 2);
INSERT INTO project VALUES(1, 3);
INSERT INTO project VALUES(2, 1);
INSERT INTO project VALUES(2, 4);



--drop tables

DROP TABLE project;
DROP TABLE employee;


--Q65:

CREATE TABLE product
(
  product_id NUMBER,
  product_name VARCHAR(25),
  unit_price NUMBER,
  CONSTRAINT pk_product PRIMARY KEY (product_id)
);

CREATE TABLE sales
(
  seller_id NUMBER,
  product_id NUMBER,
  buyer_id NUMBER,
  sale_date DATE,
  quantity NUMBER,
  price NUMBER,
  CONSTRAINT fk_product FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

INSERT INTO product VALUES(1, 'S8', 1000);
INSERT INTO product VALUES(2, 'G4', 800);
INSERT INTO product VALUES(3, 'iPhone', 1400);

INSERT INTO sales VALUES(1, 1, 1, TO_DATE('2019-01-21', 'YYYY-MM-DD'), 2, 2000);
INSERT INTO sales VALUES(1, 2, 2, TO_DATE('2019-02-17', 'YYYY-MM-DD'), 1, 800);
INSERT INTO sales VALUES(2, 2, 3, TO_DATE('2019-06-02', 'YYYY-MM-DD'), 1, 800);
INSERT INTO sales VALUES(3, 3, 4, TO_DATE('2019-05-13', 'YYYY-MM-DD'), 2, 2800);



--drop tables

DROP TABLE sales;
DROP TABLE product;


--Q66:

CREATE TABLE product
(
  product_id NUMBER,
  product_name VARCHAR(25),
  unit_price NUMBER,
  CONSTRAINT pk_product PRIMARY KEY (product_id)
);

CREATE TABLE sales
(
  seller_id NUMBER,
  product_id NUMBER,
  buyer_id NUMBER,
  sale_date DATE,
  quantity NUMBER,
  price NUMBER,
  CONSTRAINT fk_product FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

INSERT INTO product VALUES(1, 'S8', 1000);
INSERT INTO product VALUES(2, 'G4', 800);
INSERT INTO product VALUES(3, 'iPhone', 1400);

INSERT INTO sales VALUES(1, 1, 1, TO_DATE('2019-01-21', 'YYYY-MM-DD'), 2, 2000);
INSERT INTO sales VALUES(1, 2, 2, TO_DATE('2019-02-17', 'YYYY-MM-DD'), 1, 800);
INSERT INTO sales VALUES(2, 1, 3, TO_DATE('2019-06-02', 'YYYY-MM-DD'), 1, 800);
INSERT INTO sales VALUES(3, 3, 3, TO_DATE('2019-05-13', 'YYYY-MM-DD'), 2, 2800);



--drop tables

DROP TABLE sales;
DROP TABLE product;


--Q67:

CREATE TABLE customer
(
  customer_id NUMBER,
  name VARCHAR(25),
  visited_on DATE,
  amount NUMBER,
  CONSTRAINT pk_customer PRIMARY KEY (customer_id, visited_on)
);

INSERT INTO customer VALUES(1, 'Jhon', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 100);
INSERT INTO customer VALUES(2, 'Daniel', TO_DATE('2019-01-02', 'YYYY-MM-DD'), 110);
INSERT INTO customer VALUES(3, 'Jade', TO_DATE('2019-01-03', 'YYYY-MM-DD'), 120);
INSERT INTO customer VALUES(4, 'Khaled', TO_DATE('2019-01-04', 'YYYY-MM-DD'), 130);
INSERT INTO customer VALUES(5, 'Winston', TO_DATE('2019-01-05', 'YYYY-MM-DD'), 110);
INSERT INTO customer VALUES(6, 'Elvis', TO_DATE('2019-01-06', 'YYYY-MM-DD'), 140);
INSERT INTO customer VALUES(7, 'Anna', TO_DATE('2019-01-07', 'YYYY-MM-DD'), 150);
INSERT INTO customer VALUES(8, 'Maria', TO_DATE('2019-01-08', 'YYYY-MM-DD'), 80);
INSERT INTO customer VALUES(9, 'Jaze', TO_DATE('2019-01-09', 'YYYY-MM-DD'), 110);
INSERT INTO customer VALUES(1, 'Jhon', TO_DATE('2019-01-10', 'YYYY-MM-DD'), 130);
INSERT INTO customer VALUES(3, 'Jade', TO_DATE('2019-01-10', 'YYYY-MM-DD'), 150);


--drop tables

DROP TABLE customer;


--Q68:

CREATE TABLE scores
(
  player_name VARCHAR(25),
  gender VARCHAR(1),
  day DATE,
  score_points NUMBER,
  CONSTRAINT pk_scores PRIMARY KEY (gender, day)
);

INSERT INTO scores VALUES('Aron', 'F', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 17);
INSERT INTO scores VALUES('Alice', 'F', TO_DATE('2020-01-07', 'YYYY-MM-DD'), 23);
INSERT INTO scores VALUES('Bajrang', 'M', TO_DATE('2020-01-07', 'YYYY-MM-DD'), 7);
INSERT INTO scores VALUES('Khali' , 'M', TO_DATE('2019-12-25', 'YYYY-MM-DD'), 11);
INSERT INTO scores VALUES('Slaman', 'M', TO_DATE('2019-12-30', 'YYYY-MM-DD'), 13);
INSERT INTO scores VALUES('Joe', 'M', TO_DATE('2019-12-31', 'YYYY-MM-DD'), 3);
INSERT INTO scores VALUES('Jose', 'M', TO_DATE('2019-12-18', 'YYYY-MM-DD'), 2);
INSERT INTO scores VALUES('Priya', 'F', TO_DATE('2019-12-31', 'YYYY-MM-DD'), 23);
INSERT INTO scores VALUES('Priyanka', 'F', TO_DATE('2019-12-30', 'YYYY-MM-DD'), 17);



--drop tables

DROP TABLE scores;


--Q69:

CREATE TABLE logs
(
  log_id NUMBER,
  CONSTRAINT pk_logs PRIMARY KEY (log_id)
);

INSERT INTO logs VALUES(1),(2),(3),(7),(8),(10);



--drop tables

DROP TABLE logs;


--Q70:

CREATE TABLE students
(
  student_id NUMBER,
  student_name VARCHAR(25),
  CONSTRAINT pk_students PRIMARY KEY (student_id)
);

CREATE TABLE subjects
(
  subject_name VARCHAR(25),
  CONSTRAINT pk_subjects PRIMARY KEY (subject_name)
);

CREATE TABLE examinations
(
  student_id NUMBER,
  subject_name VARCHAR(25)
);

INSERT INTO students VALUES(1, 'Alice');
INSERT INTO students VALUES(2, 'Bob');
INSERT INTO students VALUES(13, 'John');
INSERT INTO students VALUES(6,'Alex');

INSERT INTO subjects VALUES('Math');
INSERT INTO subjects VALUES('Physics');
INSERT INTO subjects VALUES('Programming');

INSERT INTO examinations VALUES(1,'Math');
INSERT INTO examinations VALUES(1, 'Physics');
INSERT INTO examinations VALUES(1, 'Programming');
INSERT INTO examinations VALUES(2, 'Programming');
INSERT INTO examinations VALUES(1, 'Physics');
INSERT INTO examinations VALUES(1, 'Math');
INSERT INTO examinations VALUES(13, 'Math');
INSERT INTO examinations VALUES(13, 'Programming');
INSERT INTO examinations VALUES(13, 'Physics');
INSERT INTO examinations VALUES(2, 'Math');
INSERT INTO examinations VALUES(1, 'Math');




--drop tables

DROP TABLE students;
DROP TABLE subjects;
DROP TABLE examinations;


--Q71:

CREATE TABLE employees
(
  employee_id NUMBER,
  employee_name VARCHAR(25),
  manager_id NUMBER,
  CONSTRAINT pk_employees PRIMARY KEY(employee_id)
);

INSERT INTO employees VALUES(1, 'Boss', 1);
INSERT INTO employees VALUES(3, 'Alice', 3);
INSERT INTO employees VALUES(2, 'Bob', 1);
INSERT INTO employees VALUES(4, 'Daniel', 2);
INSERT INTO employees VALUES(7, 'Luis', 4);
INSERT INTO employees VALUES(8, 'Jhon', 3);
INSERT INTO employees VALUES(9, 'Angela', 8);
INSERT INTO employees VALUES(77, 'Robert', 1);




--drop tables

DROP TABLE employees;


--Q72:

CREATE TABLE transactions
(
  id NUMBER,
  country VARCHAR(25),
  state VARCHAR(15),
  amount NUMBER,
  trans_date DATE,
  CONSTRAINT pk_trx PRIMARY KEY(id)
);

INSERT INTO transactions VALUES(121, 'US', 'approved', 1000, TO_DATE('2018-12-18', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES(122, 'US', 'declined', 2000, TO_DATE('2018-12-19', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES(123, 'US', 'approved', 2000, TO_DATE('2019-01-01', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES(124, 'DE', 'approved', 2000, TO_DATE('2019-01-07', 'YYYY-MM-DD'));



--drop tables

DROP TABLE transactions;

--Q73:

CREATE TABLE actions
(
  user_id NUMBER,
  post_id NUMBER,
  action_date DATE,
  action VARCHAR(15),
  extra VARCHAR(25)
);

CREATE TABLE removals
(
  post_id NUMBER,
  remove_date DATE
);

INSERT INTO actions VALUES(1, 1, TO_DATE('2019-07-01', 'YYYY-MM-DD') ,'view', null);
INSERT INTO actions VALUES(1, 1, TO_DATE('2019-07-01', 'YYYY-MM-DD') , 'like', null);
INSERT INTO actions VALUES(1, 1, TO_DATE('2019-07-01', 'YYYY-MM-DD') , 'share', null);
INSERT INTO actions VALUES(2, 2, TO_DATE('2019-07-04', 'YYYY-MM-DD') , 'view', null);
INSERT INTO actions VALUES(2, 2, TO_DATE('2019-07-04', 'YYYY-MM-DD') , 'report', 'spam');
INSERT INTO actions VALUES(3, 4, TO_DATE('2019-07-04', 'YYYY-MM-DD') , 'view', null);
INSERT INTO actions VALUES(3, 4, TO_DATE('2019-07-04', 'YYYY-MM-DD') , 'report', 'spam');
INSERT INTO actions VALUES(4, 3, TO_DATE('2019-07-02', 'YYYY-MM-DD') , 'view', null);
INSERT INTO actions VALUES(4, 3, TO_DATE('2019-07-02', 'YYYY-MM-DD') , 'report', 'spam');
INSERT INTO actions VALUES(5, 2, TO_DATE('2019-07-03', 'YYYY-MM-DD') , 'view', null);
INSERT INTO actions VALUES(5, 2, TO_DATE('2019-07-03', 'YYYY-MM-DD') , 'report', 'racism');
INSERT INTO actions VALUES(5, 5, TO_DATE('2019-07-03', 'YYYY-MM-DD') , 'view', null);
INSERT INTO actions VALUES(5, 5, TO_DATE('2019-07-03', 'YYYY-MM-DD') , 'report', 'racism');

INSERT INTO removals VALUES(2, TO_DATE('2019-07-20', 'YYYY-MM-DD') );
INSERT INTO removals VALUES(3, TO_DATE('2019-07-18', 'YYYY-MM-DD') );



--drop tables

DROP TABLE actions;
DROP TABLE removals;


--Q74:

CREATE TABLE activity
(
  player_id NUMBER,
  device_id NUMBER,
  event_date DATE,
  games_played NUMBER,
  CONSTRAINT pk_activity PRIMARY KEY(player_id, event_date)
);

INSERT INTO activity VALUES(1, 2, TO_DATE('2016-03-01', 'YYYY-MM-DD'), 5);
INSERT INTO activity VALUES(1 ,2, TO_DATE('2016-03-02', 'YYYY-MM-DD'), 6);
INSERT INTO activity VALUES(2, 3, TO_DATE('2017-06-25', 'YYYY-MM-DD'), 1);
INSERT INTO activity VALUES(3, 1, TO_DATE('2016-03-02', 'YYYY-MM-DD'), 0);
INSERT INTO activity VALUES(3, 4, TO_DATE('2018-07-03', 'YYYY-MM-DD'), 5);


--drop tables

DROP TABLE activity;


--Q75:

CREATE TABLE activity
(
  player_id NUMBER,
  device_id NUMBER,
  event_date DATE,
  games_played NUMBER,
  CONSTRAINT pk_activity PRIMARY KEY(player_id, event_date)
);

INSERT INTO activity VALUES(1, 2, '2016-03-01', 5);
INSERT INTO activity VALUES(1 ,2, '2016-03-02', 6);
INSERT INTO activity VALUES(2, 3, '2017-06-25', 1);
INSERT INTO activity VALUES(3, 1, '2016-03-02', 0);
INSERT INTO activity VALUES(3, 4, '2018-07-03', 5);



--drop tables

DROP TABLE activity;


--Q76:

CREATE TABLE salaries
(
  company_id NUMBER,
  employee_id NUMBER,
  employee_name VARCHAR(25),
  salary NUMBER,
  CONSTRAINT pk_salary PRIMARY KEY(company_id, employee_id)
);

INSERT INTO salaries VALUES(1, 1, 'Tony', 2000);
INSERT INTO salaries VALUES(1, 2, 'Pronub', 21300);
INSERT INTO salaries VALUES(1, 3, 'Tyrrox', 10800);
INSERT INTO salaries VALUES(2, 1, 'Pam', 300);
INSERT INTO salaries VALUES(2, 7, 'Bassem', 450);
INSERT INTO salaries VALUES(2, 9, 'Hermione', 700);
INSERT INTO salaries VALUES(3, 7, 'Bocaben', 100);
INSERT INTO salaries VALUES(3, 2, 'Ognjen', 2200);
INSERT INTO salaries VALUES(3, 13, 'Nyan Cat', 3300);
INSERT INTO salaries VALUES(3, 15, 'Morning Cat', 7777);



--drop tables

DROP TABLE salaries;


--Q77:

CREATE TABLE variables
(
  name VARCHAR(5),
  value NUMBER,
  CONSTRAINT pk_variables PRIMARY KEY(name)
);

CREATE TABLE expressions
(
  left_operand VARCHAR(5),
  operator VARCHAR(1),
  right_operand VARCHAR(5),
  CONSTRAINT pk_expressions PRIMARY KEY(left_operand, operator, right_operand)
);

INSERT INTO variables VALUES('x', 66);
INSERT INTO variables VALUES('y', 77);

INSERT INTO expressions VALUES('x', '>', 'y');
INSERT INTO expressions VALUES('x', '<', 'y');
INSERT INTO expressions VALUES('x', '=', 'y');
INSERT INTO expressions VALUES('y', '>', 'x');
INSERT INTO expressions VALUES('y', '<', 'x');
INSERT INTO expressions VALUES('y', '=', 'x');



--drop tables

DROP TABLE variables;


--Q78:

CREATE TABLE person
(
  id NUMBER,
  name VARCHAR(25),
  phone_number VARCHAR(11),
  CONSTRAINT pk_person PRIMARY KEY (id)
);

CREATE TABLE country
(
  name VARCHAR(25),
  country_code VARCHAR(3),
  CONSTRAINT pk_country PRIMARY KEY (country_code)
);

CREATE TABLE calls
(
  caller_id NUMBER,
  callee_id NUMBER,
  duration NUMBER
);

INSERT INTO person VALUES(3, 'Jonathan', '051-1234567');
INSERT INTO person VALUES(12, 'Elvis', '051-7654321');
INSERT INTO person VALUES(1, 'Moncef', '212-1234567');
INSERT INTO person VALUES(2, 'Maroua', '212-6523651');
INSERT INTO person VALUES(7, 'Meir', '972-1234567');
INSERT INTO person VALUES(9, 'Rachel', '972-0011100');

INSERT INTO country VALUES('Peru', '51');
INSERT INTO country VALUES('Israel', '972');
INSERT INTO country VALUES('Morocco', '212');
INSERT INTO country VALUES('Germany', '49');
INSERT INTO country VALUES('Ethiopia', '251');

INSERT INTO calls VALUES(1, 9, 33);
INSERT INTO calls VALUES(2, 9, 4);
INSERT INTO calls VALUES(1, 2, 59);
INSERT INTO calls VALUES(3, 12, 102);
INSERT INTO calls VALUES(3, 12, 330);
INSERT INTO calls VALUES(12, 3, 5);
INSERT INTO calls VALUES(7, 9, 13);
INSERT INTO calls VALUES(7, 1, 3);
INSERT INTO calls VALUES(9, 7, 1);
INSERT INTO calls VALUES(1, 7, 7);



--drop tables

DROP TABLE person;
DROP TABLE country;
DROP TABLE calls;


--Q79:

CREATE TABLE employee
(
  employee_id NUMBER,
  name VARCHAR(25),
  months NUMBER,
  salary NUMBER,
  CONSTRAINT pk_employee PRIMARY KEY(employee_id)
);


INSERT INTO employee VALUES(12228, 'Rose', 15, 1968);
INSERT INTO employee VALUES(33645, 'Angela', 1, 3443);
INSERT INTO employee VALUES(45692, 'Frank', 17, 1608);
INSERT INTO employee VALUES(56118, 'Patrick', 7, 1345);
INSERT INTO employee VALUES(59725, 'Lisa', 11, 2330);
INSERT INTO employee VALUES(74197, 'Kimberly', 16, 4372);
INSERT INTO employee VALUES(78454, 'Bonnie', 8, 1771);
INSERT INTO employee VALUES(83565, 'Michael', 6, 2017);
INSERT INTO employee VALUES(98607, 'Todd', 5, 3396);
INSERT INTO employee VALUES(99989, 'Joe', 9, 3573);



--drop tables

DROP TABLE employee;


--Q80:

CREATE TABLE user_transactions
(
  transaction_id NUMBER,
  product_id NUMBER,
  spend DECIMAL(10,2),
  transaction_date DATE
);


INSERT INTO user_transactions VALUES(1341, 123424, 1500.60, TO_DATE('2019-12-31', 'YYYY-MM-DD'));
INSERT INTO user_transactions VALUES(1423, 123424, 1000.20, TO_DATE('2020-12-31', 'YYYY-MM-DD'));
INSERT INTO user_transactions VALUES(1623, 123424, 1246.44, TO_DATE('2021-12-31', 'YYYY-MM-DD'));
INSERT INTO user_transactions VALUES(1322, 123424, 2145.32, TO_DATE('2022-12-31', 'YYYY-MM-DD'));




--drop tables

DROP TABLE user_transactions;


--Q81:

CREATE TABLE inventory
(
  item_id NUMBER,
  item_type VARCHAR(20),
  item_category VARCHAR(20),
  square_footage DECIMAL(10,2)
);

INSERT INTO inventory VALUES(1374, 'prime_eligible' , 'mini refrigerator', 68.00);
INSERT INTO inventory VALUES(4245, 'not_prime', 'standing lamp', 26.40);
INSERT INTO inventory VALUES(2452, 'prime_eligible', 'television', 85.00);
INSERT INTO inventory VALUES(3255, 'not_prime', 'side table', 22.60);
INSERT INTO inventory VALUES(1672, 'prime_eligible', 'laptop', 8.50);



--drop tables

DROP TABLE inventory;


--Q82:

CREATE TABLE user_actions
(
  user_id NUMBER,
  event_id NUMBER,
  event_type VARCHAR(20),
  event_date DATE
);

INSERT INTO user_actions VALUES(445, 7765 , 'sign-in', TO_DATE('2022-05-31', 'YYYY-MM-DD'));
INSERT INTO user_actions VALUES(742, 6458, 'sign-in', TO_DATE('2022-06-03', 'YYYY-MM-DD'));
INSERT INTO user_actions VALUES(445, 3634, 'like', TO_DATE('2022-06-05', 'YYYY-MM-DD'));
INSERT INTO user_actions VALUES(742, 1374, 'comment', TO_DATE('2022-06-05', 'YYYY-MM-DD'));
INSERT INTO user_actions VALUES(648, 3124, 'like', TO_DATE('2022-06-18', 'YYYY-MM-DD'));




--drop tables

DROP TABLE user_actions;


--Q83:

CREATE TABLE search_frequency
(
  searches NUMBER,
  num_users NUMBER
);

INSERT INTO search_frequency VALUES(1, 2);
INSERT INTO search_frequency VALUES(2, 2);
INSERT INTO search_frequency VALUES(3, 3);
INSERT INTO search_frequency VALUES(4, 1);



--drop tables

DROP TABLE search_frequency;


--Q84:

CREATE TABLE advertiser
(
  user_id VARCHAR(15),
  status VARCHAR(15)
);

CREATE TABLE daily_pay
(
  user_id VARCHAR(15),
  paid DECIMAL(10,2)
);

INSERT INTO advertiser VALUES('bing', 'NEW');
INSERT INTO advertiser VALUES('yahoo', 'NEW');
INSERT INTO advertiser VALUES('alibaba', 'EXISTING');

--resuccernt test
INSERT INTO advertiser VALUES('oracle', 'CHURN');

INSERT INTO daily_pay VALUES('yahoo', '45.00');
INSERT INTO daily_pay VALUES('alibaba', '100.00');
INSERT INTO daily_pay VALUES('target', '13.00');

--resuccernt test
INSERT INTO daily_pay VALUES('oracle', '13.00');





--drop tables

DROP TABLE advertiser;
DROP TABLE daily_pay;


--Q85:

CREATE TABLE server_utilization
(
  server_id NUMBER,
  status_time TIMESTAMP,
  session_status VARCHAR(10)
);

INSERT INTO server_utilization VALUES(1, TIMESTAMP '2022-08-02 10:00:00', 'start');
INSERT INTO server_utilization VALUES(1, TIMESTAMP '2022-08-04 10:00:00', 'stop');
INSERT INTO server_utilization VALUES(2, TIMESTAMP '2022-08-17 10:00:00', 'start');
INSERT INTO server_utilization VALUES(2, TIMESTAMP '2022-08-24 10:00:00', 'stop');



--drop tables

DROP TABLE server_utilization;


--Q86:

CREATE TABLE transactions
(
  transaction_id NUMBER,
  merchant_id NUMBER,
  credit_card_id NUMBER,
  amount NUMBER,
  transaction_timestamp TIMESTAMP
);

INSERT INTO transactions VALUES(1, 101, 1, 100, TIMESTAMP '2022-09-25 12:00:00');
INSERT INTO transactions VALUES(2, 101, 1, 100, TIMESTAMP '2022-09-25 12:08:00');
INSERT INTO transactions VALUES(3, 101, 1, 100, TIMESTAMP '2022-09-25 12:28:00');
INSERT INTO transactions VALUES(4, 102, 2, 300, TIMESTAMP '2022-09-25 12:00:00');
INSERT INTO transactions VALUES(5, 102, 2, 400, TIMESTAMP '2022-09-25 14:00:00');



--drop tables

DROP TABLE transactions;


--Q87:

CREATE TABLE orders
(
  order_id NUMBER,
  customer_id NUMBER,
  trip_id NUMBER,
  status VARCHAR(30),
  order_timestamp TIMESTAMP
);

CREATE TABLE trips
(
  dasher_id NUMBER,
  trip_id NUMBER,
  estimated_delivery_timestamp TIMESTAMP,
  actual_delivery_timestamp TIMESTAMP
);

CREATE TABLE customers
(
  customer_id NUMBER,
  signup_timestamp TIMESTAMP
);

INSERT INTO orders VALUES(727424,8472, 100463, 'completed successfully', TIMESTAMP  '2022-06-05 09:12:00');
INSERT INTO orders VALUES(242513, 2341, 100482, 'completed incorrectly', TIMESTAMP '2022-06-05 14:40:00');
INSERT INTO orders VALUES(141367, 1314, 100362, 'completed incorrectly', TIMESTAMP '2022-06-07 15:03:00');
INSERT INTO orders VALUES(582193, 5421, 100657, 'never_received', TIMESTAMP '2022-07-07 15:22:00');
INSERT INTO orders VALUES(253613, 1314, 100213, 'completed successfully', TIMESTAMP '2022-06-12 13:43:00');

INSERT INTO trips VALUES(101, 100463, TIMESTAMP '2022-06-05 09:42:00', TIMESTAMP '2022-06-05 09:38:00');
INSERT INTO trips VALUES(102, 100482, TIMESTAMP '2022-06-05 15:10:00', TIMESTAMP '2022-06-05 15:46:00');
INSERT INTO trips VALUES(101, 100362, TIMESTAMP '2022-06-07 15:33:00', TIMESTAMP '2022-06-07 16:45:00');
INSERT INTO trips VALUES(102, 100657, TIMESTAMP '2022-07-07 15:52:00',null);
INSERT INTO trips VALUES(103, 100213, TIMESTAMP '2022-06-12 14:13:00', TIMESTAMP '2022-06-12 14:10:00');

INSERT INTO customers VALUES(8472, TIMESTAMP '2022-05-30 00:00:00');
INSERT INTO customers VALUES(2341, TIMESTAMP '2022-06-01 00:00:00');
INSERT INTO customers VALUES(1314, TIMESTAMP '2022-06-03 00:00:00');
INSERT INTO customers VALUES(1435, TIMESTAMP '2022-06-05 00:00:00');
INSERT INTO customers VALUES(5421, TIMESTAMP '2022-06-07 00:00:00');


--drop tables

DROP TABLE orders;
DROP TABLE customers;


--Q88:

CREATE TABLE scores
(
  player_name VARCHAR(25),
  gender VARCHAR(1),
  day DATE,
  score_points NUMBER,
  CONSTRAINT pk_scores PRIMARY KEY (gender, day)
);

INSERT INTO scores VALUES('Aron', 'F', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 17);
INSERT INTO scores VALUES('Alice', 'F', TO_DATE('2020-01-07', 'YYYY-MM-DD'), 23);
INSERT INTO scores VALUES('Bajrang', 'M', TO_DATE('2020-01-07', 'YYYY-MM-DD'), 7);
INSERT INTO scores VALUES('Khali' , 'M', TO_DATE('2019-12-25', 'YYYY-MM-DD'), 11);
INSERT INTO scores VALUES('Slaman', 'M', TO_DATE('2019-12-30', 'YYYY-MM-DD'), 13);
INSERT INTO scores VALUES('Joe', 'M', TO_DATE('2019-12-31', 'YYYY-MM-DD'), 3);
INSERT INTO scores VALUES('Jose', 'M', TO_DATE('2019-12-18', 'YYYY-MM-DD'), 2);
INSERT INTO scores VALUES('Priya', 'F', TO_DATE('2019-12-31', 'YYYY-MM-DD'), 23);
INSERT INTO scores VALUES('Priyanka', 'F', TO_DATE('2019-12-30', 'YYYY-MM-DD'), 17);



--drop tables

DROP TABLE scores;


--Q89:

CREATE TABLE person
(
  id NUMBER,
  name VARCHAR(25),
  phone_number VARCHAR(11),
  CONSTRAINT pk_person PRIMARY KEY (id)
);

CREATE TABLE country
(
  name VARCHAR(25),
  country_code VARCHAR(3),
  CONSTRAINT pk_country PRIMARY KEY (country_code)
);

CREATE TABLE calls
(
  caller_id NUMBER,
  callee_id NUMBER,
  duration NUMBER
);

INSERT INTO person VALUES(3, 'Jonathan', '051-1234567');
INSERT INTO person VALUES(12, 'Elvis', '051-7654321');
INSERT INTO person VALUES(1, 'Moncef', '212-1234567');
INSERT INTO person VALUES(2, 'Maroua', '212-6523651');
INSERT INTO person VALUES(7, 'Meir', '972-1234567');
INSERT INTO person VALUES(9, 'Rachel', '972-0011100');

INSERT INTO country VALUES('Peru', '51');
INSERT INTO country VALUES('Israel', '972');
INSERT INTO country VALUES('Morocco', '212');
INSERT INTO country VALUES('Germany', '49');
INSERT INTO country VALUES('Ethiopia', '251');

INSERT INTO calls VALUES(1, 9, 33);
INSERT INTO calls VALUES(2, 9, 4);
INSERT INTO calls VALUES(1, 2, 59);
INSERT INTO calls VALUES(3, 12, 102);
INSERT INTO calls VALUES(3, 12, 330);
INSERT INTO calls VALUES(12, 3, 5);
INSERT INTO calls VALUES(7, 9, 13);
INSERT INTO calls VALUES(7, 1, 3);
INSERT INTO calls VALUES(9, 7, 1);
INSERT INTO calls VALUES(1, 7, 7);



--drop tables

DROP TABLE person;
DROP TABLE country;
DROP TABLE calls;


--Q90:

CREATE TABLE numbers
(
  num NUMBER,
  frequency NUMBER
);

INSERT INTO numbers VALUES(0, 7);
INSERT INTO numbers VALUES(1, 1);
INSERT INTO numbers VALUES(2, 3);
INSERT INTO numbers VALUES(3, 1);



--drop tables

DROP TABLE numbers;


--Q91:

CREATE TABLE employee
(
  employee_id NUMBER,
  department_id NUMBER,
  CONSTRAINT pk_employee PRIMARY KEY(employee_id)
);

CREATE TABLE salary
(
  id NUMBER,
  employee_id NUMBER,
  amount NUMBER,
  pay_date DATE,
  CONSTRAINT pk_salary PRIMARY KEY(id),
  CONSTRAINT fk_employee FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
);

INSERT INTO employee VALUES(1, 1);
INSERT INTO employee VALUES(2, 2);
INSERT INTO employee VALUES(3, 2);

INSERT INTO salary VALUES(1, 1, 9000, TO_DATE('2017-03-31', 'YYYY-MM-DD'));
INSERT INTO salary VALUES(2, 2, 6000, TO_DATE('2017-03-31', 'YYYY-MM-DD'));
INSERT INTO salary VALUES(3, 3, 10000, TO_DATE('2017-03-31', 'YYYY-MM-DD'));
INSERT INTO salary VALUES(4, 1, 7000, TO_DATE('2017-02-28', 'YYYY-MM-DD'));
INSERT INTO salary VALUES(5, 2, 6000, TO_DATE('2017-02-28', 'YYYY-MM-DD'));
INSERT INTO salary VALUES(6, 3, 8000, TO_DATE('2017-02-28', 'YYYY-MM-DD'));



--drop tables

DROP TABLE salary;
DROP TABLE employee;


--Q92:

CREATE TABLE activity
(
  player_id NUMBER,
  device_id NUMBER,
  event_date DATE,
  games_played NUMBER,
  CONSTRAINT pk_activity PRIMARY KEY(player_id, event_date)
);

INSERT INTO activity VALUES(1, 2, TO_DATE('2016-03-01', 'YYYY-MM-DD'), 5);
INSERT INTO activity VALUES(1, 2, TO_DATE('2016-03-02', 'YYYY-MM-DD'), 6);
INSERT INTO activity VALUES(2, 3, TO_DATE('2017-06-25', 'YYYY-MM-DD'), 1);
INSERT INTO activity VALUES(3, 1, TO_DATE('2016-03-01', 'YYYY-MM-DD'), 0);
INSERT INTO activity VALUES(3, 4, TO_DATE('2016-07-03', 'YYYY-MM-DD'), 5);



--drop tables

DROP TABLE activity;


--Q93:

CREATE TABLE players
(
  player_id NUMBER,
  group_id NUMBER,
  CONSTRAINT pk_players PRIMARY KEY(player_id)
);

CREATE TABLE matches
(
  match_id NUMBER,
  first_player NUMBER,
  second_player NUMBER,
  first_score NUMBER,
  second_score NUMBER,
  CONSTRAINT pk_matches PRIMARY KEY(match_id)
);

INSERT INTO players VALUES(15, 1);
INSERT INTO players VALUES(25, 1);
INSERT INTO players VALUES(30, 1);
INSERT INTO players VALUES(45, 1);
INSERT INTO players VALUES(10, 2);
INSERT INTO players VALUES(35, 2);
INSERT INTO players VALUES(50, 2);
INSERT INTO players VALUES(20, 3);
INSERT INTO players VALUES(40, 3);

INSERT INTO matches VALUES(1, 15, 45, 3, 0);
INSERT INTO matches VALUES(2, 30, 25, 1, 2);
INSERT INTO matches VALUES(3, 30, 15, 2, 0);
INSERT INTO matches VALUES(4, 40, 20, 5, 2);
INSERT INTO matches VALUES(5, 35, 50, 1, 1);



--drop tables

DROP TABLE players;
DROP TABLE matches;


--Q94:

CREATE TABLE student
(
  student_id NUMBER,
  student_name VARCHAR(25),
  CONSTRAINT pk_student PRIMARY KEY(student_id)
);

CREATE TABLE exam
(
  exam_id NUMBER,
  student_id NUMBER,
  score NUMBER,
  CONSTRAINT pk_exam PRIMARY KEY(exam_id, student_id)
);

INSERT INTO student VALUES(1, 'Daniel');
INSERT INTO student VALUES(2, 'Jade');
INSERT INTO student VALUES(3, 'Stella');
INSERT INTO student VALUES(4, 'Jonathan');
INSERT INTO student VALUES(5, 'Will');

INSERT INTO exam VALUES(10, 1, 70);
INSERT INTO exam VALUES(10, 2, 80);
INSERT INTO exam VALUES(10, 3, 90);
INSERT INTO exam VALUES(20, 1, 80);
INSERT INTO exam VALUES(30, 1, 70);
INSERT INTO exam VALUES(30, 3, 80);
INSERT INTO exam VALUES(30, 4, 90);
INSERT INTO exam VALUES(40, 1, 60);
INSERT INTO exam VALUES(40, 2, 70);
INSERT INTO exam VALUES(40, 4, 80);



--drop tables

DROP TABLE student;
DROP TABLE exam;


--Q95:

CREATE TABLE student
(
  student_id NUMBER,
  student_name VARCHAR(25),
  CONSTRAINT pk_student PRIMARY KEY(student_id)
);

CREATE TABLE exam
(
  exam_id NUMBER,
  student_id NUMBER,
  score NUMBER,
  CONSTRAINT pk_exam PRIMARY KEY(exam_id, student_id)
);

INSERT INTO student VALUES(1, 'Daniel');
INSERT INTO student VALUES(2, 'Jade');
INSERT INTO student VALUES(3, 'Stella');
INSERT INTO student VALUES(4, 'Jonathan');
INSERT INTO student VALUES(5, 'Will');

INSERT INTO exam VALUES(10, 1, 70);
INSERT INTO exam VALUES(10, 2, 80);
INSERT INTO exam VALUES(10, 3, 90);
INSERT INTO exam VALUES(20, 1, 80);
INSERT INTO exam VALUES(30, 1, 70);
INSERT INTO exam VALUES(30, 3, 80);
INSERT INTO exam VALUES(30, 4, 90);
INSERT INTO exam VALUES(40, 1, 60);
INSERT INTO exam VALUES(40, 2, 70);
INSERT INTO exam VALUES(40, 4, 80);


--drop tables

DROP TABLE student;
DROP TABLE exam;


--Q96:

CREATE TABLE songs_history
(
  history_id NUMBER,
  user_id NUMBER,
  song_id NUMBER,
  song_plays NUMBER
);

CREATE TABLE songs_weekly
(
  user_id NUMBER,
  song_id NUMBER,
  listen_time TIMESTAMP
);

INSERT INTO songs_history VALUES(10011, 777, 1238, 11);
INSERT INTO songs_history VALUES(12452, 695, 4520, 1);

INSERT INTO songs_weekly VALUES(777, 1238, TIMESTAMP '2022-08-01 12:00:00');
INSERT INTO songs_weekly VALUES(695, 4520, TIMESTAMP '2022-08-04 08:00:00');
INSERT INTO songs_weekly VALUES(125, 9630, TIMESTAMP '2022-08-04 16:00:00');
INSERT INTO songs_weekly VALUES(695, 9852, TIMESTAMP '2022-08-07 12:00:00');



--drop tables

DROP TABLE songs_history;
DROP TABLE songs_weekly;


--Q97:

CREATE TABLE emails
(
  email_id NUMBER,
  user_id NUMBER,
  signup_date TIMESTAMP
);

CREATE TABLE texts
(
  text_id NUMBER,
  email_id NUMBER,
  signup_action VARCHAR(20)
);

INSERT INTO emails VALUES(125, 7771, TO_TIMESTAMP('06/14/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO emails VALUES(236, 6950, TO_TIMESTAMP('07/01/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO emails VALUES(433, 1052, TO_TIMESTAMP('07/09/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));


INSERT INTO texts VALUES(6878, 125, 'Confirmed');
INSERT INTO texts VALUES(6920, 236, 'Not Confirmed');
INSERT INTO texts VALUES(6994, 236, 'Confirmed');



--drop tables

DROP TABLE emails;
DROP TABLE texts;


--Q98:

CREATE TABLE tweets
(
  tweet_id NUMBER,
  user_id NUMBER,
  tweet_date TIMESTAMP
);


INSERT INTO tweets VALUES(214252, 111, TO_TIMESTAMP('06/01/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO tweets VALUES(739252, 111, TO_TIMESTAMP('06/01/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO tweets VALUES(846402, 111, TO_TIMESTAMP('06/02/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO tweets VALUES(241425, 254, TO_TIMESTAMP('06/02/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO tweets VALUES(137374, 111, TO_TIMESTAMP('06/04/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));





--drop tables

DROP TABLE tweets;


--Q99:

CREATE TABLE activities
(
  activity_id NUMBER,
  user_id NUMBER,
  activity_type VARCHAR(10),
  time_spent DECIMAL(5,2),
  activity_date TIMESTAMP
);

CREATE TABLE age_breakdown
(
  user_id NUMBER,
  age_bucket VARCHAR(10)
);

INSERT INTO activities VALUES(7274, 123, 'open', 4.50, TO_TIMESTAMP('06/22/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO activities VALUES(2425, 123, 'send', 3.50, TO_TIMESTAMP('06/22/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO activities VALUES(1413, 456, 'send', 5.67, TO_TIMESTAMP('06/23/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO activities VALUES(1414, 789, 'chat', 11.00, TO_TIMESTAMP('06/25/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO activities VALUES(2536, 456, 'open', 3.00, TO_TIMESTAMP('06/25/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));


INSERT INTO age_breakdown VALUES(123, '31-35');
INSERT INTO age_breakdown VALUES(456, '26-30');
INSERT INTO age_breakdown VALUES(789, '21-25');



--drop tables

DROP TABLE activities;
DROP TABLE age_breakdown;


--Q100:

CREATE TABLE personal_profiles
(
  profile_id NUMBER,
  name VARCHAR(30),
  followers NUMBER
);

CREATE TABLE employee_company
(
  personal_profile_id NUMBER,
  company_id NUMBER
);

CREATE TABLE company_pages
(
  company_id NUMBER,
  name VARCHAR(30),
  followers NUMBER
);

INSERT INTO personal_profiles VALUES(1, 'Nick Singh', 92000);
INSERT INTO personal_profiles VALUES(2, 'Zach Wilson', 199000);
INSERT INTO personal_profiles VALUES(3, 'Daliana Liu', 171000);
INSERT INTO personal_profiles VALUES(4, 'Ravit Jain', 107000);
INSERT INTO personal_profiles VALUES(5, 'Vin Vashishta', 139000);
INSERT INTO personal_profiles VALUES(6, 'Susan Wojcicki', 39000);

INSERT INTO employee_company VALUES(1, 4);
INSERT INTO employee_company VALUES(1, 9);
INSERT INTO employee_company VALUES(2, 2);
INSERT INTO employee_company VALUES(3, 1);
INSERT INTO employee_company VALUES(4, 3);
INSERT INTO employee_company VALUES(5, 6);
INSERT INTO employee_company VALUES(6, 5);

INSERT INTO company_pages VALUES(1 , 'The Data Science Podcast', 8000);
INSERT INTO company_pages VALUES(2, 'Airbnb', 700000);
INSERT INTO company_pages VALUES(3, 'The Ravit Show', 6000);
INSERT INTO company_pages VALUES(4, 'DataLemur', 200);
INSERT INTO company_pages VALUES(5, 'YouTube', 16000000);
INSERT INTO company_pages VALUES(6, 'DataScience.Vin', 4500);
INSERT INTO company_pages VALUES(9, 'Ace The Data Science Interview', 4479);



--drop tables

DROP TABLE personal_profiles;
DROP TABLE employee_company;
DROP TABLE company_pages;
















