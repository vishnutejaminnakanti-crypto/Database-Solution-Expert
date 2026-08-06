set serveroutput on;
--q1.Create a procedure to accept EMPNO and display ENAME, SAL and DEPTNO
CREATE OR REPLACE PROCEDURE emp_details
(
    p_empno IN emp.empno%TYPE
)
IS
    v_ename  emp.ename%TYPE;
    v_sal    emp.sal%TYPE;
    v_deptno emp.deptno%TYPE;
BEGIN
    SELECT ename, sal, deptno
    INTO v_ename, v_sal, v_deptno
    FROM emp
    WHERE empno = p_empno;

    DBMS_OUTPUT.PUT_LINE('Employee Number : ' || p_empno);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('Salary          : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Department No   : ' || v_deptno);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee Not Found');
END;
/
EXEC emp_details(7839);

--q2.Create a Function Add_Num()
CREATE OR REPLACE FUNCTION add_num
(
    p_num1 NUMBER,
    p_num2 NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN p_num1 + p_num2;
END;
/
SELECT add_num(10,20) AS Result FROM dual;

--q3.Display all Procedures and Functions using USER_SOURCE and Cursor
CREATE OR REPLACE PROCEDURE list_programs
IS
    CURSOR c_prog IS
        SELECT DISTINCT name, type
        FROM user_source
        WHERE type IN ('PROCEDURE','FUNCTION')
        ORDER BY type, name;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Stored Programs');
    DBMS_OUTPUT.PUT_LINE('------------------------------');

    FOR rec IN c_prog
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(rec.type,12) || rec.name
        );
    END LOOP;
END;
/
EXEC list_programs;