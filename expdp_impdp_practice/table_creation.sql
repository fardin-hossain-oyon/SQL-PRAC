CREATE TABLE city_my_space
(
  id NUMBER(10),
  name VARCHAR(17),
  country_code VARCHAR(10),
  district VARCHAR(20),
  population NUMBER(20)
)
TABLESPACE my_space;

INSERT INTO city VALUES(6, 'Rotterdam' , 'NLD', 'Zuid-Holland', null);
INSERT INTO city VALUES(19, 'Zaanstad', 'NLD' , 'Noord-Holland', 135621);
INSERT INTO city VALUES(214, 'Porto Alegre', 'BRA', 'Rio Grande do Sul', 1314032);
INSERT INTO city VALUES(397, 'Lauro de Freitas', 'BRA', 'Bahia', 109236);

COMMIT;
