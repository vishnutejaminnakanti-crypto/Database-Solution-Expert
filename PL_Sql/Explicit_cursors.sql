--Q1. Delete Employees Based on JOB (Implicit Cursor)
SET SERVEROUTPUT ON;

ACCEPT p_job CHAR PROMPT 'Enter Job : '

BEGIN
    DELETE FROM emp
    WHERE job = UPPER('&p_job');

    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' record(s) deleted.');

    COMMIT;
END;
/

--Q2. Rollback the Previous Delete Statement
rollback;

--q4. Explicit Cursor - Employees Earning More Than Average Salary
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS
        SELECT empno, ename, sal
        FROM emp
        WHERE sal > (SELECT AVG(sal) FROM emp);

    v_emp c_emp%ROWTYPE;
BEGIN
    OPEN c_emp;

    LOOP
        FETCH c_emp INTO v_emp;
        EXIT WHEN c_emp%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_emp.empno || '  ' ||
            v_emp.ename || '  ' ||
            v_emp.sal
        );
    END LOOP;

    CLOSE c_emp;
END;
/

--q5.Explicit Cursor - Salary > 2000 and Joined After 15-JUN-1981
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS
        SELECT ename, sal, hiredate
        FROM emp
        WHERE sal > 2000
          AND hiredate > TO_DATE('15-JUN-1981','DD-MON-YYYY');

    v_emp c_emp%ROWTYPE;
BEGIN
    OPEN c_emp;

    LOOP
        FETCH c_emp INTO v_emp;
        EXIT WHEN c_emp%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_emp.ename ||
            ' earns ' || v_emp.sal ||
            ' and joined the organization on ' ||
            TO_CHAR(v_emp.hiredate,'DD-MON-YYYY')
        );
    END LOOP;

    CLOSE c_emp;
END;
/

--Q8. Parameter Cursor - Update STAR Column
ALTER TABLE emp ADD star VARCHAR2(20);
SET SERVEROUTPUT ON;

ACCEPT p_deptno NUMBER PROMPT 'Enter Department Number : '

DECLARE
    CURSOR c_emp(p_dno NUMBER) IS
        SELECT empno, sal
        FROM emp
        WHERE deptno = p_dno
        FOR UPDATE OF star;

    v_star VARCHAR2(20);
BEGIN
    FOR rec IN c_emp(&p_deptno)
    LOOP
        v_star := RPAD('*', TRUNC(rec.sal / 1000), '*');

        UPDATE emp
        SET star = v_star
        WHERE CURRENT OF c_emp;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Star column updated successfully.');
END;
/

--Q9. Parameter Cursor - Promote CLERK to SR CLERK and Increase Salary by 10%
SET SERVEROUTPUT ON;

ACCEPT p_job CHAR PROMPT 'Enter Job : '

DECLARE
    CURSOR c_emp(p_job emp.job%TYPE) IS
        SELECT empno, ename, sal
        FROM emp
        WHERE job = UPPER(p_job)
          AND sal > 1000
        FOR UPDATE OF job, sal;
BEGIN
    FOR rec IN c_emp('&p_job')
    LOOP
        UPDATE emp
        SET job = 'SR CLERK',
            sal = sal + (sal * 10 / 100)
        WHERE CURRENT OF c_emp;

        DBMS_OUTPUT.PUT_LINE(rec.empno || ' Promoted Successfully');
    END LOOP;

    COMMIT;
END;
/

--Q11. REF CURSOR
SET SERVEROUTPUT ON;

ACCEPT p_choice NUMBER PROMPT 'Enter Choice (1 or 2): '

DECLARE
    TYPE emp_ref IS REF CURSOR;

    c_emp emp_ref;

    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
    v_sal   emp.sal%TYPE;
BEGIN

    IF &p_choice = 1 THEN

        OPEN c_emp FOR
            SELECT empno, ename, sal
            FROM emp
            WHERE sal > 2000;

    ELSE

        OPEN c_emp FOR
            SELECT empno, ename, sal
            FROM emp
            WHERE sal < 2000;

    END IF;

    LOOP

        FETCH c_emp
        INTO v_empno, v_ename, v_sal;

        EXIT WHEN c_emp%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_empno || '  ' ||
            v_ename || '  ' ||
            v_sal
        );

    END LOOP;

    CLOSE c_emp;

END;
/

