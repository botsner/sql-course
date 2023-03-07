-- Homework-8 (SUBQUERY)

/*
    1.  Выведите всю информацию о сотрудниках, с самым длинным именем.
*/
    SELECT * 
    FROM employees
    WHERE LENGTH(first_name) = (
            SELECT MAX(LENGTH(first_name)) 
            FROM employees
        );

/*
    2.  Выведите всю информацию о сотрудниках, с зарплатой большей 
        средней зарплаты всех сотрудников.
*/
    SELECT * 
    FROM employees
    WHERE salary > (
            SELECT AVG(salary) 
            FROM employees
        );

/*
    3.  Получить город/города, где сотрудники в сумме зарабатывают меньше 
        всего.
*/
    SELECT city
    FROM employees e
        JOIN departments d ON (e.department_id = d.department_id)
        JOIN locations l ON (d.location_id = l.location_id)
    GROUP BY city
    HAVING SUM(salary) = (
            SELECT MIN(SUM(salary)) 
            FROM employees e
                JOIN departments d ON (e.department_id = d.department_id)
                JOIN locations l ON (d.location_id = l.location_id)
            GROUP BY city
        );

/*
    4.  Выведите всю информацию о сотрудниках, у которых менеджер 
        получает зарплату больше 15000.
*/
    SELECT * 
    FROM employees
    WHERE manager_id IN (
            SELECT employee_id FROM employees
            WHERE salary > 15000
        );
    
    SELECT * 
    FROM employees emp
    WHERE manager_id = ( -- коррелированный подзапрос
            SELECT employee_id FROM employees
            WHERE employee_id = emp.manager_id
                AND salary > 15000
        );

/*
    5.  Выведите всю информацию о департаментах, в которых нет ни одного 
        сотрудника.
*/
    SELECT *
    FROM departments
    WHERE department_id NOT IN (
            SELECT DISTINCT department_id 
            FROM employees
            WHERE department_id IS NOT NULL
        );

/*
    6.  Выведите всю информацию о сотрудниках, которые не являются 
        менеджерами.
*/
    SELECT *
    FROM employees
    WHERE employee_id NOT IN (
            SELECT DISTINCT manager_id
            FROM employees
            WHERE manager_id IS NOT NULL
        );

/*
    7.  Выведите всю информацию о менеджерах, которые имеют в 
        подчинении больше 6-ти сотрудников.
*/
    SELECT *
    FROM employees
    WHERE employee_id IN (
            SELECT manager_id 
            FROM employees
            GROUP BY manager_id
            HAVING COUNT(*) > 6
        );
    
    SELECT * 
    FROM employees emp
    WHERE ( -- коррелированный подзапрос
            SELECT COUNT(*) 
            FROM employees
            WHERE manager_id = emp.employee_id
        ) > 6;

/*
    8.  Выведите всю информацию о сотрудниках, которые работают в 
        департаменте с названием IT.
*/
    SELECT *
    FROM employees
    WHERE department_id = (
            SELECT department_id 
            FROM departments
            WHERE department_name = 'IT'
        );

/*
    9.  Выведите всю информацию о сотрудниках, менеджеры которых 
        устроились на работу в 2005-ом году, но при это сами работники 
        устроились на работу до 2005 года.
*/
    SELECT *
    FROM employees
    WHERE manager_id IN (
            SELECT employee_id 
            FROM employees 
            WHERE TO_CHAR(hire_date, 'YYYY') = '2005'
        )
        AND hire_date < TO_DATE('01-01-2005', 'DD-MM-YYYY');

/*
    10. Выведите всю информацию о сотрудниках, менеджеры которых 
        устроились на работу в январе любого года, и длина job_title этих 
        сотрудников больше 15-ти символов.
*/
    SELECT *
    FROM employees
    WHERE manager_id IN (
            SELECT employee_id 
            FROM employees
            WHERE TO_CHAR(hire_date, 'MM') = '01'
        )
        AND job_id IN (
            SELECT job_id 
            FROM jobs
            WHERE LENGTH(job_title) > 15
        );


