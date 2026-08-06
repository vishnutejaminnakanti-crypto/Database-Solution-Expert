SET SERVEROUTPUT ON;

-------------------------------------------------------
-- QUESTION 1 : ADD_DEPT
-------------------------------------------------------
CREATE OR REPLACE PROCEDURE add_dept(
    p_deptno IN dept.deptno%TYPE,
    p_dname  IN dept.dname%TYPE,
    p_loc    IN dept.loc%TYPE)
IS
    e_duplicate EXCEPTION;
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM dept WHERE deptno=p_deptno;
    IF v_count>0 THEN
        RAISE e_duplicate;
    END IF;

    INSERT INTO dept(deptno,dname,loc)
    VALUES(p_deptno,p_dname,p_loc);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Department Inserted Successfully');

EXCEPTION
    WHEN e_duplicate THEN
        DBMS_OUTPUT.PUT_LINE('Department Number Already Exists');
END;
/

EXEC add_dept(50,'TRAINING','HYDERABAD');

-------------------------------------------------------
-- QUESTION 2 : UPDATE_DEPT
-------------------------------------------------------
CREATE OR REPLACE PROCEDURE update_dept(
    p_deptno IN dept.deptno%TYPE,
    p_dname  IN dept.dname%TYPE,
    p_loc    IN dept.loc%TYPE)
IS
BEGIN
    UPDATE dept
    SET dname=p_dname,
        loc=p_loc
    WHERE deptno=p_deptno;

    IF SQL%ROWCOUNT=0 THEN
        RAISE NO_DATA_FOUND;
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Department Updated Successfully');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department Number Does Not Exist');
END;
/

EXEC update_dept(50,'SALES','CHENNAI');

-------------------------------------------------------
-- QUESTION 3 : DELETE_DEPT
-------------------------------------------------------
CREATE OR REPLACE PROCEDURE delete_dept(
    p_deptno IN dept.deptno%TYPE)
IS
BEGIN
    DELETE FROM dept
    WHERE deptno=p_deptno;

    IF SQL%ROWCOUNT=0 THEN
        RAISE NO_DATA_FOUND;
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Department Deleted Successfully');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department Number Does Not Exist');
END;
/

EXEC delete_dept(50);

-------------------------------------------------------
-- QUESTION 4 : WIPRO USER
-------------------------------------------------------
-- Login as SYS
-- GRANT EXECUTE ON add_dept TO wipro;
-- Login as WIPRO
-- EXEC scott.add_dept(60,'HR','VIJAYAWADA');

-------------------------------------------------------
-- QUESTION 5 : INVALID / VALID
-------------------------------------------------------
ALTER TABLE dept ADD x NUMBER;

SELECT object_name,status
FROM user_objects
WHERE object_name IN ('ADD_DEPT','UPDATE_DEPT','DELETE_DEPT');

ALTER PROCEDURE add_dept COMPILE;
ALTER PROCEDURE update_dept COMPILE;
ALTER PROCEDURE delete_dept COMPILE;

SELECT object_name,status
FROM user_objects
WHERE object_name IN ('ADD_DEPT','UPDATE_DEPT','DELETE_DEPT');

ALTER TABLE dept DROP COLUMN x;

-------------------------------------------------------
-- QUESTION 6 : WRAP
-------------------------------------------------------
-- Command Prompt:
-- wrap iname=Creating_Procedures.sql oname=add_dept_wrap.sql

-------------------------------------------------------
-- QUESTION 7 : EMP_TRANSFER
-------------------------------------------------------
CREATE TABLE emp_test AS
SELECT * FROM emp WHERE 1=2;
/

CREATE OR REPLACE PROCEDURE emp_transfer(p_deptno NUMBER)
IS
CURSOR c_emp(p_dno NUMBER) IS
SELECT * FROM emp
WHERE deptno=p_dno
FOR UPDATE OF sal;
BEGIN
FOR rec IN c_emp(p_deptno)
LOOP
INSERT INTO emp_test
VALUES(rec.empno,rec.ename,rec.job,rec.mgr,rec.hiredate,
rec.sal,rec.comm,rec.deptno);

UPDATE emp
SET sal=sal+(sal*20/100)
WHERE CURRENT OF c_emp;
END LOOP;

COMMIT;
DBMS_OUTPUT.PUT_LINE('Employees Copied Successfully');
END;
/

EXEC emp_transfer(20);

-------------------------------------------------------
-- QUESTION 8 : MOVE_EMP
-------------------------------------------------------
CREATE TABLE test AS
SELECT * FROM emp WHERE 1=2;
/

CREATE OR REPLACE PROCEDURE move_emp(p_deptno NUMBER)
IS
CURSOR c_emp(p_dno NUMBER) IS
SELECT * FROM emp
WHERE deptno=p_dno
FOR UPDATE;
BEGIN
FOR rec IN c_emp(p_deptno)
LOOP
INSERT INTO test
VALUES(rec.empno,rec.ename,rec.job,rec.mgr,rec.hiredate,
rec.sal,rec.comm,rec.deptno);

DELETE FROM emp
WHERE CURRENT OF c_emp;
END LOOP;

COMMIT;
DBMS_OUTPUT.PUT_LINE('Employees Moved Successfully');
END;
/

EXEC move_emp(30);

-------------------------------------------------------
-- QUESTION 9 : GET_EMP
-------------------------------------------------------
CREATE OR REPLACE PROCEDURE get_emp(
p_empno IN emp.empno%TYPE,
p_ename OUT emp.ename%TYPE,
p_sal OUT emp.sal%TYPE)
IS
BEGIN
SELECT ename,sal
INTO p_ename,p_sal
FROM emp
WHERE empno=p_empno;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Employee Not Found');
END;
/

VARIABLE v_name VARCHAR2(20)
VARIABLE v_sal NUMBER

EXEC get_emp(7788,:v_name,:v_sal);

PRINT v_name
PRINT v_sal

-------------------------------------------------------
-- QUESTION 10 : FORMAT_MOBILE
-------------------------------------------------------
CREATE OR REPLACE PROCEDURE format_mobile(
p_mobile IN OUT VARCHAR2)
IS
BEGIN
p_mobile:='('||SUBSTR(p_mobile,1,3)||')'
||SUBSTR(p_mobile,4,3)
||'-'
||SUBSTR(p_mobile,7,4);
END;
/

VARIABLE phone VARCHAR2(20)

EXEC :phone:='9999999999';

EXEC format_mobile(:phone);

PRINT phone