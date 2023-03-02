-- Homework-5 (CONVERSION, GENERAL, CONDITIONAL functions)

/*
    1.  ��������� �������, �������� ������ ���� ����������� � ������� � 
        ����� ���� ����� 'b' (��� ����� ��������).
*/
    SELECT * FROM employees
    WHERE INSTR(LOWER(first_name), 'b') > 0;

/*
    2.  ��������� �������, �������� ������ ���� ����������� � ������� � 
        ����� ���������� ������� 2 ����� 'a'.
*/
    SELECT * FROM employees
    WHERE INSTR(LOWER(first_name), 'a', 1, 2) > 0;

/*
    3.  �������� ������ ����� �� ����� ������������, ��� ��� �������������, 
        � ������� �������� ������� ������, ��� �� ������ �����.
*/
    SELECT SUBSTR(department_name, 1, INSTR(department_name, ' ') - 1)
    FROM departments
    WHERE INSTR(department_name, ' ') > 0;

/*
    4.  �������� ����� ����������� ��� ������ � ��������� ����� � �����.
*/
    SELECT first_name, 
        SUBSTR(first_name, 2, LENGTH(first_name) - 2) AS new_name
    FROM employees;

/*
    5.  �������� ������ ���� �����������, � ������� � �������� job_id ����� 
        ����� '_' ��� ������� 3 �������, �� ��� ���� ��� �������� ����� '_' �� 
        ����� 'CLERK'.
*/
    SELECT * FROM employees
    WHERE LENGTH(SUBSTR(job_id, INSTR(job_id, '_') + 1)) >= 3
      AND SUBSTR(job_id, INSTR(job_id, '_') + 1) != 'CLERK';

/*
    6.  �������� ������ ���� �����������, ������� ������ �� ������ � 
        ������ ���� ������ ������.
*/
    SELECT * FROM employees
    WHERE TO_CHAR(hire_date, 'DD') = '01';

/*
    7.  �������� ������ ���� �����������, ������� ������ �� ������ � 
        2008-�� ����.
*/
    SELECT * FROM employees
    WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

/*
    8.  �������� ���������� ���� � �������: Tomorrow is Second day of January
*/
    SELECT TO_CHAR(SYSDATE + 1, 'fm"Tomorrow is" DdSPTH "day of" Month') AS info
    FROM dual;

/*
    9.  �������� ��� ���������� � ���� ��� ������� �� ������ � �������: 
        21st of June, 2007
*/
    SELECT first_name,
        TO_CHAR(hire_date, 'fmddTH "of" Month, YYYY') AS hire_date
    FROM employees;

/*
    10. �������� ������ ���������� � ������������ ���������� �� 20%. 
        �������� �������� � �������: $28,800.00
*/
    SELECT first_name, 
        TO_CHAR(salary * 1.2, '$999,999.00') AS new_salary
    FROM employees;

/*
    11. �������� ���������� ���� (��������), + �������, + ������, + ���, + 
        ����, + �����, + ���. (�� ��� �� ����������� ������������ � 
        ���������� ����).
*/
    SELECT SYSDATE                      now, 
        SYSDATE + 1 / (24 * 60 * 60)    plus_second,
        SYSDATE + 1 / (24 * 60)         plus_minute,
        SYSDATE + 1 / 24                plus_hour,
        SYSDATE + 1                     plus_day,
        ADD_MONTHS(SYSDATE, 1)          plus_month,
        ADD_MONTHS(SYSDATE, 12)         plus_year
    FROM dual;

/*
    12. �������� ��� ����������, ��� �/� � ����� �/�, ������� ����� ������ 
        ���� ��� �������� ������ �$12,345.55�.
*/
    SELECT first_name, 
        salary,
        salary + TO_NUMBER('$12,345.55', '$99,999.99') AS new_salary
    FROM employees;

