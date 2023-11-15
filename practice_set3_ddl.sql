--Q101:

CREATE TABLE user_activity
(
  username VARCHAR(25),
  activity VARCHAR(25),
  start_date DATE,
  end_date DATE
);

INSERT INTO user_activity VALUES('Alice', 'Travel', TO_DATE('2020-02-12', 'YYYY-MM-DD'), TO_DATE('2020-02-20', 'YYYY-MM-DD'));
INSERT INTO user_activity VALUES('Alice', 'Dancing', TO_DATE('2020-02-21', 'YYYY-MM-DD'), TO_DATE('2020-02-23', 'YYYY-MM-DD'));
INSERT INTO user_activity VALUES('Alice', 'Travel', TO_DATE('2020-02-24', 'YYYY-MM-DD'), TO_DATE('2020-02-28', 'YYYY-MM-DD'));
INSERT INTO user_activity VALUES('Bob', 'Travel', TO_DATE('2020-02-11', 'YYYY-MM-DD'), TO_DATE('2020-02-18', 'YYYY-MM-DD'));




--drop tables

DROP TABLE user_activity;


--Q102:
  
CREATE TABLE user_activity
(
  username VARCHAR(25),
  activity VARCHAR(25),
  start_date DATE,
  end_date DATE
);

INSERT INTO user_activity VALUES('Alice', 'Travel', '2020-02-12', '2020-02-20');
INSERT INTO user_activity VALUES('Alice', 'Dancing', '2020-02-21', '2020-02-23');
INSERT INTO user_activity VALUES('Alice', 'Travel', '2020-02-24', '2020-02-28');
INSERT INTO user_activity VALUES('Bob', 'Travel', '2020-02-11', '2020-02-18');



--drop tables

DROP TABLE user_activity;


--Q103:

CREATE TABLE students
(
  id INT,
  name VARCHAR(25),
  marks INT,
  CONSTRAINT pk_students PRIMARY KEY(id)
);

INSERT INTO students VALUES(1, 'Ashley', 81);
INSERT INTO students VALUES(2, 'Samantha', 75);
INSERT INTO students VALUES(4, 'Julia', 76);
INSERT INTO students VALUES(3, 'Belvet', 84);



--drop tables

DROP TABLE students;


--Q104:

