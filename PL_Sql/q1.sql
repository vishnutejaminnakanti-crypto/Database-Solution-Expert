SET SERVEROUTPUT ON;

ACCEPT p_empno NUMBER PROMPT 'Enter Employee Number: '

DECLARE
    v_sal     emp.sal%TYPE;
    v_comm    emp.comm%TYPE;
    v_netsal  NUMBER;
BEGIN
    SELECT sal, NVL(comm,0)
    INTO v_sal, v_comm
    FROM emp
    WHERE empno = &p_empno;

    v_netsal := v_sal + v_comm;

    DBMS_OUTPUT.PUT_LINE('Salary      : ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Commission  : ' || v_comm);
    DBMS_OUTPUT.PUT_LINE('Net Salary  : ' || v_netsal);
END;
/