/*
    13. �������� ��� ����������, ���� ��� ���������������, � ����� 
        ���������� ������� ����� ��� ��� ��������������� � �����, ������� 
        ���������� �������� �� ������ �SEP, 18:45:00 18 2009�.
*/
    SELECT first_name, 
        hire_date,
        MONTHS_BETWEEN(
            TO_DATE('SEP, 18:45:00 18 2009', 'MON, HH24:SS:MI DD YYYY'), 
            hire_date
        ) AS months_count
    FROM employees;

/*
    14. �������� ��� ����������, ��� �/�, � ����� ������ �/� (salary + 
        commission_pct(%)) � �������: $24,000.00
*/
    SELECT first_name, 
        salary, 
        TO_CHAR(
            salary + salary * NVL(commission_pct, 0), 
            '$999,999.99'
        ) AS full_salary
    FROM employees;
        

/*
    15. �������� ��� ����������, ��� �������, � ����� ��������� �different 
        length�, ���� ����� ����� �� ����� ����� ������� ��� ��������� 
        �same length�, ���� ����� ����� ����� ����� �������. �� 
        ����������� conditional functions.
*/
    SELECT first_name, 
        last_name, 
        NVL2(
            NULLIF(LENGTH(first_name), LENGTH(last_name)), 
            'different length', 
            'same length'
        ) AS equality
    FROM employees;

/*
    16. �������� ��� ����������, ��� ������������, � ����� ���������� � 
        ������� ������� � �������� � ���� �� � ���� ������������ (Yes/No).
*/
    SELECT first_name, 
        commission_pct, 
        NVL2(commission_pct, 'Yes', 'No') AS has_bonus
    FROM employees;

/*
    17. �������� ��� ���������� � �������� ������� ��� ����� 
        ���������������: �������� ������������, ���� ������������, ���� ���, 
        �� id ��� ���������, ���� � ��� �����������, �� ��� �/�.
*/
    SELECT first_name, 
        COALESCE(commission_pct, manager_id, salary) AS info
    FROM employees;

/*
    18. �������� ��� ����������, ��� �/�, � ����� ������� �������� ������� 
        ����������: ������ 5000 ��������� Low level, ������ ��� ����� 5000 
        � ������ 10000 ��������� Normal level, ������ ��� ����� 10000 
        ��������� High level.
*/
    SELECT first_name, 
        salary, 
        CASE
            WHEN salary < 5000 THEN 'Low level'
            WHEN salary >= 5000 AND salary < 10000 THEN 'Normal level'
            WHEN salary >= 10000 THEN 'High level'
        END AS salary_level
    FROM employees;

/*
    19. ��� ������ ������ �������� ������, � ������� ��� ���������: 1-
        Europe, 2-America, 3-Asia, 4-Africa . ��������� ������ �������, 
        �� ��������� ���������� JOIN. ����������� DECODE.
*/
    SELECT country_name, 
        DECODE(region_id, 
            1, 'Europe', 
            2, 'America', 
            3, 'Asia', 
            4, 'Africa',
            'Unknown'
        ) AS region
    FROM countries;

/*
    20. ������ �19 ������ ��������� CASE.
*/
    SELECT country_name,
        CASE region_id
            WHEN 1 THEN 'Europe'
            WHEN 2 THEN 'America'
            WHEN 3 THEN 'Asia'
            WHEN 4 THEN 'Africa'
            ELSE 'Unknown'
        END AS region
    FROM countries;

/*
    21. �������� ��� ����������, ��� �/�, � ����� ������� ����, ��������� � 
        ���������� ������� �������: 
        - BAD: �/� ������ 10000 � ���������� ������������;
        - NORMAL: �/� ����� 10000 � 15000 ���, ���� ������������ 
        ������������;
        - GOOD: �/� ������ ��� ����� 15000.
*/
    SELECT first_name, 
        salary,
        CASE 
            WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD'
            WHEN salary BETWEEN 10000 AND 15000 
              OR commission_pct IS NOT NULL THEN 'NORMAL'
            WHEN salary >= 15000 THEN 'GOOD'
        END AS work_conditions
    FROM employees;


