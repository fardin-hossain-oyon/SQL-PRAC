SELECT tablespace_name FROM DBA_TABLESPACES;

DROP TABLESPACE my_space INCLUDING CONTENTS;


CREATE TABLESPACE my_space
DATAFILE '/home/oracle/tablespaces/my_space.dbf'
SIZE 100M
AUTOEXTEND ON
NEXT 50M
MAXSIZE 1G;

COMMIT;


SELECT *
FROM DBA_TABLES
WHERE tablespace_name = 'MY_SPACE';


CREATE TABLESPACE remapped_my_space
DATAFILE '/home/oracle/tablespaces/remapped_my_space.dbf'
SIZE 100M
AUTOEXTEND ON
NEXT 50M
MAXSIZE 1G;

COMMIT;



SELECT *
FROM DBA_TABLES
WHERE tablespace_name = 'REMAPPED_MY_SPACE';












