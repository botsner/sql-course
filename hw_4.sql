-- Homework-4 (SINGLE-ROW functions)

/*
    1.  �������� ������ ���� �����������, � ������� ����� ����� ������ 10 
        ����.
*/
    SELECT * FROM employees
    WHERE LENGTH(first_name) > 10;

/*
    2.  �������� ������ ���� �����������, �������� ������� ������ 1000.
*/
    SELECT * FROM employees
    WHERE MOD(salary, 1000) = 0;

/*
    3.  �������� ���������� ����� � ������ 3-� ������� ����� ����������� 
        ������ ����������, ���� ��� ����� ����������� � �������
        ���.���.����
*/
    SELECT phone_number, SUBSTR(phone_number, 1, 3)
    FROM employees
    WHERE phone_number LIKE '___.___.____';

/*
    4.  �������� ������ ���� �����������, � ������� ��������� ����� � ����� 
        ����� 'm' � ����� ����� ������ 5-��.
*/
    SELECT * FROM employees
    WHERE SUBSTR(first_name, -1) = 'm'
      AND LENGTH(first_name) > 5;

/*
    5.  �������� ���� ��������� �������.
*/
    SELECT NEXT_DAY(SYSDATE, 'FRIDAY') AS next_friday
    FROM dual;
    
/*
    6.  �������� ������ ���� �����������, ������� �������� � �������� 
        ������ 12 ��� � 6-�� ������� (150 �������).
*/
    SELECT * FROM employees
    WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 150;

/*
    7.  �������� ���������� �����, ������� � �������� PHONE_NUMBER ��� 
        '.' �� '-'.
*/
    SELECT REPLACE(phone_number, '.', '-') 
    FROM employees;

/*
    8.  �������� ���, email, job_id ��� ���� ���������� � �������: 
        STEVEN sking Ad_Pres
*/
    SELECT UPPER(first_name), 
        LOWER(email), 
        INITCAP(job_id)
    FROM employees;

/*
    9.  �������� ���������� � ����� ��������� � ��� �/�, �� ��������� 
        ������ || , � ����� ����: Steven24000
*/
    SELECT CONCAT(first_name, salary)
    FROM employees;

/*
    10. �������� ���������� � ���� ����� ���������� �� ������, 
        ���������� ���� ����� �� ������ �� ������ � ������ ��� ���� 
        ����� �� ������.
*/
    SELECT hire_date, 
        ROUND(hire_date, 'MM'), 
        TRUNC(hire_date, 'YYYY')
    FROM employees;

/*
    11. �������� ���������� � ����� � ������� ���� ����������. ��� 
        ������ �������� �� 10 �������� � ���� ����� ����� ������ 10, �� 
        ���������� �� 10 �������� ������ $. ������� ������ �������� �� 15 
        �������� � ���� ����� ������� ������ 15, �� ����� �������� 
        ������� ������� ������ ! ������� ����������.
*/
    SELECT RPAD(first_name, 10, '$'), 
        LPAD(last_name, 15, '!')
    FROM employees;

/*
    12. �������� ��� ���������� � ������� ������ ����� �a� � ��� �����.
*/
    SELECT first_name, INSTR(first_name, 'a', 1, 2)
    FROM employees;

/*
    13. �������� �� ����� ����� '!!!HELLO!! MY FRIEND!!!!!!!!' � ��� �� �����, 
    �� ��� ������� ��������������� ���� � ������ � ����� ������.
*/
    SELECT '!!!HELLO!! MY FRIEND!!!!!!!!', 
        TRIM('!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!')
    FROM dual;

/*
    14. �������� ���������� �:
        - �/� ���������,
        - �/� ���������� �� ����������� 3.1415,
        - ���������� �� ������ �������� ������� ����������� �/�,
        - ����� ���������� ����� �� ����������� �/�.
*/
    SELECT salary,
        salary * 3.1415,
        ROUND(salary * 3.1415),
        TRUNC(salary * 3.1415, -3)/1000
    FROM employees;

/*
    15. �������� ���������� �:
        - ���� ����� ���������� �� ������,
        - ����, ������� ���� ����� ��� ����, ����� �������� ���������� �� 
        ������,
        - ���� ���������� ��� � ������ �������� ���������� �� ������.
*/
    SELECT hire_date, 
        ADD_MONTHS(hire_date, 6), 
        LAST_DAY(hire_date)
    FROM employees;


