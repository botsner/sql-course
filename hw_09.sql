-- Homework-9 (SET operators)

/*
    1.  Выведите в одном репорте информацию о суммах з/п групп, 
        объединённых по id менеджера, по job_id, по id департамента. Репорт 
        должен содержать 4 столбца: id менеджера, job_id, id департамента, 
        суммированная з/п.
*/
    SELECT manager_id, TO_CHAR(null) job_id, TO_NUMBER(null) department_id, SUM(salary) 
    FROM employees
    GROUP BY manager_id
        UNION
    SELECT TO_NUMBER(null), job_id, TO_NUMBER(null), SUM(salary) 
    FROM employees
    GROUP BY job_id
        UNION
    SELECT TO_NUMBER(null), TO_CHAR(null), department_id, SUM(salary) 
    FROM employees
    GROUP BY department_id;

/*
    2.  Выведите id тех департаментов, где работает менеджер № 100 и не 
        работают менеджеры № 145, 201.
*/
    SELECT department_id FROM employees
    WHERE manager_id = 100
        MINUS
    SELECT department_id FROM employees
    WHERE manager_id IN (145, 201);

/*
    3.  Используя SET операторы и не используя логические операторы, 
        выведите уникальную информацию о именах, фамилиях и з/п 
        сотрудников, второй символ в именах которых буква «а», и фамилия 
        содержит букву «s» вне зависимости от регистра. Отсортируйте 
        результат по з/п по убыванию.
*/
    SELECT first_name, last_name, salary 
    FROM employees 
    WHERE first_name LIKE '_a%'
        INTERSECT 
    SELECT first_name, last_name, salary 
    FROM employees 
    WHERE LOWER(last_name) LIKE '%s%'
    ORDER BY salary DESC;

/*
    4.  Используя SET операторы и не используя логические операторы, 
        выведите информацию о id локаций, почтовом коде и городе для 
        локаций, которые находятся в Италии или Германии. А также для 
        локаций, почтовый код которых содержит цифру «9». 
*/
    SELECT location_id, postal_code, city
    FROM locations
    WHERE country_id IN (
            SELECT country_id FROM countries
            WHERE country_name IN ('Germany', 'Italy'))
        UNION ALL
    SELECT location_id, postal_code, city
    FROM locations
    WHERE postal_code LIKE '%9%';

/*
    5.  Используя SET операторы и не используя логические операторы, 
        выведите всю уникальную информацию для стран, длина имён 
        которых больше 8 символов. А также для стран, которые находятся не в 
        европейском регионе. Столбцы аутпута должны называться id, country, 
        region. Аутпут отсортируйте по названию стран по убывающей.
*/
    SELECT country_id id, country_name country, region_id region 
    FROM countries 
    WHERE LENGTH(country_name) > 8
        UNION
    SELECT * 
    FROM countries
    WHERE region_id != (
            SELECT region_id FROM regions 
            WHERE region_name = 'Europe')
    ORDER BY country DESC;