CREATE TABLE employee
(
  employee_id INT,
  name VARCHAR(25),
  months INT,
  salary INT,
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


--Q105:

CREATE TABLE triangles
(
  a INT,
  b INT,
  c INT
);


INSERT INTO triangles VALUES(20, 20, 23);
INSERT INTO triangles VALUES(20, 20, 20);
INSERT INTO triangles VALUES(20, 21, 22);
INSERT INTO triangles VALUES(13, 14, 30);



--drop tables

DROP TABLE triangles;


--Q106:

CREATE TABLE employees
(
  id INT,
  name VARCHAR(25),
  salary INT
);

INSERT INTO employees VALUES(1, 'Kristeen', 1420);
INSERT INTO employees VALUES(2, 'Ashley', 2006);
INSERT INTO employees VALUES(3, 'Julia', 2210);
INSERT INTO employees VALUES(4, 'Maria', 3000);


--drop tables

DROP TABLE employees;


--Q107:

CREATE TABLE employee
(
  employee_id INT,
  name VARCHAR(25),
  months INT,
  salary INT
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


--Q108:

CREATE TABLE occupations
(
  name VARCHAR(25),
  occupation VARCHAR(25)
);

INSERT INTO occupations VALUES('Samantha', 'Doctor');
INSERT INTO occupations VALUES('Julia', 'Actor');
INSERT INTO occupations VALUES('Maria', 'Actor');
INSERT INTO occupations VALUES('Meera', 'Singer');
INSERT INTO occupations VALUES('Ashely', 'Professor');
INSERT INTO occupations VALUES('Ketty', 'Professor');
INSERT INTO occupations VALUES('Christeen', 'Professor');
INSERT INTO occupations VALUES('Jane', 'Actor');
INSERT INTO occupations VALUES('Jenny', 'Doctor');
INSERT INTO occupations VALUES('Priya', 'Singer');



--drop tables

DROP TABLE occupations;


--Q109:

CREATE TABLE occupations
(
  name VARCHAR(25),
  occupation VARCHAR(25)
);

INSERT INTO occupations VALUES('Samantha', 'Doctor');
INSERT INTO occupations VALUES('Julia', 'Actor');
INSERT INTO occupations VALUES('Maria', 'Actor');
INSERT INTO occupations VALUES('Meera', 'Singer');
INSERT INTO occupations VALUES('Ashely', 'Professor');
INSERT INTO occupations VALUES('Ketty', 'Professor');
INSERT INTO occupations VALUES('Christeen', 'Professor');
INSERT INTO occupations VALUES('Jane', 'Actor');
INSERT INTO occupations VALUES('Jenny', 'Doctor');
INSERT INTO occupations VALUES('Priya', 'Singer');



--drop tables

DROP TABLE occupations;


--Q110:

CREATE TABLE bst
(
  n INT,
  p INT
);

INSERT INTO bst VALUES(1, 2);
INSERT INTO bst VALUES(3, 2);
INSERT INTO bst VALUES(6, 8);
INSERT INTO bst VALUES(9, 8);
INSERT INTO bst VALUES(2, 5);
INSERT INTO bst VALUES(8, 5);
INSERT INTO bst VALUES(5, null);




--drop tables

DROP TABLE bst;


--Q111:

CREATE TABLE company
(
  company_code VARCHAR(25),
  founder VARCHAR(25)
);

CREATE TABLE lead_manager
(
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

CREATE TABLE senior_manager
(
  senior_manager_code VARCHAR(25),
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

CREATE TABLE manager
(
  manager_code VARCHAR(25),
  senior_manager_code VARCHAR(25),
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

CREATE TABLE employee
(
  employee_code VARCHAR(25),
  manager_code VARCHAR(25),
  senior_manager_code VARCHAR(25),
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

INSERT INTO company VALUES('C1', 'Monika');
INSERT INTO company VALUES('C2', 'Samantha');

INSERT INTO lead_manager VALUES('LM1', 'C1');
INSERT INTO lead_manager VALUES('LM2', 'C2');

INSERT INTO senior_manager VALUES('SM1', 'LM1', 'C1');
INSERT INTO senior_manager VALUES('SM2', 'LM1', 'C1');
INSERT INTO senior_manager VALUES('SM3', 'LM2', 'C2');

INSERT INTO manager VALUES('M1', 'SM1', 'LM1', 'C1');
INSERT INTO manager VALUES('M2', 'SM3', 'LM2', 'C2');
INSERT INTO manager VALUES('M3', 'SM3', 'LM2', 'C2');

INSERT INTO employee VALUES('E1', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO employee VALUES('E2', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO employee VALUES('E3', 'M2', 'SM3', 'LM2', 'C2');
INSERT INTO employee VALUES('E4', 'M3', 'SM3', 'LM2', 'C2');




--drop tables

DROP TABLE company;
DROP TABLE lead_manager;
DROP TABLE senior_manager;
DROP TABLE manager;
DROP TABLE employee;


--Q112:




--Q113:



--print in single row



--Q114:



--print in single row





--Q115:

CREATE TABLE students
(
  id INT,
  name VARCHAR(25),
  marks INT,
  CONSTRAINT pk_students PRIMARY KEY(id)
);

INSERT INTO students VALUES(1, 'Ashley', 81);
INSERT INTO students VALUES(2, 'Samantha', 75);
INSERT INTO students VALUES(4, 'Julia', 76);
INSERT INTO students VALUES(3, 'Belvet', 84);



--drop tables

DROP TABLE students;


--Q116:

CREATE TABLE functions
(
  x INT,
  y INT
);

INSERT INTO functions VALUES(20, 20);
INSERT INTO functions VALUES(20, 20);
INSERT INTO functions VALUES(20, 21);
INSERT INTO functions VALUES(23, 22);
INSERT INTO functions VALUES(22, 23);
INSERT INTO functions VALUES(21, 20);



--drop tables

DROP TABLE functions;


--Q116:

CREATE TABLE employee
(
  employee_id INT,
  name VARCHAR(25),
  months INT,
  salary INT,
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


--Q117:

CREATE TABLE employee
(
  employee_id INT,
  name VARCHAR(25),
  months INT,
  salary INT,
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


--Q118:

CREATE TABLE triangles
(
  a INT,
  b INT,
  c INT
);


INSERT INTO triangles VALUES(20, 20, 23);
INSERT INTO triangles VALUES(20, 20, 20);
INSERT INTO triangles VALUES(20, 21, 22);
INSERT INTO triangles VALUES(13, 14, 30);



--drop tables

DROP TABLE triangles;


--Q119:

CREATE TABLE user_transactions
(
  transaction_id INT,
  product_id INT,
  spend DECIMAL(10,2),
  transaction_date DATE
);


INSERT INTO user_transactions VALUES(1341, 123424, 1500.60, '2019-12-31');
INSERT INTO user_transactions VALUES(1423, 123424, 1000.20, '2020-12-31');
INSERT INTO user_transactions VALUES(1623, 123424, 1246.44, '2021-12-31');
INSERT INTO user_transactions VALUES(1322, 123424, 2145.32, '2022-12-31');




--drop tables

DROP TABLE user_transactions;


--Q120:

CREATE TABLE inventory
(
  item_id INT,
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


--Q121:

CREATE TABLE user_actions
(
  user_id INT,
  event_id INT,
  event_type VARCHAR(20),
  event_date DATE
);

INSERT INTO user_actions VALUES(445, 7765 , 'sign-in', '2022-05-31');
INSERT INTO user_actions VALUES(742, 6458, 'sign-in', '2022-06-03');
INSERT INTO user_actions VALUES(445, 3634, 'like', '2022-06-05');
INSERT INTO user_actions VALUES(742, 1374, 'comment', '2022-06-05');
INSERT INTO user_actions VALUES(648, 3124, 'like', '2022-06-18');



--drop tables

DROP TABLE user_actions;


--Q122:

CREATE TABLE search_frequency
(
  searches INT,
  num_users INT
);

INSERT INTO search_frequency VALUES(1, 2);
INSERT INTO search_frequency VALUES(2, 2);
INSERT INTO search_frequency VALUES(3, 3);
INSERT INTO search_frequency VALUES(4, 1);


--drop tables

DROP TABLE search_frequency;


--Q123:

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


--Q124:

CREATE TABLE server_utilization
(
  server_id INT,
  status_time TIMESTAMP,
  session_status VARCHAR(10)
);

INSERT INTO server_utilization VALUES(1, '2022-08-02 10:00:00', 'start');
INSERT INTO server_utilization VALUES(1, '2022-08-04 10:00:00', 'stop');
INSERT INTO server_utilization VALUES(2, '2022-08-17 10:00:00', 'start');
INSERT INTO server_utilization VALUES(2, '2022-08-24 10:00:00', 'stop');



--drop tables

DROP TABLE server_utilization;


--Q125:

CREATE TABLE transactions
(
  transaction_id INT,
  merchant_id INT,
  credit_card_id INT,
  amount INT,
  transaction_timestamp TIMESTAMP
);

INSERT INTO transactions VALUES(1, 101, 1, 100, '2022-09-25 12:00:00');
INSERT INTO transactions VALUES(2, 101, 1, 100, '2022-09-25 12:08:00');
INSERT INTO transactions VALUES(3, 101, 1, 100, '2022-09-25 12:28:00');
INSERT INTO transactions VALUES(4, 102, 2, 300, '2022-09-25 12:00:00');
INSERT INTO transactions VALUES(5, 102, 2, 400, '2022-09-25 14:00:00');



--drop tables

DROP TABLE transactions;


--Q126:

CREATE TABLE orders
(
  order_id INT,
  customer_id INT,
  trip_id INT,
  status VARCHAR(30),
  order_timestamp TIMESTAMP
);

CREATE TABLE trips
(
  dasher_id INT,
  trip_id INT,
  estimated_delivery_timestamp TIMESTAMP,
  actual_delivery_timestamp TIMESTAMP
);

CREATE TABLE customers
(
  customer_id INT,
  signup_timestamp TIMESTAMP
);

INSERT INTO orders VALUES(727424,8472, 100463, 'completed successfully', '2022-06-05 09:12:00');
INSERT INTO orders VALUES(242513, 2341, 100482, 'completed incorrectly', '2022-06-05 14:40:00');
INSERT INTO orders VALUES(141367, 1314, 100362, 'completed incorrectly', '2022-06-07 15:03:00');
INSERT INTO orders VALUES(582193, 5421, 100657, 'never_received', '2022-07-07 15:22:00');
INSERT INTO orders VALUES(253613, 1314, 100213, 'completed successfully', '2022-06-12 13:43:00');

INSERT INTO trips VALUES(101, 100463, '2022-06-05 09:42:00', '2022-06-05 09:38:00');
INSERT INTO trips VALUES(102, 100482, '2022-06-05 15:10:00', '2022-06-05 15:46:00');
INSERT INTO trips VALUES(101, 100362, '2022-06-07 15:33:00', '2022-06-07 16:45:00');
INSERT INTO trips VALUES(102, 100657, '2022-07-07 15:52:00',null);
INSERT INTO trips VALUES(103, 100213, '2022-06-12 14:13:00', '2022-06-12 14:10:00');

INSERT INTO customers VALUES(8472, '2022-05-30 00:00:00');
INSERT INTO customers VALUES(2341, '2022-06-01 00:00:00');
INSERT INTO customers VALUES(1314, '2022-06-03 00:00:00');
INSERT INTO customers VALUES(1435, '2022-06-05 00:00:00');
INSERT INTO customers VALUES(5421, '2022-06-07 00:00:00');



--drop tables

DROP TABLE customers;
DROP TABLE trips;
DROP TABLE orders;

--Q127:

CREATE TABLE scores
(
  player_name VARCHAR(25),
  gender VARCHAR(1),
  day DATE,
  score_points INT,
  CONSTRAINT pk_scores PRIMARY KEY (gender, day)
);

INSERT INTO scores VALUES('Aron', 'F', '2020-01-01', 17);
INSERT INTO scores VALUES('Alice', 'F', '2020-01-07', 23);
INSERT INTO scores VALUES('Bajrang', 'M', '2020-01-07', 7);
INSERT INTO scores VALUES('Khali' , 'M', '2019-12-25', 11);
INSERT INTO scores VALUES('Slaman', 'M', '2019-12-30', 13);
INSERT INTO scores VALUES('Joe', 'M', '2019-12-31', 3);
INSERT INTO scores VALUES('Jose', 'M', '2019-12-18', 2);
INSERT INTO scores VALUES('Priya', 'F', '2019-12-31', 23);
INSERT INTO scores VALUES('Priyanka', 'F', '2019-12-30', 17);


--drop tables

DROP TABLE scores;


--Q128:

CREATE TABLE person
(
  id INT,
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
  caller_id INT,
  callee_id INT,
  duration INT
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

DROP TABLE calls;
DROP TABLE country;
DROP TABLE person;


--Q129:

CREATE TABLE numbers
(
  num INT,
  frequency INT
);

INSERT INTO numbers VALUES(0, 7);
INSERT INTO numbers VALUES(1, 1);
INSERT INTO numbers VALUES(2, 3);
INSERT INTO numbers VALUES(3, 1);



--drop tables

DROP TABLE numbers;


--Q130:

CREATE TABLE employee
(
  employee_id INT,
  department_id INT,
  CONSTRAINT pk_employee PRIMARY KEY(employee_id)
);

CREATE TABLE salary
(
  id INT,
  employee_id INT,
  amount INT,
  pay_date DATE,
  CONSTRAINT pk_salary PRIMARY KEY(id),
  CONSTRAINT fk_employee FOREIGN KEY(employee_id)
    REFERENCES employee(employee_id)
);

INSERT INTO employee VALUES(1, 1);
INSERT INTO employee VALUES(2, 2);
INSERT INTO employee VALUES(3, 2);

INSERT INTO salary VALUES(1, 1, 9000, '2017-03-31');
INSERT INTO salary VALUES(2, 2, 6000, '2017-03-31');
INSERT INTO salary VALUES(3, 3, 10000, '2017-03-31');
INSERT INTO salary VALUES(4, 1, 7000, '2017-02-28');
INSERT INTO salary VALUES(5, 2, 6000, '2017-02-28');
INSERT INTO salary VALUES(6, 3, 8000, '2017-02-28');



--drop tables

DROP TABLE salary;
DROP TABLE employee;


--Q131:

CREATE TABLE activity
(
  player_id INT,
  device_id INT,
  event_date DATE,
  games_played INT,
  CONSTRAINT pk_activity PRIMARY KEY(player_id, event_date)
);

INSERT INTO activity VALUES(1, 2, '2016-03-01', 5);
INSERT INTO activity VALUES(1, 2, '2016-03-02', 6);
INSERT INTO activity VALUES(2, 3, '2017-06-25', 1);
INSERT INTO activity VALUES(3, 1, '2016-03-01', 0);
INSERT INTO activity VALUES(3, 4, '2016-07-03', 5);



--drop tables

DROP TABLE activity;


--Q132:

CREATE TABLE players
(
  player_id INT,
  group_id INT,
  CONSTRAINT pk_players PRIMARY KEY(player_id)
);

CREATE TABLE matches
(
  match_id INT,
  first_player INT,
  second_player INT,
  first_score INT,
  second_score INT,
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


--Q133:

CREATE TABLE student
(
  student_id INT,
  student_name VARCHAR(25),
  CONSTRAINT pk_student PRIMARY KEY(student_id)
);

CREATE TABLE exam
(
  exam_id INT,
  student_id INT,
  score INT,
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


--Q134:

CREATE TABLE student
(
  student_id INT,
  student_name VARCHAR(25),
  CONSTRAINT pk_student PRIMARY KEY(student_id)
);

CREATE TABLE exam
(
  exam_id INT,
  student_id INT,
  score INT,
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


--Q135:

CREATE TABLE user_activity
(
  username VARCHAR(25),
  activity VARCHAR(25),
  start_date DATE,
  end_date DATE
);

INSERT INTO user_activity VALUES('Alice', 'Travel', '2020-02-12', '2020-02-20');
INSERT INTO user_activity VALUES('Alice', 'Dancing', '2020-02-21', '2020-02-23');
INSERT INTO user_activity VALUES('Alice', 'Travel', '2020-02-24', '2020-02-28');
INSERT INTO user_activity VALUES('Bob', 'Travel', '2020-02-11', '2020-02-18');


--drop tables

DROP TABLE user_activity;


--Q136:

CREATE TABLE user_activity
(
  username VARCHAR(25),
  activity VARCHAR(25),
  start_date DATE,
  end_date DATE
);

INSERT INTO user_activity VALUES('Alice', 'Travel', '2020-02-12', '2020-02-20');
INSERT INTO user_activity VALUES('Alice', 'Dancing', '2020-02-21', '2020-02-23');
INSERT INTO user_activity VALUES('Alice', 'Travel', '2020-02-24', '2020-02-28');
INSERT INTO user_activity VALUES('Bob', 'Travel', '2020-02-11', '2020-02-18');



--drop tables

DROP TABLE user_activity;


--Q137:

CREATE TABLE employees
(
  id INT,
  name VARCHAR(25),
  salary INT
);

INSERT INTO employees VALUES(1, 'Kristeen', 1420);
INSERT INTO employees VALUES(2, 'Ashley', 2006);
INSERT INTO employees VALUES(3, 'Julia', 2210);
INSERT INTO employees VALUES(4, 'Maria', 3000);


--drop tables

DROP TABLE employees;


--Q138:

CREATE TABLE employee
(
  employee_id INT,
  name VARCHAR(25),
  months INT,
  salary INT
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


--Q139:

CREATE TABLE occupations
(
  name VARCHAR(25),
  occupation VARCHAR(25)
);

INSERT INTO occupations VALUES('Samantha', 'Doctor');
INSERT INTO occupations VALUES('Julia', 'Actor');
INSERT INTO occupations VALUES('Maria', 'Actor');
INSERT INTO occupations VALUES('Meera', 'Singer');
INSERT INTO occupations VALUES('Ashely', 'Professor');
INSERT INTO occupations VALUES('Ketty', 'Professor');
INSERT INTO occupations VALUES('Christeen', 'Professor');
INSERT INTO occupations VALUES('Jane', 'Actor');
INSERT INTO occupations VALUES('Jenny', 'Doctor');
INSERT INTO occupations VALUES('Priya', 'Singer');


--drop tables

DROP TABLE occupations;

--Q140:

CREATE TABLE occupations
(
  name VARCHAR(25),
  occupation VARCHAR(25)
);

INSERT INTO occupations VALUES('Samantha', 'Doctor');
INSERT INTO occupations VALUES('Julia', 'Actor');
INSERT INTO occupations VALUES('Maria', 'Actor');
INSERT INTO occupations VALUES('Meera', 'Singer');
INSERT INTO occupations VALUES('Ashely', 'Professor');
INSERT INTO occupations VALUES('Ketty', 'Professor');
INSERT INTO occupations VALUES('Christeen', 'Professor');
INSERT INTO occupations VALUES('Jane', 'Actor');
INSERT INTO occupations VALUES('Jenny', 'Doctor');
INSERT INTO occupations VALUES('Priya', 'Singer');



--drop tables

DROP TABLE occupations;

--Q141:

CREATE TABLE bst
(
  n INT,
  p INT
);

INSERT INTO bst VALUES(1, 2);
INSERT INTO bst VALUES(3, 2);
INSERT INTO bst VALUES(6, 8);
INSERT INTO bst VALUES(9, 8);
INSERT INTO bst VALUES(2, 5);
INSERT INTO bst VALUES(8, 5);
INSERT INTO bst VALUES(5, null);



--drop tables

DROP TABLE bst;


--Q142:

CREATE TABLE company
(
  company_code VARCHAR(25),
  founder VARCHAR(25)
);

CREATE TABLE lead_manager
(
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

CREATE TABLE senior_manager
(
  senior_manager_code VARCHAR(25),
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

CREATE TABLE manager
(
  manager_code VARCHAR(25),
  senior_manager_code VARCHAR(25),
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

CREATE TABLE employee
(
  employee_code VARCHAR(25),
  manager_code VARCHAR(25),
  senior_manager_code VARCHAR(25),
  lead_manager_code VARCHAR(25),
  company_code VARCHAR(25)
);

INSERT INTO company VALUES('C1', 'Monika');
INSERT INTO company VALUES('C2', 'Samantha');

INSERT INTO lead_manager VALUES('LM1', 'C1');
INSERT INTO lead_manager VALUES('LM2', 'C2');

INSERT INTO senior_manager VALUES('SM1', 'LM1', 'C1');
INSERT INTO senior_manager VALUES('SM2', 'LM1', 'C1');
INSERT INTO senior_manager VALUES('SM3', 'LM2', 'C2');

INSERT INTO manager VALUES('M1', 'SM1', 'LM1', 'C1');
INSERT INTO manager VALUES('M2', 'SM3', 'LM2', 'C2');
INSERT INTO manager VALUES('M3', 'SM3', 'LM2', 'C2');

INSERT INTO employee VALUES('E1', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO employee VALUES('E2', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO employee VALUES('E3', 'M2', 'SM3', 'LM2', 'C2');
INSERT INTO employee VALUES('E4', 'M3', 'SM3', 'LM2', 'C2');



--drop tables

DROP TABLE company;
DROP TABLE lead_manager;
DROP TABLE senior_manager;
DROP TABLE manager;
DROP TABLE employee;

--Q143:

CREATE TABLE functions
(
  x INT,
  y INT
);

INSERT INTO functions VALUES(20, 20);
INSERT INTO functions VALUES(20, 20);
INSERT INTO functions VALUES(20, 21);
INSERT INTO functions VALUES(23, 22);
INSERT INTO functions VALUES(22, 23);
INSERT INTO functions VALUES(21, 20);



--drop tables

DROP TABLE functions;


--Q144:

CREATE TABLE students
(
  id INT,
  name VARCHAR(25)
);

CREATE TABLE friends
(
  id INT,
  friend_id INT
);

CREATE TABLE packages
(
  id INT,
  salary DECIMAL(10, 2)
);

INSERT INTO students VALUES(1, 'Ashley');
INSERT INTO students VALUES(2, 'Samantha');
INSERT INTO students VALUES(3, 'Julia');
INSERT INTO students VALUES(4, 'Scarlet');

INSERT INTO friends VALUES(1, 2);
INSERT INTO friends VALUES(2, 3);
INSERT INTO friends VALUES(3, 4);
INSERT INTO friends VALUES(4, 1);

INSERT INTO packages VALUES(1, 15.20);
INSERT INTO packages VALUES(2, 10.06);
INSERT INTO packages VALUES(3, 11.55);
INSERT INTO packages VALUES(4, 12.12);



--drop tables

DROP TABLE students;
DROP TABLE friends;
DROP TABLE packages;


--Q145:

CREATE TABLE hackers
(
  hacker_id INT,
  name VARCHAR(25)
);

CREATE TABLE difficulty
(
  difficulty_level INT,
  score INT
);

CREATE TABLE challenges
(
  challenge_id INT,
  hacker_id INT,
  difficulty_level INT
);

CREATE TABLE submissions
(
  submission_id INT,
  hacker_id INT,
  challenge_id INT,
  score INT
);

INSERT INTO hackers VALUES(5580, 'Rose');
INSERT INTO hackers VALUES(8439, 'Angela');
INSERT INTO hackers VALUES(27205, 'Frank');
INSERT INTO hackers VALUES(52243, 'Patrick');
INSERT INTO hackers VALUES(52348, 'Lisa');
INSERT INTO hackers VALUES(57645, 'Kimberly');
INSERT INTO hackers VALUES(77726, 'Bonnie');
INSERT INTO hackers VALUES(83082, 'Michael');
INSERT INTO hackers VALUES(86870, 'Todd');
INSERT INTO hackers VALUES(90411, 'Joe');

INSERT INTO difficulty VALUES(1, 20);
INSERT INTO difficulty VALUES(2, 30);
INSERT INTO difficulty VALUES(3, 40);
INSERT INTO difficulty VALUES(4, 60);
INSERT INTO difficulty VALUES(5, 80);
INSERT INTO difficulty VALUES(6, 100);
INSERT INTO difficulty VALUES(7, 120);

INSERT INTO challenges VALUES(4810, 77726, 4);
INSERT INTO challenges VALUES(21089, 27205, 1);
INSERT INTO challenges VALUES(36566, 5580, 7);
INSERT INTO challenges VALUES(66730, 52243, 6);
INSERT INTO challenges VALUES(71055, 52243, 2);

INSERT INTO submissions VALUES(68628, 77726, 36566, 30);
INSERT INTO submissions VALUES(65300, 77726, 21089, 10);
INSERT INTO submissions VALUES(40326, 52243, 36566, 77);
INSERT INTO submissions VALUES(8941, 27205, 4810, 4);
INSERT INTO submissions VALUES(83554, 77726, 66730, 30);
INSERT INTO submissions VALUES(43353, 52243, 66730, 0);
INSERT INTO submissions VALUES(55385, 52348, 71055, 20);
INSERT INTO submissions VALUES(39784, 27205, 71055, 23);
INSERT INTO submissions VALUES(94613, 86870, 71055, 30);
INSERT INTO submissions VALUES(45788, 52348, 36566, 0);
INSERT INTO submissions VALUES(93058, 86870, 36566, 30);
INSERT INTO submissions VALUES(7344, 8439, 66730, 92);
INSERT INTO submissions VALUES(2721, 8439, 4810, 36);
INSERT INTO submissions VALUES(523, 5580, 71055, 4);
INSERT INTO submissions VALUES(49105, 52348, 66730, 0);
INSERT INTO submissions VALUES(55877, 57645, 66730, 80);
INSERT INTO submissions VALUES(38355, 27205, 66730, 35);
INSERT INTO submissions VALUES(3924, 8439, 36566, 80);
INSERT INTO submissions VALUES(97397, 90411, 66730, 100);
INSERT INTO submissions VALUES(84162, 83082, 4810, 40);
INSERT INTO submissions VALUES(97431, 90411, 71055, 30);



--drop tables

DROP TABLE hackers;
DROP TABLE difficulty;
DROP TABLE challenges;
DROP TABLE submissions;


--Q146:

CREATE TABLE projects
(
  task_id INT,
  start_date DATE,
  end_date DATE
);

INSERT INTO projects VALUES(1, TO_DATE('2015-10-01', 'YYYY-MM-DD'), TO_DATE('2015-10-02', 'YYYY-MM-DD'));
INSERT INTO projects VALUES(1, TO_DATE('2015-10-02', 'YYYY-MM-DD'), TO_DATE('2015-10-03', 'YYYY-MM-DD'));
INSERT INTO projects VALUES(1, TO_DATE('2015-10-03', 'YYYY-MM-DD'), TO_DATE('2015-10-04', 'YYYY-MM-DD'));
INSERT INTO projects VALUES(1, TO_DATE('2015-10-13', 'YYYY-MM-DD'), TO_DATE('2015-10-14', 'YYYY-MM-DD'));
INSERT INTO projects VALUES(1, TO_DATE('2015-10-14', 'YYYY-MM-DD'), TO_DATE('2015-10-15', 'YYYY-MM-DD'));
INSERT INTO projects VALUES(1, TO_DATE('2015-10-28', 'YYYY-MM-DD'), TO_DATE('2015-10-29', 'YYYY-MM-DD'));
INSERT INTO projects VALUES(1, TO_DATE('2015-10-30', 'YYYY-MM-DD'), TO_DATE('2015-10-31', 'YYYY-MM-DD'));





--drop tables

DROP TABLE projects;


--Q147:

CREATE TABLE transactions
(
  user_id INT,
  amount DECIMAL(10,2),
  transaction_date TIMESTAMP
);

INSERT INTO transactions VALUES(1, '9.99', TO_TIMESTAMP('2022-08-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(1, '55', TO_TIMESTAMP('2022-08-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(2, '149.5', TO_TIMESTAMP('2022-08-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(2, '4.89', TO_TIMESTAMP('2022-08-06 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(2, '34', TO_TIMESTAMP('2022-08-07 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));



--drop tables

DROP TABLE transactions;


--Q148:

CREATE TABLE payments
(
  payer_id INT,
  recipient_id INT,
  amount INT
);

INSERT INTO payments VALUES(101, 201, 30);
INSERT INTO payments VALUES(201, 101, 10);
INSERT INTO payments VALUES(101, 301, 20);
INSERT INTO payments VALUES(301, 101, 80);
INSERT INTO payments VALUES(201, 301, 70);


--drop tables

DROP TABLE payments;


--Q149:

CREATE TABLE user_transactions
(
  transaction_id INT,
  user_id INT,
  spend DECIMAL(10,2),
  transaction_date TIMESTAMP
);

INSERT INTO user_transactions VALUES(759274, 111, 49.50, TO_TIMESTAMP('2022-02-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_transactions VALUES(850371, 111, 51.00, TO_TIMESTAMP('2022-03-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_transactions VALUES(615348, 145, 36.30, TO_TIMESTAMP('2022-03-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_transactions VALUES(137424, 156, 151.00, TO_TIMESTAMP('2022-04-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_transactions VALUES(248475, 156, 87.00, TO_TIMESTAMP('2022-02-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));




--drop tables

DROP TABLE user_transactions;


--Q150:

CREATE TABLE measurements
(
  measurement_id INT,
  measurement_value DECIMAL(10,2),
  measurement_time TIMESTAMP
);

INSERT INTO measurements VALUES(131233, 1109.51, TO_TIMESTAMP('2022-07-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO measurements VALUES(135211, 1662.74, TO_TIMESTAMP('2022-07-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO measurements VALUES(523542, 1246.24, TO_TIMESTAMP('2022-07-10 13:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO measurements VALUES(143562, 1124.50, TO_TIMESTAMP('2022-07-11 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO measurements VALUES(346462, 1234.14, TO_TIMESTAMP('2022-07-11 16:45:00', 'YYYY-MM-DD HH24:MI:SS'));





--drop tables

DROP TABLE measurements;


--Q151:

CREATE TABLE transactions
(
  user_id INT,
  amount DECIMAL(10,2),
  transaction_date TIMESTAMP
);

INSERT INTO transactions VALUES(1, '9.99', '2022-08-01 10:00:00');
INSERT INTO transactions VALUES(1, '55', '2022-08-17 10:00:00');
INSERT INTO transactions VALUES(1, '149.5', '2022-08-05 10:00:00');
INSERT INTO transactions VALUES(1, '4.89', '2022-08-06 10:00:00');
INSERT INTO transactions VALUES(1, '34', '2022-08-07 10:00:00');




--drop tables

DROP TABLE transactions;


--Q152:

CREATE TABLE rental_amenities
(
  rental_id INT,
  amenity VARCHAR(40)
);

INSERT INTO rental_amenities VALUES(123, 'pool');
INSERT INTO rental_amenities VALUES(123, 'kitchen');
INSERT INTO rental_amenities VALUES(234, 'hit tub');
INSERT INTO rental_amenities VALUES(234, 'fireplace');
INSERT INTO rental_amenities VALUES(345, 'kitchen');
INSERT INTO rental_amenities VALUES(345, 'pool');
INSERT INTO rental_amenities VALUES(456, 'pool');



--drop tables

DROP TABLE rental_amenities;


--Q153:

CREATE TABLE ad_campaigns
(
  campaign_id INT,
  spend INT,
  revenue DECIMAL(10,2),
  advertiser_id INT
);

INSERT INTO ad_campaigns VALUES(1, 5000, 7500, 3);
INSERT INTO ad_campaigns VALUES(2, 1000, 900, 1);
INSERT INTO ad_campaigns VALUES(3, 3000, 12000, 2);
INSERT INTO ad_campaigns VALUES(1, 500, 2000, 4);
INSERT INTO ad_campaigns VALUES(1, 100, 400, 4);


--drop tables

DROP TABLE ad_campaigns;


--Q154:

CREATE TABLE employee_pay
(
  employee_id INT,
  salary INT,
  title VARCHAR(40)
);

INSERT INTO employee_pay VALUES(101, 80000, 'Data Analyst');
INSERT INTO employee_pay VALUES(102, 90000, 'Data Analyst');
INSERT INTO employee_pay VALUES(103, 100000, 'Data Analyst');
INSERT INTO employee_pay VALUES(104, 30000, 'Data Analyst');
INSERT INTO employee_pay VALUES(105, 120000, 'Data Scientist');
INSERT INTO employee_pay VALUES(106, 100000, 'Data Scientist');
INSERT INTO employee_pay VALUES(107, 80000, 'Data Scientist');
INSERT INTO employee_pay VALUES(108, 310000, 'Data Scientist');



--drop tables

DROP TABLE employee_pay;


--Q155:

CREATE TABLE payments
(
  payer_id INT,
  recipient_id INT,
  amount INT
);

INSERT INTO payments VALUES(101, 201, 30);
INSERT INTO payments VALUES(201, 101, 10);
INSERT INTO payments VALUES(101, 301, 20);
INSERT INTO payments VALUES(301, 101, 80);
INSERT INTO payments VALUES(201, 301, 70);


--drop tables

DROP TABLE payments;


--Q156:

CREATE TABLE purchases
(
  user_id INT,
  product_id INT,
  quantity INT,
  purchase_date TIMESTAMP
);

INSERT INTO purchases VALUES(536, 3223, 6, TO_TIMESTAMP('2022-01-11 12:33:44', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO purchases VALUES(827, 3585, 35, TO_TIMESTAMP('2022-02-20 14:05:26', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO purchases VALUES(536, 3223, 5, TO_TIMESTAMP('2022-03-02 09:33:28', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO purchases VALUES(536, 1435, 10, TO_TIMESTAMP('2022-03-02 08:40:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO purchases VALUES(827, 2452, 45, TO_TIMESTAMP('2022-04-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));




--drop tables

DROP TABLE purchases;


--Q157:

CREATE TABLE transactions
(
  transaction_id INT,
  type VARCHAR(20),
  amount DECIMAL(10, 2),
  transaction_date TIMESTAMP
);

INSERT INTO transactions VALUES(19153, 'deposit', 65.90, TO_TIMESTAMP('2022-07-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(53151, 'deposit', 178.55, TO_TIMESTAMP('2022-07-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(29776, 'withdrawal', 25.90, TO_TIMESTAMP('2022-07-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(16461, 'withdrawal', 45.99, TO_TIMESTAMP('2022-07-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions VALUES(77134, 'deposit', 32.60, TO_TIMESTAMP('2022-07-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));



--drop tables

DROP TABLE transactions;


--Q158:

CREATE TABLE product_spend
(
  category VARCHAR(20),
  product VARCHAR(30),
  user_id INT,
  spend DECIMAL(10, 2),
  transaction_date TIMESTAMP
);

INSERT INTO product_spend VALUES('appliance', 'refrigerator', 165, 246.00, TO_TIMESTAMP('2021-12-26 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO product_spend VALUES('appliance', 'refrigerator', 123, 299.99, TO_TIMESTAMP('2022-03-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO product_spend VALUES('appliance', 'washing machine', 123, 219.80, TO_TIMESTAMP('2022-03-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO product_spend VALUES('electronics', 'vacuum', 178, 152.00, TO_TIMESTAMP('2022-04-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO product_spend VALUES('electronics', 'wireless headset', 156, 249.90, TO_TIMESTAMP('2022-07-08 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO product_spend VALUES('electronics', 'vacuum', 145, 189.00, TO_TIMESTAMP('2022-07-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));




--drop tables

DROP TABLE product_spend;


--Q159:

CREATE TABLE users
(
  user_id INT,
  signup_date TIMESTAMP,
  last_login TIMESTAMP
);

INSERT INTO users VALUES(1001, TO_TIMESTAMP('2022-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-07-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES(1002, TO_TIMESTAMP('2022-06-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES(1004, TO_TIMESTAMP('2022-06-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES(1006, TO_TIMESTAMP('2022-06-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-27 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES(1012, TO_TIMESTAMP('2022-06-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-07-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));




--drop tables

DROP TABLE users;


