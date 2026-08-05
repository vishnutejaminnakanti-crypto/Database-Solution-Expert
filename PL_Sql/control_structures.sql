--q1.Insert or Update Employee Based on EMPNO
SET SERVEROUTPUT ON;

ACCEPT p_empno NUMBER PROMPT 'Enter Employee Number : '
ACCEPT p_ename CHAR PROMPT 'Enter Employee Name   : '
ACCEPT p_sal NUMBER PROMPT 'Enter Salary          : '

DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM emp
    WHERE empno = &p_empno;

    IF v_count = 0 THEN
        INSERT INTO emp(empno, ename, sal)
        VALUES(&p_empno, UPPER('&p_ename'), &p_sal);

        DBMS_OUTPUT.PUT_LINE('Employee Inserted Successfully.');

    ELSE
        UPDATE emp
        SET ename = UPPER('&p_ename'),
            sal = &p_sal
        WHERE empno = &p_empno;

        DBMS_OUTPUT.PUT_LINE('Employee Updated Successfully.');
    END IF;

    COMMIT;
END;
/

--q2.Update Salary Based on Department
SET SERVEROUTPUT ON;

ACCEPT p_empno NUMBER PROMPT 'Enter Employee Number : '

DECLARE
    v_deptno emp.deptno%TYPE;
    v_sal    emp.sal%TYPE;
    v_comm   emp.comm%TYPE;
BEGIN
    SELECT deptno, sal, NVL(comm,0)
    INTO v_deptno, v_sal, v_comm
    FROM emp
    WHERE empno = &p_empno;

    IF v_deptno = 10 THEN

        UPDATE emp
        SET sal = sal + (sal * 10 / 100)
        WHERE empno = &p_empno;

        DBMS_OUTPUT.PUT_LINE('Salary Updated by 10%');

    ELSIF v_deptno = 20 THEN

        UPDATE emp
        SET sal = sal + (sal * 15 / 100)
        WHERE empno = &p_empno;

        DBMS_OUTPUT.PUT_LINE('Salary Updated by 15%');

    ELSE

        UPDATE emp
        SET sal = sal + NVL(comm,0)
        WHERE empno = &p_empno;

        DBMS_OUTPUT.PUT_LINE('Salary Updated with Salary + Commission');

    END IF;

    COMMIT;
END;
/
