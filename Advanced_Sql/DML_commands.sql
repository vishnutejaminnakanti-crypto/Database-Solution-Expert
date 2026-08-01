--q1
create table EmpTest as select * from Emp;

--q2
INSERT INTO EmpTest (empno, ename, sal)VALUES (9999, USER, 5000);

COMMIT;

--q3
UPDATE EmpTest SET sal = sal * 1.15 WHERE ename = 'TURNER';

COMMIT;

SELECT empno, ename, sal FROM EmpTest WHERE ename = 'TURNER';

--q4
UPDATE EmpTest SET sal = (SELECT sal FROM EmpTest WHERE empno = 7788)WHERE empno = 7369;
COMMIT;

--q5
UPDATE EmpTest SET sal = sal * 1.10 WHERE deptno IN (SELECT deptno FROM dept WHERE loc = 'NEW YORK');

COMMIT;

--q6
UPDATE EmpTest SET comm = NULL;

COMMIT;

--q7
DELETE FROM EmpTest WHERE deptno IN (SELECT deptno FROM dept WHERE dname = 'SALES');

COMMIT;

--q8
DELETE FROM EmpTest WHERE mgr = (SELECT empno FROM EmpTest WHERE ename = UPPER('&ENAME'));

COMMIT;

--q9
CREATE TABLE Emp2 AS SELECT empno, ename, sal FROM emp WHERE 1 = 2;

--q10
CREATE TABLE Emp3 AS SELECT empno, job FROM emp WHERE 1 = 2;

--q11
INSERT ALL
    INTO Emp2 (empno, ename, sal)
    VALUES (empno, ename, sal)

    INTO Emp3 (empno, job)
    VALUES (empno, job)

SELECT empno, ename, sal, job FROM emp;

COMMIT;

--q12
TRUNCATE TABLE Emp2;
INSERT INTO Emp2 (empno, ename, sal) VALUES (7788, 'SMITH', 4500);

INSERT INTO Emp2 (empno, ename, sal) VALUES (7654, 'JACK', 3500);

--q13
commit;

--q14
MERGE INTO Emp2 e2 USING emp e ON (e2.empno = e.empno)

WHEN MATCHED THEN UPDATE SET e2.ename = e.ename,e2.sal = e.sal

WHEN NOT MATCHED THEN INSERT (empno, ename, sal)VALUES (e.empno, e.ename, e.sal);

--q15
SELECT * FROM Emp2 ORDER BY empno;

--q16
rollback;

--q17
MERGE INTO Emp2 e2 USING emp e ON (e2.empno = e.empno)

WHEN MATCHED THEN UPDATE SET e2.ename = e.ename,e2.sal = e.sal WHERE e2.empno = 7788

WHEN NOT MATCHED THEN INSERT (empno, ename, sal)VALUES (e.empno, e.ename, e.sal)WHERE e.sal > 3000;

--q18
SELECT * FROM Emp2 ORDER BY empno;
