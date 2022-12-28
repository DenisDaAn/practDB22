CREATE SCHEMA lab22_07_schema1;
CREATE SCHEMA lab22_07_schema2;
CREATE TABLE t1(x INTEGER);
CREATE TABLE lab22_07_schema2.t2(y INTEGER);
SET search_path = 'lab22_07_schema2';
ALTER TABLE t1 SET SCHEMA lab22_07_schema2;
CREATE TABLE t1(z INTEGER);
SELECT schemaname, tablename FROM pg_tables WHERE tableowner = 'postgres';
CREATE TABLE lab22_07_schema1.t2 (w INTEGER);
ALTER TABLE t1 SET SCHEMA lab22_07_schema1;

INSERT INTO lab22_07_schema2.t1 (x) SELECT 10 + random() * 5 FROM generate_series(1, 5);
INSERT INTO lab22_07_schema2.t2 (y) SELECT 20 + random() * 5 FROM generate_series(1, 5);
INSERT INTO lab22_07_schema1.t1 (z) SELECT 30 + random() * 5 FROM generate_series(1, 5);
INSERT INTO lab22_07_schema1.t2 (w) SELECT 40 + random() * 5 FROM generate_series(1, 5);


SELECT schemaname, relname, n_live_tup FROM pg_stat_user_tables;
SELECT * FROM t1;

SELECT * FROM lab22_07_schema1.t1 UNION SELECT * FROM lab22_07_schema2.t1;

SET search_path = "lab22_07_schema2";
SELECT * FROM t1;
DROP SCHEMA lab22_07_schema2 CASCADE;

SELECT schemaname, relname, n_live_tup FROM pg_stat_user_tables;
SET search_path = "public";
DROP TABLE t1;
DROP TABLE t2;
DROP SCHEMA lab22_07_schema1;
