-- Homework-3 (Operators, WHERE, ORDER BY)

/*
    1.  ѕолучите список всех сотрудников с именем David.
*/
    SELECT * FROM employees
    WHERE first_name = 'David';

/*
    2.  ѕолучите список всех сотрудников, у которых job_id равен FI_ACCOUNT.
*/
    SELECT * FROM employees
    WHERE job_id = 'FI_ACCOUNT';

/*
    3.  ¬ыведите информацию о имени, фамилии, з/п и номере департамента 
        дл¤ сотрудников из 50го департамента с зарплатой, большей 4000.
*/
    SELECT first_name, last_name, salary, department_id
    FROM employees
    WHERE department_id = 50 AND salary > 4000;

/*
    4.  ѕолучите список всех сотрудников, которые работают или в 20м, или в 
        30м департаменте.
*/
    SELECT * FROM employees
    WHERE department_id = 20 OR department_id = 30;

/*
    5.  ѕолучите список всех сотрудников, у которых втора¤ и последн¤¤ буква 
        в имени равна 'a'.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '_a%a';

/*
    6.  ѕолучите список всех сотрудников из 50го и из 80го департамента, у 
        которых есть бонус(комиссионные). ќтсортируйте строки по email
        (возрастающий пор¤док), использу¤ его пор¤дковый номер.
*/
    SELECT * FROM employees
    WHERE department_id IN (50, 80)
      AND commission_pct IS NOT NULL
    ORDER BY 4;

/*
    7.  ѕолучите список всех сотрудников, у которых в имени содержатс¤ 
        минимум 2 буквы 'n'.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '%n%n%';

/*
    8.  ѕолучить список всех сотрудников, у которых длина имени больше 4 
        букв. ќтсортируйте строки по номеру департамента (убывающий 
        пор¤док) так, чтобы значени¤ УnullФ были в самом конце.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '_____%'
    ORDER BY department_id DESC NULLS LAST;

/*
    9.  ѕолучите список всех сотрудников, у которых зарплата находитс¤ в 
        промежутке от 3000 до 7000 (включительно), нет бонуса 
        (комиссионных) и job_id среди следующих вариантов: PU_CLERK, 
        ST_MAN, ST_CLERK.
*/
    SELECT * FROM employees
    WHERE salary BETWEEN 3000 AND 7000 
      AND commission_pct IS NULL 
      AND job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

/*
    10. ѕолучите список всех сотрудников у которых в имени содержитс¤ 
        символ '%'.
*/
    SELECT * FROM employees
    WHERE first_name LIKE '%\%%' ESCAPE '\';

/*
    11. ¬ыведите информацию о job_id, имене и з/п дл¤ работников, рабочий 
        id которых больше или равен 120 и job_id не равен IT_PROG. 
        ќтсортируйте строки по job_id (возрастающий пор¤док) и именам 
        (убывающий пор¤док).
*/
    SELECT job_id, first_name, salary
    FROM employees
    WHERE employee_id >= 120 AND job_id != 'IT_PROG'
    ORDER BY job_id, first_name DESC;


