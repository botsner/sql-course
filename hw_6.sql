-- Homework-6 (GROUP functions, GROUP BY, HAVING)

/*
    1.  �������� ������ �� department_id � ����������� � ������������ 
        ���������, � ����� ������ � ����� ������� ����� ������� �� ������ � 
        � ����������� �����������. ����������� �� ���������� ����������� 
        (�� ��������).
*/
    SELECT department_id, 
        MIN(salary), 
        MAX(salary), 
        MIN(hire_date), 
        MAX(hire_date),
        COUNT(*)
    FROM employees
    GROUP BY department_id
    ORDER BY COUNT(*) DESC;
    
/*
    2.  �������� ���������� � ������ ����� ����� ���������� � ���������� 
        ���, ������� ���������� � ���� �����. �������� ������ ��� ����, ��� 
        ���������� ���, ������������ � �� ������ 1. ����������� �� 
        ����������.
*/
    SELECT SUBSTR(first_name, 1, 1), 
        COUNT(*)
    FROM employees
    GROUP BY SUBSTR(first_name, 1, 1)
    HAVING COUNT(*) > 1
    ORDER BY 2 DESC;
    
/*
    3.  �������� id ������������, �/� � ���������� �����������, ������� 
        �������� � ����� � ��� �� ������������ � �������� ���������� 
        ��������.
*/
    SELECT department_id, 
        salary, 
        COUNT(*)
    FROM employees
    GROUP BY department_id, salary;
    
/*
    4.  �������� ���� ������ � ���������� �����������, ������� ������� �� 
        ������ � ���� ����.
*/
    SELECT TO_CHAR(hire_date, 'Day'), 
        COUNT(*)
    FROM employees
    GROUP BY TO_CHAR(hire_date, 'Day');
    
/*
    5.  �������� id �������������, � ������� �������� ������ 30 
        ����������� � ����� �� �/�-� ������ 300000.
*/
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 30 AND SUM(salary) > 300000;
    
/*
    6.  �� ������� countries ������� ��� region_id, ��� ������� ����� ���� 
        ���� �� ����� ������ 50-��.
*/
    SELECT region_id
    FROM countries
    GROUP BY region_id
    HAVING SUM(LENGTH(country_name)) > 50;
    
/*
    7.  �������� ���������� � job_id � ����������� ������� �������� 
        ���������� ��� ������� job_id.
*/
    SELECT job_id, 
        ROUND(AVG(salary))
    FROM employees
    GROUP BY job_id;
    
/*
    8.  �������� ������ id �������������, � ������� �������� ����������
        ���������� (>1) job_id.
*/
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(DISTINCT job_id) > 1;

/*
    9.  �������� ���������� � department, job_id, ������������ � 
        ����������� �/� ��� ���� ��������� department_id - job_id, ��� 
        ������� �/� ������ 10000.
*/
    SELECT department_id, 
        job_id, 
        MAX(salary), 
        MIN(salary)
    FROM employees
    GROUP BY department_id, job_id
    HAVING AVG(salary) > 10000;
    
/*
    10. �������� ������ manager_id, � ������� ������� �������� ���� ��� 
        �����������, �� ������� ������������, ��������� � ���������� �� 
        6000 �� 9000.
*/
    SELECT manager_id
    FROM employees
    WHERE commission_pct IS NULL
    GROUP BY manager_id
    HAVING AVG(salary) BETWEEN 6000 AND 9000; 
    
/*
    11. �������� ���������� �� ����� (�� ��������) ������������ �������� 
        ����� ���� ������� ������� �� �������������.
*/
    SELECT ROUND(MAX(AVG(salary)), -3)
    FROM employees
    GROUP BY department_id;


