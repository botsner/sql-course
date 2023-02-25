-- Homework-3 (Operators, WHERE, ORDER BY)

/*
    1.  �������� ������ ���� ����������� � ������ David.
*/
    SELECT * FROM employees
    WHERE first_name = 'David';

/*
    2.  �������� ������ ���� �����������, � ������� job_id ����� FI_ACCOUNT.
*/
    SELECT * FROM employees
    WHERE job_id = 'FI_ACCOUNT';

/*
    3.  �������� ���������� � �����, �������, �/� � ������ ������������ 
        ��� ����������� �� 50�� ������������ � ���������, ������� 4000.
*/
    SELECT first_name, last_name, salary, department_id
    FROM employees
    WHERE department_id = 50 AND salary > 4000;

/*
    4.  �������� ������ ���� �����������, ������� �������� ��� � 20�, ��� � 
        30� ������������.
*/
    SELECT * FROM employees
    WHERE department_id = 20 OR department_id = 30;

/*
    5.  �������� ������ ���� �����������, � ������� ������ � ��������� ����� 
        � ����� ����� 'a'.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '_a%a';

/*
    6.  �������� ������ ���� ����������� �� 50�� � �� 80�� ������������, � 
        ������� ���� �����(������������). ������������ ������ �� email
        (������������ �������), ��������� ��� ���������� �����.
*/
    SELECT * FROM employees
    WHERE department_id IN (50, 80)
      AND commission_pct IS NOT NULL
    ORDER BY 4;

/*
    7.  �������� ������ ���� �����������, � ������� � ����� ���������� 
        ������� 2 ����� 'n'.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '%n%n%';

/*
    8.  �������� ������ ���� �����������, � ������� ����� ����� ������ 4 
        ����. ������������ ������ �� ������ ������������ (��������� 
        �������) ���, ����� �������� �null� ���� � ����� �����.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '_____%'
    ORDER BY department_id DESC NULLS LAST;

/*
    9.  �������� ������ ���� �����������, � ������� �������� ��������� � 
        ���������� �� 3000 �� 7000 (������������), ��� ������ 
        (������������) � job_id ����� ��������� ���������: PU_CLERK, 
        ST_MAN, ST_CLERK.
*/
    SELECT * FROM employees
    WHERE salary BETWEEN 3000 AND 7000 
      AND commission_pct IS NULL 
      AND job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

/*
    10. �������� ������ ���� ����������� � ������� � ����� ���������� 
        ������ '%'.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '%\%%' ESCAPE '\';

/*
    11. �������� ���������� � job_id, ����� � �/� ��� ����������, ������� 
        id ������� ������ ��� ����� 120 � job_id �� ����� IT_PROG. 
        ������������ ������ �� job_id (������������ �������) � ������ 
        (��������� �������).
*/
    SELECT job_id, first_name, salary
    FROM employees
    WHERE employee_id >= 120 AND job_id != 'IT_PROG'
    ORDER BY job_id, first_name DESC;


