--Q1. Handling Named Exceptions
CREATE TABLE messages(result VARCHAR2(1000));
SET SERVEROUTPUT ON;

ACCEPT p_sal NUMBER PROMPT 'Enter Salary : '

DECLARE
    v_ename emp.ename%TYPE;
BEGIN
    SELECT ename
    INTO v_ename
    FROM emp
    WHERE sal = &p_sal;

    INSERT INTO messages
    VALUES(v_ename || ' ' || &p_sal);

    COMMIT;

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        INSERT INTO messages
        VALUES('More than one employee with salary ' || &p_sal);

        COMMIT;

    WHEN NO_DATA_FOUND THEN
        INSERT INTO messages
        VALUES('No Employee with salary ' || &p_sal);

        COMMIT;

    WHEN OTHERS THEN
        INSERT INTO messages
        VALUES('Other Error');

        COMMIT;
END;
/
SELECT * FROM messages;

--q2.Unnamed System Defined Exception
SET SERVEROUTPUT ON;

ACCEPT p_empno NUMBER PROMPT 'Enter Employee Number : '
ACCEPT p_ename CHAR PROMPT 'Enter Employee Name : '
ACCEPT p_sal NUMBER PROMPT 'Enter Salary : '

BEGIN

    INSERT INTO emp(empno,ename,sal)
    VALUES(&p_empno,
           UPPER('&p_ename'),
           &p_sal);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Employee Inserted Successfully.');

EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);

END;
/