--q.Display Entire Employee Record using %ROWTYPE
SET SERVEROUTPUT ON;

ACCEPT p_empno NUMBER PROMPT 'Enter Employee Number : '

DECLARE
    v_emp emp%ROWTYPE;
BEGIN
    SELECT *
    INTO v_emp
    FROM emp
    WHERE empno = &p_empno;

    DBMS_OUTPUT.PUT_LINE('Employee Number : ' || v_emp.empno);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || v_emp.ename);
    DBMS_OUTPUT.PUT_LINE('Job             : ' || v_emp.job);
    DBMS_OUTPUT.PUT_LINE('Manager         : ' || v_emp.mgr);
    DBMS_OUTPUT.PUT_LINE('Hire Date       : ' || TO_CHAR(v_emp.hiredate,'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Salary          : ' || v_emp.sal);
    DBMS_OUTPUT.PUT_LINE('Commission      : ' || NVL(v_emp.comm,0));
    DBMS_OUTPUT.PUT_LINE('Department No   : ' || v_emp.deptno);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee Number does not exist.');
END;
/