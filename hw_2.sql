-- Homework-2 (Introduction to SELECT)

/* 
    1.  �������� ��� ���������� � ��������.
*/
    SELECT * FROM regions;

/*
    2.  �������� ���������� � �����, id ������������, �������� � �������
        ��� ���� ����������.
*/
    SELECT first_name, department_id, salary, last_name
    FROM employees;

/* 
    3.  �������� ���������� � id ���������, ����������� ����� � ����,
        ������� ���� �� ������ �� ��������������� ��� ���� ����������.
        �������, ������� ����� ��������� ���� �������� One week before 
        hire date.
*/
    SELECT employee_id, email, hire_date-7 AS "One week before hire date"
    FROM employees;

/*
    4.  �������� ���������� � ���������� � �� ��������� � �������:
        Donald(SH_CLERK). �������� ������� our_employees.
*/
    SELECT first_name || '(' || job_id || ')' AS our_employees
    FROM employees;

/* 
    5.  �������� ������ ���������� ��� ����� ����������.
*/
    SELECT DISTINCT first_name
    FROM employees;

/*
    6. �������� ��������� ���������� �� ������� jobs:
        - job_title;
        - ��������� � �������: �min = 20080, max = 40000�, 
        ��� 20080 � ��� ����������� �/�, � 40000 � ������������,
        �������� ���� ������� info;
        - ������������ �/� � �������� ������� max;
        - ����� �/�, ������� ����� ���������� new_salary � ����������� ��
        �������: max_salary*2-2000.
*/
    SELECT job_title,
        'min = ' || min_salary || ', max = ' || max_salary AS info,
        max_salary AS max,
        max_salary*2-2000 AS new_salary
    FROM jobs;

/* 
     7. �������� �� ����� ����������� �Peter's dog is very clever�, ���������
        ���� �� ���� ������ ������ � ���������� ���������.
*/
    SELECT 'Peter''s dog is very clever'
    FROM dual;

/*
    8.  �������� �� ����� ����������� �Peter's dog is very clever�, ���������,
        �������� �� ����������� �������, ������� ������ � ����������
        ���������.
*/
    SELECT q'<Peter's dog is very clever>'
    FROM dual;

/* 
    9.  �������� �� ����� ���������� ����� � ����� ���� (1 ��� = 365.25
        ����).
*/
    SELECT 100*365.25*24*60
    FROM dual;


